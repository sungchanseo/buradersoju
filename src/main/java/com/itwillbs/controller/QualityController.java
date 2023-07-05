package com.itwillbs.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.PagingService;
import com.itwillbs.service.QualityService;

@Controller
@RequestMapping(value = "/quality/*")
public class QualityController {
	
	// 서비스 객체 주입
	@Inject
	private QualityService quService;
	@Inject
	private PagingService pageService;
	
	private static final Logger logger = LoggerFactory.getLogger(QualityController.class);
	
		//http://localhost:8088/quality/qualityList
		//http://localhost:8088/quality/list
		//http://localhost:8088/quality/qualityInsert
		//http://localhost:8088/quality/insert
		//http://localhost:8088/quality/qualityInfo
		//http://localhost:8088/quality/info
		//http://localhost:8088/quality/emptyBottle
	
		////// 품질관리 목록 보기 //////
	@RequestMapping(value = "/list")
	public void customerListGET(Model model, PagingVO pvo, 
			HttpServletRequest request, HttpSession session) throws Exception {
		logger.debug("@@@@@@@@@Controller : 품질관리 목록 보기");
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
		List<Object> qualityList=null;
		
		//품질관리목록을 가져오는 quService 호출
		pvo = quService.setPageInfoForQuality(pvo);
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
		//service객체를 호출
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			qualityList = pageService.getListSearchObjectProductionVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			qualityList = pageService.getListPageSizeObjectProductionVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : qualityList={}",qualityList);
		//변수에 담아서 전달
		model.addAttribute("qualityList", qualityList);
		model.addAttribute("pvo",pvo);	
	}
		////// 품질관리 목록 보기 //////
		
		/////// 검수 상세보기 //////
		@RequestMapping(value="/info", method=RequestMethod.GET)
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
		@RequestMapping(value="/insert", method=RequestMethod.GET)
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
		
		//http://localhost:8088/quality/list
		// 검수 등록 db처리
		@ResponseBody
		@PostMapping(value = "/defInsert")
		public String qualityInsertDB(ProductionVO vo,
				 @RequestParam("def_codeList") List<String> def_codeList,
		         @RequestParam("def_qtyList") List<String> def_qtyList) throws Exception {

			logger.debug("@@@@@@@@@@@@Controller : 검수 등록 insert 작업 시작");
			logger.debug(vo+"");
			logger.debug(def_qtyList+"def_qtyList");
			logger.debug(def_codeList+"def_codeList");
			quService.qualityInsertDB(vo, def_codeList, def_qtyList);
			logger.debug("@@@@@@@@@@@@Controller : 검수 등록 insert 작업 완료");
			return "redirect:/quality/qualityList";
		}
		
		
			
		/////// 검수 등록 ///////
		/////// 공병 관리 ///////
		//http://localhost:8088/quality/emptyBottle
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
		public String BottleInsert(ProductionVO vo, String bt_date, Integer bt_qty) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 공병 등록 BottleInsert(ProductionVO vo)호출");
			logger.debug("bt_date: "+bt_date);
			logger.debug("bt_qty: "+bt_qty);
			
			logger.debug(vo+"");
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@bt_date");
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
