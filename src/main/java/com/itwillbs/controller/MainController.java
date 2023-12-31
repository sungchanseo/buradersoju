package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// http://localhost:8088/main
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		
		logger.info("C: 메인페이지 GET");
//		// 세션에서 사용자 ID 값 확인
//		HttpSession session = request.getSession();
//		String emp_id = (String) session.getAttribute("emp_id");
		
//		// 사용자 ID가 없으면 로그인 페이지로 리다이렉트
//		if (emp_id == null) {
//			return "redirect:/main/login";
//		}
//		
//		// 세션에 저장된 사용자 ID가 있는 경우, 해당 정보를 모델에 추가하고 main 페이지로 이동
//		model.addAttribute("emp_id", emp_id);
//		return "main/main"; // main 폴더 안에 있는 main 페이지의 경로를 수정해줍니다.
		
		 // 현재 사용자의 Authentication 객체를 가져옵니다.
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	    // 인증된 사용자의 정보를 확인합니다.
	    if (authentication != null && authentication.isAuthenticated()) {
	        Object principal = authentication.getPrincipal();
	        if (principal instanceof UserDetails) {
	            UserDetails userDetails = (UserDetails) principal;
	            String username = userDetails.getUsername();
	            
                System.out.println("Username: " + userDetails.getUsername());
                System.out.println("Authorities: " + userDetails.getAuthorities());
	        }
	    }
		return "/main/main";
	}
	
}
