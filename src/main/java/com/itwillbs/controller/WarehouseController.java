package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.WarehouseService;

@Controller
@RequestMapping(value= "/purchasing/warehouse/*")
public class WarehouseController {

	@Inject
	private WarehouseService waservice;
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);

	
	// 창고리스트 보기 - /warehouse/list (GET)
	// http://localhost:8088/purchasing/warehouse/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model) {
		
		logger.debug("@@@listGET호출!!@@@@");
		
		// service객체 호출
		List<WarehouseVO> warehouseList = waservice.getWarehouseList();
		
		// view페이지 정보 전달
		model.addAttribute("warehouseList",warehouseList);
	}
	
	// 창고등록 하기
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public void insertGET (WarehouseVO vo) {
		logger.debug("@@@@@발주 등록 가즈아아~~");
	   	
	}
	// http://localhost:8088/purchasing/warehouse/insert
	// 창고등록 하기
	@RequestMapping(value ="insert", method = RequestMethod.POST)
	public String insertPOST(WarehouseVO vo) {
		 
		logger.debug("@@@@ 창고 등록 POST @@@");
		logger.debug("@@@@ 등록된 정보 @@@" + vo);
		waservice.warehouseInsert(vo);
		
		return "redirect:/purchasing/warehouse/list";
	}
	
	// 
}
