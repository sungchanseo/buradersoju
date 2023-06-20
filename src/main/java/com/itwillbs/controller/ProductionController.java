package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// 서비스 객체 주입
	@Autowired
	private ProductionService proService;
		
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	// http://localhost:8088/production/workOrderInsert
	// 작업지시 등록 (GET)
	@RequestMapping(value = "workOrderInsert",method = RequestMethod.GET)
	public void insertGET(Model model) throws Exception{
		logger.debug(" insertGET() 호출! ");
		logger.debug(" /production/workOrderInsert.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가 (이후 작업지시->수주로 수정)
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
	
		// 작업지시번호(production_id) 생성
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
	public void workOrderGET(Model model, 
							 HttpSession session,
							 @RequestParam("production_id") String production_id) throws Exception{
		logger.debug(" workOrderGET()호출! ");
		
		logger.debug(" production_id : "+production_id);
		
		model.addAttribute("workOrder", proService.detailWorkOrder(production_id));
		
		
	}
	

		
	
}
