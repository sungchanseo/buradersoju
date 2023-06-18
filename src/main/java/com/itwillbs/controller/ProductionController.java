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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// 서비스 객체 주입

	@Inject
	private ProductionService proService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
		// http://localhost:8088/production/workOrderInsert
		// 작업지시 등록 (GET)
		@RequestMapping(value = "workOrderInsert",method = RequestMethod.GET)
		public void insertGET(Model model) throws Exception{
			logger.debug(" insertGET() 호출! ");
			logger.debug(" /production/workOrderInsert.jsp 페이지 이동 ");
			
			// 테이블의 정보를 가져와서 모델에 추가 (이후 수주로 수정)
			List<ProductionVO> workOrderList = proService.getWorkOrderList();
			model.addAttribute("workOrderList",workOrderList);
		}
				
		// 작업지시 등록 (POST)
		@RequestMapping(value = "workOrderInsert",method = RequestMethod.POST)
		public String insertPOST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
			logger.debug(" insertPOST() 호출! ");
			// 한글처리(필터)
			// 페이지 전달된 데이터(파라메터) 저장
			logger.debug(" vo : " +vo);
			
			// 서비스 - 글쓰기 동작 호출
			proService.insertWorkOrder(vo);
			
			// 리스트로 정보를 전달 (rttr)
			rttr.addFlashAttribute("result", "OK");
			
			// 리스트 페이지로 이동		
			return "redirect:/production/workOrderList";
			
		}
		
		// http://localhost:8088/production/workOrderList
		// 작업지시 목록
		@RequestMapping(value = "/workOrderList", method = RequestMethod.GET)
		public void listGET(Model model){
			logger.debug(" listGET()호출! ");
			 
			List<ProductionVO> workOrderList = proService.getWorkOrderList();
			model.addAttribute("workOrderList",workOrderList);
		
		}
	
		//http://localhost:8088/production/qualityList
		//http://localhost:8088/production/qualityInsert
		//http://localhost:8088/production/qualityInfo
		//http://localhost:8088/production/emptyBottle
	
		////// 품질관리 목록 보기 //////
		@RequestMapping(value="/qualityList", method=RequestMethod.GET)
		public void qualityListGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 품질관리 리스트 조회!");
			
			// serivce 객체 호출 
			List<ProductionVO> productionList = proService.getQualityList();
			
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
			ProductionVO qualityInfo = proService.getQualityInfo(qc_num);
			
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
			proService.insertQuality(vo);
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
			ProductionVO qualityInsertSearch = proService.getInsertSearch(production_id);
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
			proService.qualityInsertDB(vo);
			
				return "redirect:/production/qualityList";
		}
			
		/////// 검수 등록 ///////
		/////// 공병 관리 ///////	
		@RequestMapping(value="/emptyBottle", method=RequestMethod.GET)
		public void BottleListGET(Model model) throws Exception {
			logger.debug("@@@@@@@@@@@@Controller : 공병관리 리스트 조회!");
			
			//servicer객체 호출
			List<ProductionVO> bottleList = proService.getBottleList();
			
			model.addAttribute("bottleList", bottleList);
			
		}
		/////// 공병 관리 ///////	

	
		
}
