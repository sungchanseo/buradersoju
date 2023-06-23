package com.itwillbs.paging;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.PagingDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class PagingDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(PagingDAOTest.class);
	
	@Inject
	private PagingDAO pdao;
	
//	@Test
	public void 전체목록갯수불러오기() throws Exception{
		logger.debug("***********TEST : 전체목록갯수불러오기 시작!");
		PagingVO pvo = new PagingVO();
		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		
		logger.info("***********TEST : PagingVO={}",pvo);
		logger.info("***********TEST : table={}",pvo.getTable());

		int result =pdao.getListAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
	
//	@Test
	public void 아무조건이없을때목록갯수불러오기() throws Exception{
		logger.info("***********TEST : 페이지사이즈있을때목록갯수불러오기 시작!");
		PagingVO pvo = new PagingVO();
		
		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		pvo.setStartRow(1);
		pvo.setPageSize(5);
		
		logger.info("***********TEST : PagingVO={}",pvo);
		int result =pdao.getListPageSizeAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
//	@Test
	public void 검색어가있을때전체목록갯수불러오기() throws Exception{
		logger.debug("***********TEST : 검색어있을때전체목록갯수불러오기 시작!");
		PagingVO pvo = new PagingVO();
		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		pvo.setSelector("cust_name");
		pvo.setSearch("국가");
		pvo.setStartRow(1);
		pvo.setPageSize(5);
		
		logger.info("***********TEST : PagingVO={}",pvo);
		int result =pdao.getListSearchAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
	
//	@Test
	public void 카테고리필터와페이지처리전체목록갯수불러오기() throws Exception{
		logger.debug("***********TEST : 카테고리필터와페이지처리전체목록갯수불러오기 시작!");
		PagingVO pvo = new PagingVO();

		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		pvo.setColumn_name("owner_name");
		pvo.setColumn_value("추경호");
		pvo.setStartRow(1);
		pvo.setPageSize(5);
		
		logger.info("***********TEST : PagingVO={}",pvo);
		int result =pdao.getListFilterAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
//	@Test
	public void 검색어와카테고리필터와페이지처리전체목록갯수불러오기() throws Exception{
		logger.debug("***********TEST : 검색어와카테고리필터와페이지처리전체목록갯수불러오기 시작!");
		PagingVO pvo = new PagingVO();

		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		pvo.setColumn_name("owner_name");
		pvo.setColumn_value("추경호");
		pvo.setSelector("cust_name");
		pvo.setSearch("국가");
		pvo.setStartRow(1);
		pvo.setPageSize(5);
		
		logger.info("***********TEST : PagingVO={}",pvo);
		int result =pdao.getListFilterAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
//	@Test
	public void 검색어와카테고리필터와페이지처리전체목록갯수를불러오자() throws Exception{
		logger.info("***********TEST : 검색어와카테고리필터와페이지처리전체목록객체를불러오자 시작!");
		PagingVO pvo = new PagingVO();

		pvo.setTable("customer");
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		pvo.setColumn_name("cust_name");
		pvo.setColumn_value("추경호");
		pvo.setId("cust_id");
		pvo.setStartRow(0);
		pvo.setPageSize(5);
		
		logger.info("***********TEST : PagingVO={}",pvo);
		int result =pdao.getListSearchFilterAll(pvo);
		logger.info("***********TEST : result={}",result);
	}
		
	
	
	
	
	
	
	
	
	
	
////	@Test
//	public void 아무조건없을때목록객체를불러보자() throws Exception{
//		logger.debug("***********TEST : 아무조건없을때목록객체를불러보자 시작!");
//		PagingVO pvo = new PagingVO();
//
//		pvo.setTable("customer");
//		pvo.setStatus_name("cust_status");
//		pvo.setStatus_value("0");
//		pvo.setStartRow(1);
//		pvo.setPageSize(5);
//		pvo.setId("cust_id");
//		
//		logger.info("***********TEST : PagingVO={}",pvo);
//		CustomerVO result = (CustomerVO)pdao.getListPageSizeObject(pvo);
//		logger.info("***********TEST : result={}",result);
//		
//	}
////	@Test
//	public void 검색어가있을때전체목록객체를불러오기() throws Exception{
//		logger.debug("***********TEST : 검색어가있을때전체목록객체를불러오기 시작!");
//		PagingVO pvo = new PagingVO();
//		pvo.setTable("customer");
//		pvo.setStatus_name("cust_status");
//		pvo.setStatus_value("0");
//		pvo.setSelector("cust_name");
//		pvo.setSearch("국가");
//		pvo.setId("cust_id");
//		pvo.setStartRow(0);
//		pvo.setPageSize(5);
//		
//		logger.info("***********TEST : PagingVO={}",pvo);
//		CustomerVO result = (CustomerVO)pdao.getListSearchObject(pvo);
//		logger.info("***********TEST : result={}",result);
//	}
////	@Test
//	public void 카테고리필터와페이지처리전체목록객체를불러오자() throws Exception{
//		logger.info("***********TEST : 카테고리필터와페이지처리전체목록갯수불러오기 시작!");
//		PagingVO pvo = new PagingVO();
//
//		pvo.setTable("customer");
//		pvo.setStatus_name("cust_status");
//		pvo.setStatus_value("0");
//		pvo.setColumn_name("cust_name");
//		pvo.setColumn_value("추경호");
//		pvo.setId("cust_id");
//		pvo.setStartRow(0);
//		pvo.setPageSize(5);
//		
//		logger.info("***********TEST : PagingVO={}",pvo);
//		CustomerVO result =(CustomerVO) pdao.getListFilterObject(pvo);
//		logger.info("***********TEST : result={}",result);
//	}
//	@Test
//	public void 검색어와카테고리필터와페이지처리전체목록객체를불러오자() throws Exception{
//		logger.info("***********TEST : 검색어와카테고리필터와페이지처리전체목록객체를불러오자 시작!");
//		PagingVO pvo = new PagingVO();
//
//		pvo.setTable("customer");
//		pvo.setStatus_name("cust_status");
//		pvo.setStatus_value("0");
//		pvo.setColumn_name("cust_name");
//		pvo.setColumn_value("추경호");
//		pvo.setId("cust_id");
//		pvo.setStartRow(0);
//		pvo.setPageSize(5);
//		pvo.setSelector("cust_name");
//		pvo.setSearch("추경호");
//		
//		logger.info("***********TEST : PagingVO={}",pvo);
//		CustomerVO result =(CustomerVO) pdao.getListSearchFilterObject(pvo);
//		logger.info("***********TEST : result={}",result);
//	}
//	
}
