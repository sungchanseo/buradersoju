package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {

	// dao 사용을 위한 의존성주입
	@Inject
	private CustomerDAO cdao;
	
	// 페이징 처리1 - 전체 리스트 불러오기
	@Override
	public int getCustomerList() {
		return cdao.getCustomerList();
	}

	// 페이징 처리2 - limit 리스트 불러오기
	@Override
	public List<CustomerVO> getCustomerList(PagingVO pvo) {
		return cdao.getCustomerList(pvo);
	}

	@Override
	public CustomerVO getCustomerInfo(String cust_id) {
		return cdao.getCustomerInfo(cust_id);
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		cdao.insertCustomer(vo);
	}

	@Override
	public Integer modifyCustomer(CustomerVO mvo) {
		return cdao.modifyCustomer(mvo);
	}

	@Override
	public Integer removeCustomer(String cust_id) {
		return cdao.removeCustomer(cust_id);
	}

}