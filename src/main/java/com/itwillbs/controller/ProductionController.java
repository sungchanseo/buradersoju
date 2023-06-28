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
	
	
	// http://localhost:8088/production/productionList
	// 생산목록
	@RequestMapping(value = "/productionList", method = RequestMethod.GET)
    public String productionListGET(Model model) throws Exception {
		logger.debug(" productionListGET()호출! ");
		
        List<ProductionVO> productionList = proService.getProductionList();
        model.addAttribute("productionList", productionList);
        return "/production/productionList";
    }
	
	// http://localhost:8088/production/productionInsert
	// 생산 등록 (GET)
	@RequestMapping(value = "productionInsert",method = RequestMethod.GET)
	public void insertGET(Model model) throws Exception{
		logger.debug(" insertGET() 호출! ");
		logger.debug(" /production/productionInsert.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> productionList = proService.getProductionList();
		model.addAttribute("productionList",productionList);
	}
				
	// 생산 등록 (POST)
	@RequestMapping(value = "productionInsert",method = RequestMethod.POST)
	public String insertPOST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
		logger.debug(" insertPOST() 호출! ");
		// 한글처리(필터)
		// 페이지 전달된 데이터(파라메터) 저장
		logger.debug(" vo : " +vo);
		
		proService.insertProducion(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		// 리스트 페이지로 이동		
		return "redirect:/production/productionList";
	}
	
		// 작업지시번호 조회 (생산 등록)
		@RequestMapping(value="/insertSearch.do",  produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String woSearchGET(String production_id) throws Exception {
			
			//자바에서 JSON 객체로 변환
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			logger.info("production_id : "+production_id);
			
			//servicer객체 호출
			ProductionVO insertSearch = proService.getInsertSearch(production_id);
			hashMap.put("vo", insertSearch);
			
			String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
			System.out.println("json : "+json);
			
			return json;
		}
	
		
}
