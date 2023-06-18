package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {

	 private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	// dao 사용을 위한 의존성주입
	@Inject
	private CustomerDAO cdao;
	@Inject
	private PagingService pageService;
	
	//PagingDAO사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	
	@Override
	public PagingVO setPageInfoForCustomer(PagingVO pvo) throws Exception{
		logger.debug("@@@@@@CustomerService : setPageInfoForCustomer호출!");
		/*
		 * CustomerService
		 * - 페이징처리를 위해서는 도메인별로 다른 변수를 저장해야 한다. 
		 * => 해당 변수를 CustomerService에서 저장!
		 * - 페이징처리 계산은 공통이므로 PagingService에서 처리한다.
		 * => PagingSeriv의 메소드를 호출! 
		 */
		
		//customer서비스에 필요한 변수를 저장. 
		pvo.setTable("customer");
		pvo.setId("cust_id");
		pvo.setPageSize(5);
		pvo.setStartRow(1);
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		logger.debug("@@@@@@CustomerService : {}",pvo);

		
		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@CustomerService : {}",pvo);
		return pvo;
	}
	
	@Override
	public CustomerVO getCustomerInfo(String cust_id) throws Exception{
		return cdao.getCustomerInfo(cust_id);
	}

	@Override
	public void insertCustomer(CustomerVO vo) throws Exception{
		cdao.insertCustomer(vo);
	}

	@Override
	public Integer modifyCustomer(CustomerVO mvo) throws Exception {
		return cdao.modifyCustomer(mvo);
	}

	@Override
	public Integer removeCustomer(String cust_id) throws Exception {
		return cdao.removeCustomer(cust_id);
	}

}