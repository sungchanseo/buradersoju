package com.itwillbs.controller;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.InMaterialService;
import com.itwillbs.service.PagingService;

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
	
	
	
	// 1. 입고 리스트 출력
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String inMaterialListAllGET(Model model, PagingVO pvo,
									   HttpServletRequest request, HttpSession session) throws Exception{
		logger.debug("@@@@@@@@@@ inMaterialListAllGET()_호출");
		
		// 리스트 출력 (페이징처리 X)
//		List<InMaterialVO> inMaterialList =  iService.getInMaterialListAll();
//		model.addAttribute("inMaterialList", inMaterialList);

		// 로그인 세션 제어
//		if(session.getAttribute("emp_id") == null) {
//			return "redirect:/main/login";
//		}
		
		
		// 리스트 출력 (페이징처리)
		List<Object> inMaterialList = null;
		pvo = iService.pagingAction(pvo);
		logger.debug("@@@@@@@@@@ pvo : {}", pvo);
		
		
		// form 태그 정보 저장
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String in_id = request.getParameter("in_id");
		String ma_name = request.getParameter("ma_name");
		String in_empName = request.getParameter("in_empName");
		String in_process = request.getParameter("in_process");
		
//		if(startDate == null && endDate == null) {
//			startDate = "2023-07-01";
//			endDate = "2023-07-31";
//		}
		
		pvo.setStartDate(startDate);
		pvo.setEndDate(endDate);
		pvo.setIn_id(in_id);
		pvo.setMa_name(ma_name);
		pvo.setIn_empName(in_empName);
		pvo.setIn_process(in_process);
		
		
		// 검색로직
		if(pvo.getIn_id() != null || pvo.getMa_name() != null || pvo.getIn_empName() != null || pvo.getIn_process() != null) {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@@ 검색어가 있을 때");
			inMaterialList = iService.getListSearchObjectInMaterialVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@@ 검색어가 없을 때");
			inMaterialList = iService.getListPageSizeObjectInMaterialVO(pvo);
		}

		
		// View 페이지 전달
		model.addAttribute("inMaterialList", inMaterialList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("in_id", in_id);
		model.addAttribute("ma_name", ma_name);
		model.addAttribute("in_empName", in_empName);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		
		return null;
	}
	

	// 2-1. 입고번호 - 자동넘버링
	@RequestMapping(value="/inid", method=RequestMethod.GET)
	public void getInIdGET(Model model) throws Exception {
		logger.debug("@@@@@@@@@@ getInIdGET() 호출");
		
		String maxNumber = iService.getMaxNumber();
		String maxDate = iService.getMaxDate();
		logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	
		logger.debug("@@@@@@@@@@@@@@ maxDate = " + maxDate);	   
		
		model.addAttribute("maxNumber", maxNumber);
		model.addAttribute("maxDate", maxDate);
	}
	
	// 2-2. 입고번호 & 재고량 증가 - DB 업데이트
	@RequestMapping(value="/inid", method=RequestMethod.POST)
	@ResponseBody
	public void getInIdPOST(Model model, @RequestBody InMaterialVO vo) throws Exception{
		logger.debug("@@@@@@@@@@ getInIdPOST()_호출");
		
		// 입고번호, 발주번호 DB에 저장
		iService.registInId(vo);
		
//		// 현 재고량 + 입고량 = 총재고량 (add_ma)
		iService.getAddMa(vo.getOrder_id());
		
		// 입고된 자재 재고량 증가
		iService.getplusMa(vo);
	}
	
	
	// 3. 입고 상세보기
	@RequestMapping(value = "/info", method=RequestMethod.GET)
	public void getInMaterialInfo(Model model, @RequestParam("order_id") String order_id) throws Exception{
		logger.debug("@@@@@@@@@@ getInMaterialInfo()_호출");
		
		InMaterialVO info = iService.getInMaterialInfo(order_id);
		logger.debug("@@@@@@@@@@ 입고 상세보기 데이터 : " + info);
		model.addAttribute("info", info);
	}


	
	
	
}
