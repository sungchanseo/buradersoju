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
import com.itwillbs.domain.OutProductVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.OutProductService;



@Controller
@RequestMapping(value= "/purchasing/outProduct/*")
public class OutProductController {
	
	
	// http://localhost:8088/purchasing/outProduct/list
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(OutProductController.class);

	
	// 객체 주입
	@Inject
	private OutProductService oService;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 출고 리스트 출력
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String outProductListGET(Model model, PagingVO pvo,
								    HttpServletRequest request, HttpSession session) throws Exception{
		
		logger.debug("@@@@@@@@@@@@@@@ outProductListGET 호출");
		
		// 로그인 세션 제어
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
	
	    // 리스트 출력 (페이징처리 X)
//		List<OutProductVO> outproductList = oService.getOutProductList();
		
		
		// 리스트 출력 (페이징처리 O)
		List<Object> outproductList = null;
		pvo = oService.pagingAction(pvo);
		logger.debug("@@@@@@@@@@ pvo : {}", pvo);
		
		// 검색로직
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@@ 검색어가 있을 때");
			outproductList = oService.getListSearchObjectOutProductVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@@ 검색어가 없을 때");
			outproductList = oService.getListPageSizeObjectOutProductVO(pvo);
		}
		
		
		// View 페이지 전달
		model.addAttribute("pvo", pvo);
		model.addAttribute("outproductList", outproductList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		
		return null;
	}
	
	
	// 2-1. 출고번호 - 자동넘버링
	@RequestMapping(value="/opid", method=RequestMethod.GET)
	public void getOpIdGET(Model model) throws Exception {
		logger.debug("@@@@@@@@@@ getOpIdGET() 호출");
		
		String maxNumber = oService.getMaxNumber();
		String maxDate = oService.getMaxDate();
		logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	
		logger.debug("@@@@@@@@@@@@@@ maxDate = " + maxDate);	   
		
		model.addAttribute("maxNumber", maxNumber);
		model.addAttribute("maxDate", maxDate);
	}
	
	// 2-2. 출고번호 & "재고량 감소" - DB 업데이트
	@RequestMapping(value="/opid", method=RequestMethod.POST)
	public void getOpIdPOST(Model model, @RequestBody OutProductVO vo) throws Exception{
		logger.debug("@@@@@@@@@@ getOpIdPOST()_호출");
		logger.debug("@@@@@@@@@@ vo = " + vo);
		
		// 입고번호, 발주번호 DB에 저장
		oService.registOpId(vo);
	}
	
	
	// 3. 출고 상세보기
	@RequestMapping(value = "/info", method=RequestMethod.GET)
	public void getOutProductInfo(Model model, @RequestParam("cont_id") String cont_id,
											   @RequestParam("product_id") String product_id) throws Exception{
		logger.debug("@@@@@@@@@@ getOutProductInfo()_호출");
		
		OutProductVO info = oService.getOutProductInfo(cont_id);
		logger.debug("@@@@@@@@@@ 출고 상세보기 테이블1 : " + info);
		
		List<OutProductVO> inventoryList = oService.getInventory(product_id);
		logger.debug("@@@@@@@@@@ 출고 상세보기 테이블2 : " + inventoryList);
		
		model.addAttribute("info", info);
		model.addAttribute("inventoryList", inventoryList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
