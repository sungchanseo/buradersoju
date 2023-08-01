package com.itwillbs.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.ui.Model;

import com.itwillbs.domain.LoginVO;
import com.itwillbs.service.LoginService;
/**
 * 스프링 로그인 성공에 관한 클래스 
 * @author YURAN
 *
 */
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

		//로거출력을 위한 로거객체 생성 
		private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);		
		
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
			//인증성공 했을 때 처리하는 동작들
			logger.debug("CustomLoginSuccessHandler : onAuthenticationSuccess() 호출 완료!");
			
			//로그인 유저의 권한에 따른 페이지 이동
			//기존의 권한정보 확인 
			logger.debug(" auth : {}", authentication);
			List<String> roleNames = new ArrayList<>();
			
			//consumer -> 익명클래스 
			//람다식으로 작성한 경우.
			authentication.getAuthorities()
				.forEach(authgority -> {
						roleNames.add(authgority.getAuthority());
				});
			
			//ROLE_MEMBER-> /member페이지로 이동
			if(roleNames.contains("ROLE_MEMBER")) {
				logger.debug("ROLE_MEMBER 권한 있음!");
					
				response.sendRedirect("/main");
				return;
			}// if END
				
			logger.debug("인증에 실패했습니다!");
			response.sendRedirect("/main/accessError");
			
		}// method END

}
