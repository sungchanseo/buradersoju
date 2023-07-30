package com.itwillbs.security;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.persistence.EmployeeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{
			"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		})
public class EmpInputTEST {

	@Inject
	private EmployeeDAO edao;
	
	@Inject
	private PasswordEncoder pwencoder;
	
	@Test
	public void 비밀번호인코딩수정하기() {
		
		EmployeeVO emp = new EmployeeVO();
		
		emp.setEmp_id("2023001");
		emp.setEmp_pw(pwencoder.encode("1234"));
		
		edao.modifiyEmployee(emp);
		
	}
	
	
}
