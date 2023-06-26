package com.itwillbs.persistence;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;

@Repository
public interface CustomerDAO {

	//거래처 상세보기 
	public CustomerVO getCustomerInfo(String cust_id);
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO cvo);
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO cvo);
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id);
	
	//거래처 사업자번호 중복체크
	public Integer regNumCheck(String reg_num);
}