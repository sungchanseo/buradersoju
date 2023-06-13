package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// http://localhost:8088/production/list
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	
}
