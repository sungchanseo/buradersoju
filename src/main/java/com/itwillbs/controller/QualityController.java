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
			
			// serivce 객체 호출 
			List<ProductionVO> productionList = quService.getQualityList();
			
			//변수를 가지고 뷰 페이지로 보내기 
			model.addAttribute("productionList", productionList);
			
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
		@RequestMapping(value="/qualityInsertSearch.do",  produces = "application/text; charset=UTF-8")
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
		
		// 검수 등록 db처리
		@RequestMapping(value="/qualityInsert", method=RequestMethod.POST)
		public String qualityInsertDB(ProductionVO vo) {
			logger.debug("@@@@@@@@@@@@Controller : 검수 등록 입력페이지");
			
			logger.debug(vo+"");
			//servicer객체 호출
			quService.qualityInsertDB(vo);
			
				return "redirect:/quality/qualityList";
		}
			
		/////// 검수 등록 ///////
		/////// 공병 관리 ///////	
		@RequestMapping(value="/emptyBottle", method=RequestMethod.GET)
		public void BottleListGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 공병관리 리스트 조회!");
			
			//servicer객체 호출
			List<ProductionVO> bottleList = quService.getBottleList();
			
			model.addAttribute("bottleList", bottleList);
			
		}
		/////// 공병 관리 ///////	

	
		
}
