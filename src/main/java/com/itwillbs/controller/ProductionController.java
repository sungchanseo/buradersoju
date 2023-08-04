package com.itwillbs.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/production/*")
public class ProductionController {
	
	// 서비스 객체 주입
	@Inject
	private ProductionService proService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	
	// http://localhost:8088/production/list
	// 생산목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String productionListGET(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		logger.debug(" productionListGET()호출! ");
		
		// 로그인 세션 제어
//		if(session.getAttribute("emp_id") == null) {
//			return "redirect:/main/login";
//		}
//		
		// 검색로직
		String selector = request.getParameter("selector");
		List<ProductionVO> productionList = null;
		
		if(selector != null && !selector.isEmpty()) {
			// 검색어가 있을 때
			logger.debug("@@@@@@@@@@ 검색어가 있을 때");
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("selector", selector);
			productionList = proService.getListSearchObjectProductionVO(paramMap);
		} else {
			logger.debug("@@@@@@@@@@ 검색어가 없을 때");
			productionList = proService.getProductionList();
		}		
		
		// 변수에 담아서 전달
		model.addAttribute("productionList", productionList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		
		return null; // 검색어가 없을 때

		
    }

	
	
	// 생산등록
	
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
		
		///////////////////////////////////////////////////////////////////
		// 혼합 등록 (1/3단계)
		///////////////////////////////////////////////////////////////////
	
		// http://localhost:8088/production/insertStage1
		// 혼합 등록 (GET)
		@RequestMapping(value = "insertStage1",method = RequestMethod.GET)
		public void insertStage1GET(Model model) throws Exception{
			logger.debug(" insertStage1GET() 호출! ");
			logger.debug(" /production/insertStage1.jsp 페이지 이동 ");
			
			// 테이블의 정보를 가져와서 모델에 추가
			List<ProductionVO> productionList = proService.getProductionList();
			model.addAttribute("productionList",productionList);
		}
					
		// 혼합 등록 (POST)
		@RequestMapping(value = "insertStage1",method = RequestMethod.POST)
		public String insertStage1POST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
			logger.debug(" insertStage1POST() 호출! ");
			// 한글처리(필터)
			// 페이지 전달된 데이터(파라메터) 저장
			logger.debug(" vo : " +vo);
			
			proService.insertStage1(vo);
			
			// 리스트로 정보 전달 (rttr)
			rttr.addFlashAttribute("result", "OK");
			
			// 리스트 페이지로 이동		
			return "redirect:/production/list";
		}
		
		///////////////////////////////////////////////////////////////////
		// 주입 등록 (2/3단계)
		///////////////////////////////////////////////////////////////////
		
		// http://localhost:8088/production/insertStage2
		// 주입 등록 (GET)
		@RequestMapping(value = "insertStage2",method = RequestMethod.GET)
		public void insertStage2GET(Model model) throws Exception{
		logger.debug(" insertStage2GET() 호출! ");
		logger.debug(" /production/insertStage2.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> productionList = proService.getProductionList();
		model.addAttribute("productionList",productionList);
		}
		
		// 주입 등록 (POST)
		@RequestMapping(value = "insertStage2",method = RequestMethod.POST)
		public String insertStage2POST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
		logger.debug(" insertStage2POST() 호출! ");
		// 한글처리(필터)
		// 페이지 전달된 데이터(파라메터) 저장
		logger.debug(" vo : " +vo);
		
		proService.insertStage2(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		// 리스트 페이지로 이동		
		return "redirect:/production/list";
		}
	
		///////////////////////////////////////////////////////////////////
		// 포장 등록 (3/3단계)
		///////////////////////////////////////////////////////////////////
		
		// http://localhost:8088/production/insertStage3
		// 포장 등록 (GET)
		@RequestMapping(value = "insertStage3",method = RequestMethod.GET)
		public void insertStage3GET(Model model) throws Exception{
			logger.debug(" insertStage3GET() 호출! ");
			logger.debug(" /production/insertStage3.jsp 페이지 이동 ");
			
			// 테이블의 정보를 가져와서 모델에 추가
			List<ProductionVO> productionList = proService.getProductionList();
			model.addAttribute("productionList",productionList);
		}
		
		// 포장 등록 (POST)
		@RequestMapping(value = "insertStage3",method = RequestMethod.POST)
		public String insertStage3POST(ProductionVO vo,RedirectAttributes rttr) throws Exception{
			logger.debug(" insertStage3POST() 호출! ");
			// 한글처리(필터)
			// 페이지 전달된 데이터(파라메터) 저장
			logger.debug(" vo : " +vo);
			
			proService.insertStage3(vo);
			
			// 리스트로 정보 전달 (rttr)
			rttr.addFlashAttribute("result", "OK");
			
			// 리스트 페이지로 이동		
			return "redirect:/production/list";
		}
		
		
		
	///////////////////////////////////////////////////////////////////
	// 혼합 수정
	///////////////////////////////////////////////////////////////////
	
	// http://localhost:8088/production/modifyStage1
	// 혼합 수정(GET)
	@RequestMapping(value = "modifyStage1",method = RequestMethod.GET)
	public void modifyStage1GET(Model model) throws Exception{
		logger.debug(" modifyStage1GET() 호출! ");
		logger.debug(" /production/modifyStage1.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> productionList = proService.getProductionList();
		model.addAttribute("productionList",productionList);
	}
	
	// 혼합 수정(POST)
	@RequestMapping(value = "modifyStage1", method = RequestMethod.POST)
	public String modifyStage1POST(ProductionVO vo, RedirectAttributes rttr) throws Exception {
		logger.debug(" modifyStage1POST() 호출 ");
		logger.debug("vo : " + vo);
		
		proService.modifyStage1(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		return "redirect:/production/list";

	}
	
	///////////////////////////////////////////////////////////////////
	// 주입 수정
	///////////////////////////////////////////////////////////////////
	
	// http://localhost:8088/production/modifyStage2
	// 주입 수정(GET)
	@RequestMapping(value = "modifyStage2",method = RequestMethod.GET)
	public void modifyStage2GET(Model model) throws Exception{
		logger.debug(" modifyStage2GET() 호출! ");
		logger.debug(" /production/modifyStage2.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> productionList = proService.getProductionList();
		model.addAttribute("productionList",productionList);
	}
	
	// 주입 수정(POST)
	@RequestMapping(value = "modifyStage2", method = RequestMethod.POST)
	public String modifyStage2POST(ProductionVO vo, RedirectAttributes rttr) throws Exception {
		logger.debug(" modifyStage2POST() 호출 ");
		logger.debug("vo : " + vo);
		
		proService.modifyStage2(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		return "redirect:/production/list";
		
	}
	///////////////////////////////////////////////////////////////////
	// 포장 수정
	///////////////////////////////////////////////////////////////////
	
	// http://localhost:8088/production/modifyStage3
	// 포장 수정(GET)
	@RequestMapping(value = "modifyStage3",method = RequestMethod.GET)
	public void modifyStage3GET(Model model) throws Exception{
		logger.debug(" modifyStage3GET() 호출! ");
		logger.debug(" /production/modifyStage3.jsp 페이지 이동 ");
		
		// 테이블의 정보를 가져와서 모델에 추가
		List<ProductionVO> productionList = proService.getProductionList();
		model.addAttribute("productionList",productionList);
	}
	
	// 포장 수정(POST)
	@RequestMapping(value = "modifyStage3", method = RequestMethod.POST)
	public String modifyStage3POST(ProductionVO vo, RedirectAttributes rttr) throws Exception {
		logger.debug(" modifyStage3POST() 호출 ");
		logger.debug("vo : " + vo);
		
		proService.modifyStage3(vo);
		
		// 리스트로 정보 전달 (rttr)
		rttr.addFlashAttribute("result", "OK");
		
		return "redirect:/production/list";
		
	}
		
			
		
	
		
}
