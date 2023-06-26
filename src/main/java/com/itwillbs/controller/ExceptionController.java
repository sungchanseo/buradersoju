package com.itwillbs.controller;

import javax.naming.SizeLimitExceededException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice
public class ExceptionController {
	
	 private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	 
	 
	 public String SizeLimitExceededException(Model model, SizeLimitExceededException sizeError) {
		 logger.debug("~!@#$%^& ExceptionController : SizeLimitExceededException 예외가 발생했읍니다.");
		 
		 model.addAttribute("sizeError", sizeError);
		 
		 return "/error/sizeError";
	 }
	 
	 
	 public String Exception(Model model, Exception commonError) {
		 logger.debug("~!@#$%^& ExceptionController : Exception예외가 발생했읍니다.");
		 
		 model.addAttribute("commonError", commonError);
		 
		 return "/error/commonError";
	 }
}
