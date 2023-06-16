package com.itwillbs.controller;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.service.InMaterialService;



@Controller
@RequestMapping(value = "/purchasing/inMaterial/*")
public class InMaterialController {
	
	
	// http://localhost:8088/purchasing/inMaterial/list
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(InMaterialController.class);
	
	
	// Service 객체 주입
	@Inject
	private InMaterialService iService;
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 입고 리스트
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void inMaterialListAllGET(Model model) throws Exception{
		logger.debug("@@@@@@@@@@ inMaterialListAllGET()_호출");
		
		// Service 객체 호출
		List<InMaterialVO> inMaterialList =  iService.getInMaterialListAll();
		
		// View 페이지에 정보 전달
		model.addAttribute("inMaterialList", inMaterialList);
	}
	
	// 2. 
	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

}
