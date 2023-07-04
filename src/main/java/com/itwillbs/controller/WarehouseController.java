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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.WarehouseService;



@Controller
@RequestMapping(value= "/purchasing/warehouse/*")
public class WarehouseController {
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	
	// 객체주입
	@Inject
	private WarehouseService wService;
	

	
	/// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	// http://localhost:8088/purchasing/warehouse/list
	// 1. 창고 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void whListGET(Model model,
						  HttpServletRequest request, HttpSession session) throws Exception{
		
		logger.debug("@@@@@@@@@@@@@@@ whListGET 호출");
		
		// 리스트 출력 (페이징처리 X)
		List<WarehouseVO> warehouseList = wService.getWarehouseList();
		
		// view페이지 정보 전달
		model.addAttribute("warehouseList", warehouseList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
	}
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertGET (WarehouseVO vo, Model model) throws Exception {
		
		logger.debug("@@@@@발주 등록 가즈아아~~");
		
		String maxNumber = wService.getMaxNumber();
		logger.debug("@@@@@@@@ maxNumber" + maxNumber);

		model.addAttribute("maxNumber" ,maxNumber);
		return "/purchasing/warehouse/insert";
	}
	
	// http://localhost:8088/purchasing/warehouse/insert
	// 창고등록 하기
	@RequestMapping(value ="insert", method = RequestMethod.POST)
	public String insertPOST(WarehouseVO vo , HttpSession session , Model model) throws Exception {
		 
		logger.debug("@@@@ 창고 등록 POST @@@");
		logger.debug("@@@@ 등록된 정보 @@@" + vo);
		
//		String maxNumber = wService.getMaxNumber();
//		logger.debug("@@@@@@@@ maxNumber" + maxNumber);
    	wService.warehouseInsert(vo);
		// Vies 페이지 정보 전달
//		model.addAttribute("maxNumber" ,maxNumber);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		
		return "redirect:/purchasing/warehouse/list";
	}
	
	// 창고수정하기위해 아이디 가져오고 입력하기
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	@ResponseBody
	public WarehouseVO modifyWarehouseGET(WarehouseVO vo ,@RequestParam("whs_id") String whs_id)throws Exception {
		logger.debug("modify 창고 수정입력하자아");
		
		WarehouseVO warehouse = wService.regisWhsId(whs_id);

		logger.debug("warehouseModiy@@@" + warehouse);
      
		 return warehouse;
	}
	
	// 창고정보 수정 디비처리
	@RequestMapping(value = "modify", method = RequestMethod.POST , produces = "application/json;charset=UTF-8" )
    @ResponseBody
	public String modifyWarehousePOST(@RequestBody WarehouseVO mvo) throws Exception {
		logger.debug("mdify 창고 수정 처리 가즈아~");
	    
		wService.modifyWarehouse(mvo);
		return "redirect:/purchasing/warehouse/list";
	}
	// 창고정보 삭제하기
    @RequestMapping(value = "remove" ) 	
	public String removeWarehousePOST( WarehouseVO vo) {
    	 logger.debug("창고정보삭제에에에에@@");
    	 
//    	  waservice.re
    	 logger.debug("vo" + vo);
    //	 wService.removeWarehouse(vo.getWhs_id());
          logger.debug("삭제완료오오@@@@");
    	return "redirect:/purchasing/warehouse/list";
	}
}
