package com.itwillbs.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.OutProductVO;
import com.itwillbs.service.OutProductService;



@Controller
@RequestMapping(value= "/purchasing/outProduct/*")
public class OutProductController {
	
	
	// http://localhost:8088/purchasing/outProduct/list
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(OutProductController.class);

	
	// 객체 주입
	@Inject
	private OutProductService oService;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 출고 리스트 출력
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String outProductListGET(Model model,
								  HttpServletRequest request, HttpSession session) throws Exception{
		
		logger.debug("@@@@@@@@@@@@@@@ outProductListGET 호출");
		
		// 로그인 세션 제어
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
	
	    // 리스트 출력 (페이징처리 X)
		List<OutProductVO> outproductList = oService.getOutProductList();
		
		// View 페이지 전달
		model.addAttribute("outproductList", outproductList);
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
