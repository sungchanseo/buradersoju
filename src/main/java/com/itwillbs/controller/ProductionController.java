package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.PagingService;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// 서비스 객체 주입

	@Inject
	private ProductionService proService;
	@Inject
	private PagingService pageService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	
//	// http://localhost:8088/production/productionList
//	// 생산목록
//	@RequestMapping(value = "/productionList", method = RequestMethod.GET)
//    public String productionListGET(Model model, PagingVO pvo) throws Exception {
//		logger.debug(" productionListGET()호출! ");
//		
//        List<Object> productionList=null;
//		
//		//거래처목록을 가져오는 custService 호출
//		pvo = proService.setPageInfoForProduction(pvo);
//		logger.debug("@@@@@@@@@Controller : {}",pvo);
//		
//		//service객체를 호출
//		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
//			//검색어가 있을 때 
//			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
//			productionList = pageService.getListSearchObjectProductionVO(pvo);
//		}else {
//			//검색어가 없을 때
//			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
//			productionList = pageService.getListPageSizeObjectProductionVO(pvo);
//		}
//		logger.debug("@@@@@@@@@Controller : productionList={}",productionList);
//	
//		//변수에 담아서 전달
//		model.addAttribute("pvo",pvo);
//        model.addAttribute("productionList", productionList);
//        return "/production/productionList";
//    }
//	
	
		
}
