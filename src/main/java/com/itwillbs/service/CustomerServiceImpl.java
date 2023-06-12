package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.persistence.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	//dao 사용을 위한 의존성주입
	@Inject
	private CustomerDAO cdao;
	
	@Override
	public List<CustomerVO> getCustomerList() {
		return cdao.getCustomerList();
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