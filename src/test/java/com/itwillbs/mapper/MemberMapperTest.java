package com.itwillbs.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.persistence.EmployeeDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
@Log4j
public class MemberMapperTest {
	
	 private static final Logger logger = LoggerFactory.getLogger(MemberMapperTest.class);
	 
	 @Autowired
	 private EmployeeDAO edao;
	 
//	 @Autowired
//	 private MemberMapper mapper;
	 
	 @Test
	 public void testRead() {
		 
		 EmployeeVO vo = edao.read("2000002");
		 
		 vo.getAuthList().forEach(authVO -> logger.debug(""+authVO));
	 }
}
