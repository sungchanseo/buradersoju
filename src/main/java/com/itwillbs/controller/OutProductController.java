package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.OutProductVO;
import com.itwillbs.service.OutproductService;

@Controller
@RequestMapping(value= "/purchasing/outproduct/*")
public class OutProductController {
	
	// 로그기록을 위한 로거 생성
	

	private static final Logger logger = LoggerFactory.getLogger(OutProductController.class);

	// Service 객체 사용을 위한 의존성 주입
	
	@Inject
	private OutproductService outService;
	
	
	// http://localhost:8088/purchasing/outproduct/list
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void listGET(Model model) {
		
		logger.debug("@@@@@list GET 호출 젭라@@@@");
	
	    // service 객체 호출
		List<OutProductVO> outproductList = outService.getOutproductList();
		
		model.addAttribute("outproductList",outproductList);
	  
	}
	
	
}
