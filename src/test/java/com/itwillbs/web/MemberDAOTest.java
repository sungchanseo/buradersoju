//package com.itwillbs.web;
//
//import javax.inject.Inject;
//
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.itwillbs.domain.MemberVO;
//import com.itwillbs.persistence.MemberDAO;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(
//		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
//		)
//public class MemberDAOTest {
//	// 생성해놓은 기능 호출
//	
//	// 로거 - 콘솔창에 메세지 출력
//	private static final Logger logger
//	            = LoggerFactory.getLogger(MemberDAOTest.class);
//	
//	// DAO 객체가 필요(의존관계) => 주입
//	@Inject
//	private MemberDAO mdao;
//	
////	@Inject
////	private SqlSession sqlSession;
//	
//	//@Test
//	public void 디비시간정보_조회() throws Exception{
//		
//		System.out.println( mdao.getTime() );
//		logger.info(  mdao.getTime() );
////		logger.error(msg);
////		logger.warn(msg);
////		logger.info(msg);
////		logger.debug(msg);
////		logger.trace(msg);
//		
//	}
//	
//	//@Test
//	public void 로그레벨테스트() throws Exception{
//		logger.warn("warn레벨 실행!");
//		logger.info("info레벨 실행!");
//		logger.debug("debug레벨 실행!");
//	}
//	
//	//@Test
//	public void 회원가입테스트() throws Exception{
//		logger.debug(" 뷰에서 정보를 입력 받음 -> 생성");
//		
//		MemberVO vo = new MemberVO();
//		vo.setUserid("itwill5");
//		vo.setUserpw("12342");
//		vo.setUsername("사용자5");
//		vo.setUseremail("user05@itwill.com");
//		
//		logger.debug(" DAO - 회원가입 메서드 호출 ");
//		// DAO 객체 주입 
//		mdao.insertMember(vo);
//	}
//	
//	//@Test
//	public void 로그인테스트() throws Exception{
//		logger.debug("로그인 테스트 시작");
//		
//		// 로그인 계정 
//		MemberVO vo = new MemberVO();
//		vo.setUserid("admin");
//		vo.setUserpw("1234234");
//		
//		// DAO - 로그인 체크하는 메서드 호출
//		MemberVO resultVO = mdao.loginMember(vo);
//		
//		if(resultVO == null) {
//			logger.debug("로그인 실패!");
//		}else {
//			logger.debug("로그인 성공!");
//		}
//		logger.debug("로그인 테스트 끝");
//	}
//	
//	//@Test
//	public void 회원정보수정() throws Exception{
//		logger.debug("회원수정 테스트 시작@@@@@@@@@@@@@@@@@@@@@");
//		
//		// 수정할 회원정보 => 뷰페이지에서 입력
//		MemberVO uvo = new MemberVO();
//		uvo.setUserid("admin");
//		uvo.setUserpw("12345");
//		uvo.setUsername("수정이름2");
//		uvo.setUseremail("ADMIN(수정2)@admin.com");
//		
//		Integer result = mdao.updateMember(uvo);
//		
//		if(result == 1) {
//			logger.debug(" 정상 수정 완료! ");
//		}else {
//			// result == 0
//			logger.debug(" 정상 수정 실패! (아이디or 비밀번호 오류)");
//		}
//		
//		
//		logger.debug("회원수정 테스트 끝@@@@@@@@@@@@@@@@@@@@@@@@");		
//	}
//	
//	@Test
//	public void 회원정보삭제테스트() throws Exception{
//		logger.debug(" 회원 삭제 테스트 시작 ");
//		
//		// 삭제할 회원정보
//		MemberVO dvo = new MemberVO();
//		dvo.setUserid("itwill");
//		dvo.setUserpw("12342");
//		
//		Integer result = mdao.deleteMember(dvo);
//		
//		if(result == 1) {
//			logger.debug(" 회원 삭제 완료! ");
//		}else {
//			logger.debug(" 회원 삭제 실패! ");
//		}
//		
//		logger.debug(" 회원 삭제 테스트 끝 ");	
//	}
//	
//	
//	
//	
//	
//	
//}
