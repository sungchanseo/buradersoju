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
	public void orderListGET(Model model , OrderVO vo)  throws Exception{
		
		logger.debug("@@@@@orderList 호출@@@@@");
		// service 객체 호출
		List<OrderVO> orderList = orserivce.getOrderList();
        logger.debug("@@@@@@@@@@ getOrderIdGET() 호출");
 		
 		String maxNumber = orserivce.getMaxNumber();
 		String maxDate = orserivce.getMaxDate();
	    
	    // View페이지 정보 전달
 		logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	
 		logger.debug("@@@@@@@@@@@@@@ maxDate = " + maxDate);	   
 		
 		model.addAttribute("maxNumber", maxNumber);
 		model.addAttribute("maxDate", maxDate);
		model.addAttribute("orderList", orderList);
	}
	
	// http://localhost:8088/purchasing/order/list
    @RequestMapping(value="/list", method = RequestMethod.POST)
    public String orderInsertGET(OrderVO vo ) throws Exception {
   
     logger.debug("@@@@@발주 등록 행추가 가즈아~@@@@");
   
	 logger.debug("vo :" + vo);
	
	 orserivce.insertOrder(vo);
      return "redirect:/purchasing/order/list";
   }
    // 발주 수정 (조회)
 // http://localhost:8088/purchasing/order/list
   @RequestMapping(value = "/modify" , method = RequestMethod.GET)
   @ResponseBody
    public OrderVO modifyOrderGET(Model model, @RequestParam("order_id") String order_id) throws Exception {
    	logger.debug("@@@@@modifyOrderGET()호출!@@@@@");
    	
    	// 기존의 정보 출력
    	
    	OrderVO orderVo = orserivce.getOrderInfo(order_id);
    	
    	return orderVo;
    }
// http://localhost:8088/purchasing/order/list
   @RequestMapping(value = "/lists" , method = RequestMethod.GET)
   @ResponseBody
    public List<OrderVO> modifyOrderGET2(Model model, String ma_id) throws Exception {
    	logger.debug("@@@@@modifyOrderGET()호출!@@@@@");
    	logger.debug("ma_id" + ma_id);
    	
    	// 테이블의 정보를 가져와서 모엘에 추가 
        List<OrderVO> orderList = orserivce.getMaterialList(ma_id);
        model.addAttribute("orderList",orderList);
    	
    	return orderList;
    }
//   http://localhost:8088/purchasing/order/list
//  발주 수정 (데이터처리)
	@RequestMapping(value = "/modify", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyMaterialPOST(@RequestBody OrderVO ovo) throws Exception {
		logger.debug("@@@@@@@@@@ modifyMaterialPOST_호출");

		// 전달된 정보 저장
		logger.debug("@@@@@@@@@@ 수정된 데이터 : " + ovo);

		// 서비스 객체 사용으로 데이터 처리
		Integer result = orserivce.modifyOrder(ovo);
		logger.debug("@@@@@@@@@@ 업데이트 된 행의 수  : " + result);

		return "redirect:/purchasing/order/list";
	}
	
	// 발주 정보 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteOrderPOST(@RequestParam("order_id") String order_id) throws Exception{
		
		logger.debug("deletePOST 호출@@@@@@");
	
		int result = orserivce.deleteOrder(order_id);	
		logger.debug("@@@@@@@@@@ 삭제 된 행의 수 : " + result);
	}
  
	
}
