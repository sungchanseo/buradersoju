package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.controller.MainController;
import com.itwillbs.domain.LoginVO;
import com.itwillbs.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//DB와 연결 (의존주입)
	@Inject
	private LoginDAO mdao;


	//로그인기능
	@Override
	public LoginVO loginMember(LoginVO vo) {
		System.out.println("S : 컨트롤러에서 호출받으면 필요한 정보를 받아서 DAO로 전달");
		logger.debug("vo="+ vo);
		LoginVO returnVO = null;
		try {
			returnVO = mdao.readMemberWithIDPW(vo.getEmp_id(), vo.getEmp_pw());
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnVO; //null이 반환되면 앞의 코드가 문제가 있다는 것을 바로 알수있다.
	}	
}