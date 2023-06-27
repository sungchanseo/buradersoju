package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.InventoryService;
import com.itwillbs.service.PagingService;

@Controller
@RequestMapping(value= "/purchasing/inventory/*")
public class InventoryController {
	
	@Inject
	private InventoryService invservice;
	
	@Inject
	private PagingService pageService;
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	
	// 재고리스트 보기 - /inventory/list (GET)
	// http://localhost:8088/purchasing/inventory/list
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model , PagingVO pvo ,
			HttpServletRequest request) throws Exception{
		logger.debug("@@@@@listGET()호출!@@@@@");
		
		List<Object> customerList = null;
		
		pvo = invservice.getListSearchObjectMaterialVO(pvo);
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
	//	service객체를 호출
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			customerList = pageService.getListSearchObjectMaterialVO(pvo);
		}
		else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			customerList = pageService.getListSearchObjectMaterialVO(pvo);
		}
		customerList = pageService.getListPageSizeObjectMaterialVO(pvo);
		logger.debug("@@@@@@@@@Controller : customerList={}",customerList);
	
		//변수에 담아서 전달
		model.addAttribute("inventoryList", customerList);
		model.addAttribute("pvo",pvo);
	
		
		    
	}
	
	// 재고 등록 처리
    @ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String insertPOST(MaterialVO vo) throws Exception{
		
		logger.debug("@@@@ 재고등록 행추가@@@@");
		
		logger.debug("vo:"+ vo.getMa_id());
		
		invservice.insertInventory(vo);
		
		return "redirect:/purchasing/inventory/list";
		
	}
	
	// http://localhost:8088/purchasing/inventory/modify
	
	// 재고수정 디비처리
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String modifyInventoryPOST(MaterialVO mvo) throws Exception {
     		logger.debug("@@@@@modifyINPOST()호출!@@@@@");
			logger.debug("수정가보자아앙제발라ㅏ앙");
			logger.debug("@@@@@@Contoroller : 수정한 거래정보" + mvo);
		    invservice.modifyInventory(mvo);		
			
			return "redirect:/purchasing/inventory/list";    	    	
	}
	
	
	// http://localhost:8088/purchasing/inventory/list

   
}
