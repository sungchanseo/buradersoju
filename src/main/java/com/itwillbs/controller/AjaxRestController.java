package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.service.CustomerService;
/**
 * REST방식을 처리하는 콘트롤러 
 * 다양한 ajax를 전달받아 처리한다. 
 * @author YURAN
 *
 */
@RestController
@RequestMapping(value="/rest/*")
public class AjaxRestController {

	 private static final Logger logger = LoggerFactory.getLogger(AjaxRestController.class);
	
	 @Autowired
	 private CustomerService custService;
	 
	//view페이지의 ajax에서 정보를 받아서 다시 되돌려줄려면 @ResponseBody 어노테이숀을 반듯이 적어야 한다. 
	//다만, 콘츄롤러 상단의 @Controller 대신 @RestController 어노테이숀을 추가하면 안 적어도 된다. 
	//거래처 사업자등록번호 ajax맵핑
	@RequestMapping(value="/regCheck", method=RequestMethod.GET)
	public String regNumCheck(@RequestParam("reg_num") String reg_num) throws Exception{
		logger.debug("@@@@@@@@@@@@AjaxRestController : 사업자번호 체크 AJAX!!!!");
		logger.debug("@@@@@@@@@@@@AjaxRestController : reg_num={}", reg_num);
		
		String result=null;
		int numCheckResult = custService.regNumCheck(reg_num);
		logger.debug("@@@@@@@@@@@@AjaxRestController : numCheckResult={}", numCheckResult);
		if (numCheckResult==1) {
			result = "no";
		} else {
			result = "yes";
		}
		logger.debug("@@@@@@@@@@@@AjaxRestController : result={}", result);
		return result;
	}
	 
}
