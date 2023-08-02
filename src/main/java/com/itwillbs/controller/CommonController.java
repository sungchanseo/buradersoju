package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/accessError", method = RequestMethod.GET)
	public void accessDenied(Authentication auth, Model model) {
		logger.debug("CommonController : accessDenied 호출!");
		logger.debug("accessDenied : ", auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public void loginInput(String error, String logout, Model model) {
		logger.debug("CommonController : loginInput 호출!");
		logger.debug("Error : "+error);
		logger.debug("Logout : "+logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout !=null) {
			model.addAttribute("logout", "LOGOUT!");
		}
	}
	
	@RequestMapping(value = "/customLogout", method = RequestMethod.GET)
	public void logoutGET() {
		logger.debug("CommonController : logoutGET 호출!");
	}
}
