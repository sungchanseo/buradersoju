package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.MaterialVO;
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
		
		// 테이블의 정보를 가져와서 모델에 추가 (이후 수주로 수정)
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
		
		// 서비스 - 글쓰기 동작 호출
		proService.insertWorkOrder(vo);
		
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		// 리스트 페이지로 이동		
		return "redirect:/production/workOrderList";
		
	}
	
	// http://localhost:8088/production/workOrderList
	// 작업지시 목록
	@RequestMapping(value = "/workOrderList", method = RequestMethod.GET)
	public void listGET(Model model){
		logger.debug(" listGET()호출! ");
		 
		List<ProductionVO> workOrderList = proService.getWorkOrderList();
		model.addAttribute("workOrderList",workOrderList);
	
	}

		
	
}
