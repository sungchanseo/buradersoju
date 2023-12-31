package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.LoginService;

@Controller
@RequestMapping(value = "/main/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginService service; 
	
	// 접근 권한이 없을 때 
	@RequestMapping(value = "/accessError",method = RequestMethod.GET)
	public void accessErrorGET(Authentication auth, Model model) throws Exception {
		logger.debug("accessErrorGET() 호출!");
		logger.debug("accessDenied : ", auth);
		
		model.addAttribute("auth", auth);
	}
	
	//로그인 실패
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginFailGET() {
		logger.debug("loginFailGET() 호출!");
		
		return "/main/loginError";
	}
	
	//로그인페이지 호출
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(String error, String logout, Model model) throws Exception {
		logger.debug("LoginController : loginGET 호출!");
		logger.debug("Error : "+error);
		logger.debug("Logout : "+logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout !=null) {
			model.addAttribute("logout", "LOGOUT!");
		}
		
		return "/main/loginForm";
	}
	
	
//	//로그아웃
//	@RequestMapping(value = "/logout",method = RequestMethod.GET)
//	public String logoutGET(HttpSession session, HttpServletRequest request) {
//		logger.debug("logoutGET() 호출!");
//		
//		
//		// 세션정보 초기화
//		session.invalidate();
//		
//		return "redirect:/main/login";
//	}

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logoutGET() {
		logger.debug("logoutGET() 호출!");
//		return "/main/logout";
	}
	
//	@RequestMapping(value = "/logout",method = RequestMethod.GET)
//	public String logout(HttpSession session, HttpServletRequest request) {
//		// CSRF 토큰 가져오기
//	    CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
//	    if (csrfToken != null) {
//	        // CSRF 토큰 제거
//	        String csrfTokenName = csrfToken.getParameterName();
//	        session.removeAttribute(csrfTokenName);
//	    }
//
//	    // 세션정보 초기화
//	    session.invalidate();
//	    
//        return "/main/loginForm"; 
//    }

//	//로그인
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String loginGET() throws Exception{
//		logger.info("C: 로그인 입력페이지 GET");
//		return "/main/loginForm";
//	}
//	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String loginPOST(LoginVO vo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
//		logger.info("C: 로그인 처리페이지 POST");
//
//		LoginVO returnVO = service.loginMember(vo);
////		logger.info("C: 리턴VO : "+returnVO);
//		
//		if(returnVO != null) {
//			session.setAttribute("emp_id", returnVO.getEmp_id());
//			session.setAttribute("emp_name", returnVO.getEmp_name());
//			session.setAttribute("emp_department", returnVO.getEmp_department());
//			session.setAttribute("emp_image", returnVO.getEmp_image());
//			rttr.addFlashAttribute("mvo", returnVO);
//
//			logger.info("로그인 성공!");
//			 return "redirect:/main";
//		}else {
//			 // 정보가 없는 경우
//		    logger.info("로그인 실패!");
//		    model.addAttribute("loginFailed", true);
//		    return "main/loginError";
//		}
//	}
}
