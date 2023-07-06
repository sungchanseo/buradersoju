package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.PagingService;
import com.itwillbs.service.WorkOrderService;

@Controller
@RequestMapping(value = "/workOrder/*")
public class WorkOrderController {
	
	// 서비스 객체 주입

	@Inject
	private WorkOrderService woService;
	@Inject
	private PagingService pageService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderController.class);
	
		// http://localhost:8088/workOrder/insert
		// http://localhost:8088/workOrder/list
		// http://localhost:8088/workOrder/info?production_id=PR230615001
		
		////// 작업지시 등록 //////
		// 작업지시 등록 페이지
		@RequestMapping(value = "insert",method = RequestMethod.GET)
		public void insertGET(Model model) throws Exception{
			logger.debug(" insertGET() 호출! ");
			logger.debug(" /production/workOrderInsert.jsp 페이지 이동 ");
			
			// 테이블의 정보를 가져와서 모델에 추가
			List<ProductionVO> workOrderList = woService.getWorkOrderList();
			model.addAttribute("workOrderList",workOrderList);
		}
		
		// 작업지시 등록 - 수주 정보 조회
		@RequestMapping(value="/contSearch",  produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String searchListGET(String cont_id) throws Exception {
			
			//자바에서 JSON 객체로 변환
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			logger.info("@@@@@@@ cont_id : "+cont_id);
			
			//servicer객체 호출
			ProductionVO getWoInsertSearch = woService.getWoInsertSearch(cont_id);
			hashMap.put("vo", getWoInsertSearch);
			
			String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
			System.out.println("@@@@@@@ json : "+json);
			
			return json;
		}
		
		// 작업지시 등록 - 자재 재고 조회
		@RequestMapping(value = "/materialSearch")
		@ResponseBody
		public List<ProductionVO> materialSearch(Model model,
								   String product_id) throws Exception{
			logger.debug(" materialSearch(Model model, String product_id) 호출! ");
			logger.debug("product_id : "+product_id);
			
			// 테이블의 정보를 가져와서 모델에 추가
			List<ProductionVO> materialList = woService.getMaterialList(product_id);
			model.addAttribute("materialList",materialList);
			return materialList;
		}

		// 작업지시 등록 db처리
				@RequestMapping(value="/workOrderInsert", method=RequestMethod.POST)
				public void insertWorkOrder(ProductionVO vo, @RequestParam(value="ma_nameList") List<String> ma_nameList,
				         @RequestParam(value="ma_qtyList") List<String> ma_qtyList ) throws Exception {
					logger.debug("@@@@@@@@@@@@Controller : 작업지시 등록 DB저장 시작");
					
//					maList = new HashMap<String, Object>();
//					 maList.put("ma_nameList",ma_nameList);
//					 maList.put("ma_qtyList",ma_qtyList);
//					 logger.debug("maList: "+maList);
//					 logger.debug("ma_nameList: "+ma_nameList);
//					 logger.debug("ma_qtyList: "+ma_qtyList);
					logger.debug(vo+"");
//					String production_id;
					
//					vo.setProduction_id(production_id);
					logger.debug("@@@@@@@insert 데이터 DB저장");
					woService.insertWorkOrder(vo);
					logger.debug("@@@@@@@ma_nameList : " +ma_nameList+"");
					logger.debug("@@@@@@@ma_qtyList : " +ma_qtyList+"");
					logger.debug("@@@@@@@자재 업데이트");
					woService.maQtyUpdate(ma_nameList, ma_qtyList);
					//servicer객체 호출
					
//					return "redirect:/production/workOrder/workOrderList";
				}
				
		
		////// 작업지시 등록 //////
		
		////// 작업지시 목록 //////
		// http://localhost:8088/workOrder/list
		@RequestMapping(value = "/list")
		public void customerListGET(Model model, PagingVO pvo, 
				HttpServletRequest request, HttpSession session) throws Exception {
			logger.debug("@@@@@@@@@Controller : 작업지시 목록 보기");
			logger.debug("@@@@@@@@@Controller : {}",pvo);
			
			List<Object> workOrderList=null;
			
			//품질관리목록을 가져오는 woService 호출
			pvo = woService.setPageInfoForWorkOrder(pvo);
			logger.debug("@@@@@@@@@Controller : {}",pvo);
			
			//service객체를 호출
			if(pvo.getSelector()!=null && pvo.getSelector()!="") {
				//검색어가 있을 때 
				logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
				workOrderList = pageService.getListSearchObjectProductionVO(pvo);
			}else {
				//검색어가 없을 때
				logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
				workOrderList = pageService.getListPageSizeObjectProductionVO(pvo);
			}
			logger.debug("@@@@@@@@@Controller : workOrderList={}",workOrderList);
			//변수에 담아서 전달
			model.addAttribute("workOrderList", workOrderList);
			model.addAttribute("pvo",pvo);	
		}

		
		////// 작업지시 상세보기 //////
		// http://localhost:8088/workOrder/info?production_id=PR230615001
		// 작업지시 상세
		@RequestMapping(value = "/info",method = RequestMethod.GET)
		public void workOrderGET(Model model, HttpSession session,
								 @RequestParam("production_id") String production_id) throws Exception{
			logger.debug(" workOrderGET()호출! ");
			
			logger.debug(" production_id : "+production_id);
			
			model.addAttribute("workOrder", woService.detailWorkOrder(production_id));
			
		}
		////// 작업지시 상세보기 //////
		
		// http://localhost:8088/workOrder/modify?production_id=PR230615001
		// 작업지시 수정
	
		
}
