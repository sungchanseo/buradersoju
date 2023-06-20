package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ChartVO;
import com.itwillbs.service.ChartService;

@Controller
@RequestMapping(value = "/chart/*")
public class ChartController {
	
	//로그출력을 위한 로거 인스턴스 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
		
	@Inject
	private ChartService service;
	
	@RequestMapping(value = "/MainContract", method = RequestMethod.GET)
	@ResponseBody
	public List<ChartVO> chartGET() throws Exception {
		logger.debug("C : 차트 컨트롤러 chartGET()호출");
		
		List<ChartVO> contract = service.mainContractChart();
		logger.debug("수주차트: " + contract);
		
		return contract;
	}
	
}
