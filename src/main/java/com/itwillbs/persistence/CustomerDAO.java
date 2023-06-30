package com.itwillbs.persistence;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;

@Repository
public interface CustomerDAO {

	//거래처 상세보기 
	public CustomerVO getCustomerInfo(String cust_id) throws Exception;
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO cvo) throws Exception;
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO cvo) throws Exception;
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id) throws Exception;
	
	//거래처 사업자번호 중복체크
	public Integer regNumCheck(String reg_num) throws Exception;
	
	//거래처등록 번호 자동 카운트
	public String getLastGeneratedNumber() throws Exception;
}