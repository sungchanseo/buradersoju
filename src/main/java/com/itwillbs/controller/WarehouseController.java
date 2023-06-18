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

	
	// 창리스트 보기 - /warehouse/list (GET)
	// http://localhost:8088/purchasing/warehouse/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model) {
		
		logger.debug("@@@listGET호출!!@@@@");
		
		// service객체 호출
		List<WarehouseVO> warehouseList = waservice.getWarehouseList();
		
		// view페이지 정보 전달
		model.addAttribute("warehouseList",warehouseList);
	}
}
