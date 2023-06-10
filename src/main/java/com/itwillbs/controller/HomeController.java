package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//http://localhost:8088/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		
		logger.info("C: 메인페이지 GET");
		
		  // 세션에서 사용자 ID 값 확인
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");

        // 사용자 ID가 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/member/login";
        }

        // 세션에 저장된 사용자 ID가 있는 경우, 해당 정보를 모델에 추가하고 main 페이지로 이동
        model.addAttribute("userId", userId);
        return "main";
	}
}
