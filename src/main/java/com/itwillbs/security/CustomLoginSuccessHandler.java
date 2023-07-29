package com.itwillbs.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

		//로거출력을 위한 로거객체 생성 
		private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);		
		

		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
			//인증성공 했을 때 처리하는 동작들
			logger.debug("onAuthenticationSuccess() 호출 완료!");
			
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
			
			//위의 람다식을 익명클래스로 만든 경우. Ctrl+1 -> create ananymous class 클릭!
//			authentication.getAuthorities()
//			.forEach(new Consumer<GrantedAuthority>() {
//				@Override
//				public void accept(GrantedAuthority authgority) {
//						roleNames.add(authgority.getAuthority());
//				}
//			});
			
			
			//ROLE_MEMBER-> /member페이지로 이동
			if(roleNames.contains("ROLE_MEMBER")) {
				//ex) 추가적인 동작(세숀에 정보 저장하기)
//				HttpSession session = request.getSession();
//				session.setAttribute(name, value);
				logger.debug("ROLE_MEMBER 권한 있음!");
				response.sendRedirect("/member");
				return;
			}// if END
			
			//ROLE_ADMIN -> /admin페이지로 이동 
			if(roleNames.contains("ROLE_ADMIN")) {
				logger.debug("ROLE_ADMIN 권한 있음!");
				response.sendRedirect("/admin");
				return;
			}// if END
			
			
			response.sendRedirect("/all");
			
		}// method END

}
