package com.itwillbs.controller;


import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.QualityService;

@Controller
@RequestMapping(value = "/quality/*")
public class QualityController {
	
	// 서비스 객체 주입
	@Inject
	private QualityService quService;
	
	private static final Logger logger = LoggerFactory.getLogger(QualityController.class);
	
		//http://localhost:8088/quality/qualityList
		//http://localhost:8088/quality/qualityInsert
		//http://localhost:8088/quality/qualityInfo
		//http://localhost:8088/quality/emptyBottle
	
		////// 품질관리 목록 보기 //////
		@RequestMapping(value="/qualityList", method=RequestMethod.GET)
		public void qualityListGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 품질관리 리스트 조회!");
			
			// serivce 호출 
			List<ProductionVO> qualityList = quService.getQualityList();
		
			logger.debug("@@@@@@@@@Controller : {}",qualityList);
			
			//변수를 가지고 뷰 페이지로 보내기 
			model.addAttribute("productionList", qualityList);
			
		}
		////// 품질관리 목록 보기 //////
		
		/////// 검수 상세보기 //////
		@RequestMapping(value="/qualityInfo", method=RequestMethod.GET)
		public void customerInfoGET(String qc_num, Model model) {
			logger.debug("@@@@@@@@@@@@Controller : 검수 상세보기");
			logger.debug("@@@@@@@ qc_num : "+qc_num);
			
			//servicer객체 호출
			ProductionVO qualityInfo = quService.getQualityInfo(qc_num);
			
			//변수에 넣어 뷰페이지로 보내기 
			model.addAttribute("vo", qualityInfo);
		}
		/////// 검수 상세보기 //////
		
		/////// 검수 등록 ///////
		// 페이지 호출
		@RequestMapping(value="/qualityInsert", method=RequestMethod.GET)
		public void qualityInsertGET(ProductionVO vo) {
			logger.debug("@@@@@@@@@@@@Controller : 검수 등록 입력페이지");
			
			logger.debug(vo+"");
			//servicer객체 호출
			quService.insertQuality(vo);
		}
		// 작업 지시 번호로 조회
		@RequestMapping(value="/qualityInsertSearch",  produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String searchListGET(String production_id) throws Exception {
			
			//자바에서 JSON 객체로 변환
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			logger.info("@@@@@@@ production_id : "+production_id);
			
			//servicer객체 호출
			ProductionVO qualityInsertSearch = quService.getInsertSearch(production_id);
			hashMap.put("vo", qualityInsertSearch);
			
			String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
			System.out.println("@@@@@@@ json : "+json);
			
			return json;
		}
		// 2-1. 입고번호 - 자동넘버링
		@RequestMapping(value="/qcid", method=RequestMethod.GET)
		public void getQCNumGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@ getQCNumGET() 호출");
			
			String maxNumber = quService.getMaxNumber();
			String maxDate = quService.getMaxDate();
			logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	
			logger.debug("@@@@@@@@@@@@@@ maxDate = " + maxDate);	   
			
			model.addAttribute("maxNumber", maxNumber);
			model.addAttribute("maxDate", maxDate);
		}
		
		// 검수 등록 db처리
		@RequestMapping(value="/qcid", method=RequestMethod.POST)
		public String qualityInsertDB(ProductionVO vo ) {
			logger.debug("@@@@@@@@@@@@Controller : 검수 등록 입력페이지");
			
			logger.debug(vo+"");
			//servicer객체 호출
			quService.qualityInsertDB(vo);
			
			return "redirect:/quality/qualityList";
		}
			
		/////// 검수 등록 ///////
		/////// 공병 관리 ///////	
		// 리스트 출력
		@RequestMapping(value="/emptyBottle", method=RequestMethod.GET)
		public void BottleListGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 공병관리 리스트 조회!");
			
			//servicer객체 호출
			List<ProductionVO> bottleList = quService.getBottleList();
			
			model.addAttribute("bottleList", bottleList);
			
		}
		
		// 공병 수량 등록
		@RequestMapping(value = "/btInsert", method=RequestMethod.POST)
		public String BottleInsert(ProductionVO vo) {
			logger.debug("@@@@@@@@@@@@Controller : 공병 등록");
			
			logger.debug(vo+"");
			//servicer객체 호출
			quService.btInsert(vo);
			
			return "redirect:/quality/emptyBottle";
		}
		// 공병 불량 등록(수정)
		@RequestMapping(value = "/btUpdate", method=RequestMethod.POST)
		public String BottleUpdate(ProductionVO vo) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 공병 불량 등록(수정)");
			
			logger.debug(vo+"");
			//servicer객체 호출
			quService.btUpdate(vo);
			
			return "redirect:/quality/emptyBottle";
		}
		
		/////// 공병 관리 ///////	

	
		
}
