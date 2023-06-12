package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;

@Repository
public interface CustomerDAO {

	
	//거래처 목록보기 
	public List<CustomerVO> getCustomerList();
	
	//거래처 상세보기 
	public CustomerVO getCustomerInfo(String cust_id);
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO vo);
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO mvo);
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id);
	
	
	
}