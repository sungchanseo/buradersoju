package com.itwillbs.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
/**
 * 비밀번호 인코딩을 하지 않을 때에 관한 클래스 -> 실제 사용하지 않고 테스트 용도로 사용 
 * @author YURAN
 *
 */
public class CustomNoPasswordEncoder implements PasswordEncoder {

	private static final Logger logger = LoggerFactory.getLogger(CustomNoPasswordEncoder.class);	
	
	@Override
	public String encode(CharSequence rawPassword) {
		// 입력받은 비밀번호를 암호화하는 작업 
		logger.debug("encode() 수행 - 실제 암호화는 x");
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// 암호화 정보를 비교하는 메소드
		logger.debug("matches() 호출 - 실제비교 x");
		return rawPassword.toString().equals(encodedPassword);
	}
}
