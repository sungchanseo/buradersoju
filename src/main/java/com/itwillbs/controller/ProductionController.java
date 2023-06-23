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
import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.PagingService;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// 서비스 객체 주입

	@Inject
	private ProductionService proService;
	@Inject
	private PagingService pageService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	// http://localhost:8088/production/workOrderInsert
	// 작업지시 등록 (GET)
	@RequestMapping(value = "workOrderInsert",method = RequestMethod.GET)
	public void insertGET(Model model) throws Exception{
		logger.debug(" insertGET() 호출! ");
		logger.debug(" /production/workOrderInsert.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> workOrderList = proService.getWorkOrderList();
		model.addAttribute("workOrderList",workOrderList);
	}
			
	// 작업지시 등록 (POST)
	@RequestMapping(value = "workOrderInsert",method = RequestMethod.POST)
	public String insertPOST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
		logger.debug(" insertPOST() 호출! ");
		// 한글처리(필터)
		// 페이지 전달된 데이터(파라메터) 저장
		logger.debug(" vo : " +vo);
		
		// 작업지시번호(production_id) 생성
		String productionId = makeProductionId();
		
		// 작업지시 객체에 작업지시번호 설정
		vo.setProduction_id(productionId);
		
		// 서비스 - 작업지시 등록
		proService.insertWorkOrder(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		// 리스트 페이지로 이동		
		return "redirect:/production/workOrderList";
	}
	
		// 수주번호 조회 (작업지시 등록)
		@RequestMapping(value="/woInsertSearch.do",  produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String woSearchGET(String cont_id) throws Exception {
			
			//자바에서 JSON 객체로 변환
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			logger.info("cont_id : "+cont_id);
			
			//servicer객체 호출
			ContractVO woInsertSearch = proService.getWoInsertSearch(cont_id);
			hashMap.put("vo", woInsertSearch);
			
			String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
			System.out.println("@@@@@@@ json : "+json);
			
			return json;
		}
	
		// 작업지시번호 생성 (작업지시 등록)
		private String makeProductionId() {
		    // 오늘 날짜의 형식을 "yyMMdd"로 변환
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		    String currentDate = dateFormat.format(new Date());
	
		    // 조회된 마지막 작업지시번호의 순번
		    int sequenceNumber = 1; // 예시로 1로 초기화
		    
		    // 데이터베이스에서 해당 날짜의 마지막 작업지시번호를 조회하는 로직
		    // int sequenceNumber = proService.getLastSequenceNumber(currentDate); 
		    	//  ProductionService 인터페이스에 getLastSequenceNumber 메서드를 추가 
		    	// -> 해당 메서드를 구현하는 클래스에서 실제로 데이터베이스에서 조회하는 로직을 작성 필요함
	
		    // 작업지시번호 생성
		    String productionId = "PR" + currentDate + String.format("%03d", sequenceNumber);
	
		    return productionId;
		}
	
	
	// http://localhost:8088/production/workOrderList
	// 작업지시 목록
	@RequestMapping(value = "/workOrderList", method = RequestMethod.GET)
    public String workOrderListGET(Model model) throws Exception {
		logger.debug(" workOrderListGET()호출! ");
		
        List<ProductionVO> workOrderList = proService.getWorkOrderList();
        model.addAttribute("workOrderList", workOrderList);
        return "/production/workOrderList";
    }
	
	// http://localhost:8088/production/workOrder?production_id=PR230615001
	// 작업지시 상세
	@RequestMapping(value = "/workOrder",method = RequestMethod.GET)
	public void workOrderGET(Model model, HttpSession session,
							 @RequestParam("production_id") String production_id) throws Exception{
		logger.debug(" workOrderGET()호출! ");
		
		logger.debug(" production_id : "+production_id);
		
		model.addAttribute("workOrder", proService.detailWorkOrder(production_id));
		
	}
	
	// http://localhost:8088/production/workOrderModify?production_id=PR230615001
	// 작업지시 수정
	
	
//	// http://localhost:8088/production/productionList
//	// 생산목록
//	@RequestMapping(value = "/productionList", method = RequestMethod.GET)
//    public String productionListGET(Model model, PagingVO pvo) throws Exception {
//		logger.debug(" productionListGET()호출! ");
//		
//        List<Object> productionList=null;
//		
//		//거래처목록을 가져오는 custService 호출
//		pvo = proService.setPageInfoForProduction(pvo);
//		logger.debug("@@@@@@@@@Controller : {}",pvo);
//		
//		//service객체를 호출
//		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
//			//검색어가 있을 때 
//			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
//			productionList = pageService.getListSearchObjectProductionVO(pvo);
//		}else {
//			//검색어가 없을 때
//			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
//			productionList = pageService.getListPageSizeObjectProductionVO(pvo);
//		}
//		logger.debug("@@@@@@@@@Controller : productionList={}",productionList);
//	
//		//변수에 담아서 전달
//		model.addAttribute("pvo",pvo);
//        model.addAttribute("productionList", productionList);
//        return "/production/productionList";
//    }
//	
	
		
}
