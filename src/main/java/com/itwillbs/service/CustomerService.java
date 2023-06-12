package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.CustomerVO;

public interface CustomerService {
	
	//거래처 목록 조회 
	public List<CustomerVO> getCustomerList();
	
	//거래처 상세정보 조회
	public CustomerVO getCustomerInfo(String cust_id);
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO vo);
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO mvo);
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id);
	

}