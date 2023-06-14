package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.LoginVO;
import com.itwillbs.service.LoginService;

@Controller
@RequestMapping(value = "/member/*")
public class LoginController {
	//3-1. 서비스 처리 객체를 주입(DI)
	@Inject
	private LoginService service;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/* 로그인 기능 */
	// http://localhost:8088/member/login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		logger.info("C: 로그인 입력페이지 GET");
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(LoginVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("C: 로그인 처리페이지 POST");
		logger.info("C: vo" + vo );
		//1.한글처리 => web.xml에서 처리 완료
		//2.전달받은 파라미터 저장 => loginPOST()메서드의 파라미터값으로 저장함.
		logger.info("C: 로그인 처리"+ vo.getEmp_id() + vo.getEmp_pw());
		//3.서비스객체생성 =>  의존주입완료
		//4.서비스 로그인 체크 동작(HttpSession)
		LoginVO returnVO = service.loginMember(vo);
		logger.info("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) "+returnVO);
		
			//5.메인페이지로 이동(주소줄과 view페이지 동시에 main으로 변경되어야함)
			// 해당 정보 있는 경우 : => main페이지로 이동
		if(returnVO != null) {
			//5.세션값생성
			session.setAttribute("emp_id", returnVO.getEmp_id());
			rttr.addFlashAttribute("mvo", returnVO);
			//l.info("C: 모델값 : "+model);
			logger.info("로그인 성공!");
			 return "redirect:/main";
		}else {
			// 해당 정보 없는 경우 : => login페이지로 이동
			logger.info("로그인 실패!");
			return "redirect:/member/login";
		}
	}//end of loginPOST()
	
	// 로그아웃
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.debug("logoutGET() 호출!");
		
		// 세션정보 초기화
		session.invalidate();
		
		//return "redirect:/member/login";
		return "redirect:/member/login";
	}

}
