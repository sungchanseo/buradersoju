package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.service.OrderService;

@Controller
@RequestMapping(value="/purchasing/order/*")
public class OrderController {
	
	@Inject
	private OrderService orserivce;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);	
	
	// http://localhost:8088/purchasing/order/list
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void orderListGET(Model model , OrderVO vo) {
		
		logger.debug("@@@@@orderList 호출@@@@@");
		// service 객체 호출
		List<OrderVO> orderList = orserivce.getOrderList();
	    
	    // View페이지 정보 전달
		model.addAttribute("orderList", orderList);
	}
    
    @RequestMapping(value="/list", method = RequestMethod.POST)
    public String orderInsertGET(OrderVO vo) {
   
     logger.debug("@@@@@발주 등록 행추가 가즈아~@@@@");
   
	 logger.debug("vo :" + vo);
	
	 orserivce.insertOrder(vo);
	 
      return "redirect:/purchasing/order/list";
   }

   @RequestMapping(value = "/modify" , method = RequestMethod.GET)
    public void modifyOrderGET(OrderVO vo) {
    	logger.debug("@@@@@modifyOrderGET()호출!@@@@@");
    }

 
}
