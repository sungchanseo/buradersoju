package com.itwillbs.employee;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.persistence.EmployeeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class EmployeeDAOTest {

	 private static final Logger logger = LoggerFactory.getLogger(EmployeeDAOTest.class);
	 
	 @Inject
	 private EmployeeDAO edao;
	 
//	 @Test
	 public void 회원인증등록하기() {
		 logger.debug("EmployeeDAOTest : 회원인증 등록하기 호출!!!");
		 EmployeeVO vo = new EmployeeVO();
		 
		 vo.setEmp_id("2000002");
		 vo.setAuth("ROLE_MEMBER");
		 
		 edao.insertEmployeeAuth(vo);
	 }
}
