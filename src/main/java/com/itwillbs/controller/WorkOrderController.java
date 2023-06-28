package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.WorkOrderService;

@Controller
@RequestMapping(value = "/production/workOrder/*")
public class WorkOrderController {
	
	// 서비스 객체 주입

	@Inject
	private WorkOrderService woService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderController.class);
	
		// http://localhost:8088/production/workOrder/workOrderInsert
		// http://localhost:8088/production/workOrder/workOrderList
		// http://localhost:8088/production/workOrder/workOrder?production_id=PR230615001
		
		////// 작업지시 등록 //////
		// 작업지시 등록 페이지
		@RequestMapping(value = "workOrderInsert",method = RequestMethod.GET)
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
		// 검수 등록 db처리
				@RequestMapping(value="/workOrderInsert", method=RequestMethod.POST)
				public void insertWorkOrder(ProductionVO vo ) throws Exception {
					logger.debug("@@@@@@@@@@@@Controller : 검수 등록 DB저장 시작");
					
					logger.debug(vo+"");
					//servicer객체 호출
					woService.insertWorkOrder(vo);
					
//					return "redirect:/production/workOrder/workOrderList";
				}
	
		// 작업지시번호 생성 (작업지시 등록)
//		private String makeProductionId() {
		    // 오늘 날짜의 형식을 "yyMMdd"로 변환
//		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
//		    String currentDate = dateFormat.format(new Date());
	
		    // 조회된 마지막 작업지시번호의 순번
//		    int sequenceNumber = 1; // 예시로 1로 초기화
		    
		    // 데이터베이스에서 해당 날짜의 마지막 작업지시번호를 조회하는 로직
		    // int sequenceNumber = proService.getLastSequenceNumber(currentDate); 
		    	//  ProductionService 인터페이스에 getLastSequenceNumber 메서드를 추가 
		    	// -> 해당 메서드를 구현하는 클래스에서 실제로 데이터베이스에서 조회하는 로직을 작성 필요함
	
		    // 작업지시번호 생성
//		    String productionId = "PR" + currentDate + String.format("%03d", sequenceNumber);
	
//		    return productionId;
//		}
		
		////// 작업지시 등록 //////
		
		////// 작업지시 목록 //////
		// http://localhost:8088/production/workOrder/workOrderList
		// 작업지시 목록
		@RequestMapping(value = "/workOrderList", method = RequestMethod.GET)
	    public String workOrderListGET(Model model) throws Exception {
			logger.debug(" workOrderListGET()호출! ");
			
	        List<ProductionVO> workOrderList = woService.getWorkOrderList();
	        model.addAttribute("workOrderList", workOrderList);
	        return "/production/workOrder/workOrderList";
	    }
		////// 작업지시 목록 //////
		
		////// 작업지시 상세보기 //////
		// http://localhost:8088/production/workOrder/workOrder?production_id=PR230615001
		// 작업지시 상세
		@RequestMapping(value = "/workOrder",method = RequestMethod.GET)
		public void workOrderGET(Model model, HttpSession session,
								 @RequestParam("production_id") String production_id) throws Exception{
			logger.debug(" workOrderGET()호출! ");
			
			logger.debug(" production_id : "+production_id);
			
			model.addAttribute("workOrder", woService.detailWorkOrder(production_id));
			
		}
		////// 작업지시 상세보기 //////
		
		// http://localhost:8088/production/workOrder/workOrderModify?production_id=PR230615001
		// 작업지시 수정
	
		
}
