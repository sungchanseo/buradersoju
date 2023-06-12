package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.service.CustomerService;

@Controller
@RequestMapping(value = "/customer/*")
public class CustomerController {

	//로그기록을 위한 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//Service 객체 사용을 위한 의존성 주입 
	@Inject
	private CustomerService custService;
	
	// http://localhost:8088/test/customer/list
	// http://localhost:8088/customer/list
	
	//거래처목록 보기 
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void customerListGET(Model model) {
		logger.debug("@@@@@@@@@Controller : 거래처 리스트 조회!");
		
		//serivce 객체 호출 
		List<CustomerVO> customerList = custService.getCustomerList();
		
		//변수를 가지고 뷰 페이지로 보내기 
		model.addAttribute("customerList", customerList);
	}
	
	//거래처 상세보기 
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public void customerInfoGET(CustomerVO vo, Model model) {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 상세보기 !");
		
		logger.debug(vo.getCust_id()+"");
		//servicer객체 호출
		CustomerVO customerInfo = custService.getCustomerInfo(vo.getCust_id());
		
		//변수에 넣어 뷰페이지로 보내기 
		model.addAttribute(customerInfo);
	}
}