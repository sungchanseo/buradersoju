package com.itwillbs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
/**
 * 로그인할 때 비밀번호가 틀렸을 때 호출되는 클래스. 
 * 주의사항으로, 만약 인증정보 자체가 없다면 accessDeniedHandler를 먼저 호출한다. 
 * @author YURAN
 *
 */
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	 private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
	 
	 
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		logger.debug("CustomerAuthenticationFailureHanler : onAuthenticationFailure 호출!!");
		 
		response.sendRedirect("/main/loginError");
	}

}
