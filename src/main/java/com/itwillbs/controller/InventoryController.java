package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.service.InventoryService;

@Controller
@RequestMapping(value= "/purchasing/inventory/*")
public class InventoryController {
	
	@Inject
	private InventoryService invservice;
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	
	// 리스트 보기 - /inventory/list (GET)
	// http://localhost:8088/purchasing/inventory/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model){
		logger.debug("@@@@@listGET()호출!@@@@@");
		 
		List<MaterialVO> inventoryList = invservice.getInventoryList();
		
		model.addAttribute("inventoryList",inventoryList);
	
	}
}
