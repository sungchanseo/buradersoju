package com.itwillbs.contract;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.persistence.ContractDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ContractDAOTest {
	
	 private static final Logger logger = LoggerFactory.getLogger(ContractDAOTest.class);
	 
	 @Autowired
	 private ContractDAO cdao;
	 
//	 @Test
	 public void insertContract() throws Exception{
		 logger.debug("^^^^^^^^^^^^^^^^ContractDAOTest : 테스트 시작합니다!");
		 
		 ContractVO cvo = new ContractVO();
		 cvo.setCont_id("CO20230101008");
		 cvo.setCont_qty(100);
		 cvo.setProduct_name("가가멜");
		 cvo.setCont_emp("고길동");
		 cdao.insertContract(cvo);
	 }
	 
//	 @Test
	 public void updateContract() throws Exception{
		 logger.debug("^^^^^^^^^^^^^^^^ContractDAOTest : 테스트 시작합니다!");
		 
		 ContractVO cvo = new ContractVO();
		 cvo.setCont_id("CO20230101008");
		 cvo.setCont_qty(120000);
		 cvo.setProduct_name("경남은행");
		 cvo.setCont_emp("이창용");
		 
		 cdao.updateContract(cvo);
	 }
//	 @Test
	 public void removeContract() throws Exception{
		 logger.debug("^^^^^^^^^^^^^^^^ContractDAOTest : 테스트 시작합니다!");
		 
		 cdao.deleteContract("CO20230101008");
	 }
}
