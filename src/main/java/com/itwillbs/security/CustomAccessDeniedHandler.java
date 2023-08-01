package com.itwillbs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
/**
 * 로그인에 실패했을 때 처리하는 로직에 관한 클래스 
 */
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	private static final Logger logger = LoggerFactory.getLogger(CustomAccessDeniedHandler.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		logger.debug(" CustomAccessDeniedHandler 호출!!!! ");

		logger.debug(" 잘못된 접근 (접근권한 없음!!) ");
		logger.debug(" 에러페이지 출력!!! ");
		
		response.sendRedirect("/main/accessError");
	}
}
