package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/employee/*")
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	// http://localhost:8088/employee/insert
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		logger.debug("C: 회원가입 입력페이지 GET");
		return "/employee/insertEmployee";
	}
	
}
