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
	
	
	// 재고리스트 보기 - /inventory/list (GET)
	// http://localhost:8088/purchasing/inventory/list
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model , MaterialVO vo){
		logger.debug("@@@@@listGET()호출!@@@@@");
		 
		// service 객체 호출
		List<MaterialVO> inventoryList = invservice.getInventoryList();
		// View페이지 정보 전달
		model.addAttribute("inventoryList",inventoryList);
		
	}
	
	// 재고 등록 처리

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String insertPOST(MaterialVO vo){
		
		logger.debug("@@@@ 재고등록 행추가@@@@");
//		logger.debug("@@@@ 재고등록 행추가@@@@" + vo);
		
		logger.debug("vo:"+ vo.getMa_id());
		
		invservice.insertInventory(vo);
		
		return "redirect:/purchasing/inventory/list";
		
	}
	
	// http://localhost:8088/purchasing/inventory/modify
	
	// 재고 수정 하기위해 아이디 가져오기
	@RequestMapping(value = "/modify" , method = RequestMethod.GET)
	public void modifyInventoryGET(MaterialVO mvo) {
	 logger.debug("@@@@@modifyINVGET()호출!@@@@@");
		
	 MaterialVO inventoryModify = invservice.modifyInventoryID(mvo.getMa_id());
	  
	 logger.debug("inventoryModify" + mvo.getMa_id());
	 logger.debug("inventoryModify" + inventoryModify);
		
	}
	
	// 재고수정 디비처리
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String modifyInventoryPOST(MaterialVO mvo) {
     		logger.debug("@@@@@modifyINPOST()호출!@@@@@");
			logger.debug("수정가보자아앙제발라ㅏ앙");
			logger.debug("@@@@@@Contoroller : 수정한 거래정보" + mvo);
		    invservice.modifyInventory(mvo);		
			
			return "redirect:/purchasing/inventory/list";    	    	
	}
	
	
	// http://localhost:8088/purchasing/inventory/list

   
}
