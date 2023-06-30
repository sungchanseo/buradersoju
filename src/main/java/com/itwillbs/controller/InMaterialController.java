package com.itwillbs.controller;
import java.util.List;
import javax.inject.Inject;
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
	
	
	
	// 1. 입고 리스트 출력
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void inMaterialListAllGET(Model model) throws Exception{
		logger.debug("@@@@@@@@@@ inMaterialListAllGET()_호출");
		
		List<InMaterialVO> inMaterialList =  iService.getInMaterialListAll();
		model.addAttribute("inMaterialList", inMaterialList);
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
		model.addAttribute("resultVO", info);
	}


	
	
	
}
