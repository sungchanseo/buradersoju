package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.service.CustomerService;
/**
 * REST방식을 처리하는 콘트롤러 
 * 다양한 ajax를 전달받아 처리한다. 
 * @author YURAN
 *
 */
@RestController
@RequestMapping(value="/rests")
public class AjaxRestController {

	 private static final Logger logger = LoggerFactory.getLogger(AjaxRestController.class);
	
	 @Autowired
	 private CustomerService custService;
	 
	//거래처 사업자등록번호 ajax맵핑
	@RequestMapping(value="/{reg_num}", method=RequestMethod.GET)
	public String regNumCheck(@PathVariable("reg_num") String reg_num) throws Exception{
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
