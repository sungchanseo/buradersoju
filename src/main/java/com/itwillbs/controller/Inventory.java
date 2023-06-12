package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= "/inventory/*")
public class Inventory {
	
	
    
	private static final Logger logger = LoggerFactory.getLogger(Inventory.class);
	
	// 글쓰기 - /inventory/list (GET)
	// http://localhost:8088/inventory/list
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void listGET() throws Exception{
		logger.debug("listGET()호출!");
		logger.debug(" /inventory/list.jsp 페이지 이동 가능");
	}
	

}
