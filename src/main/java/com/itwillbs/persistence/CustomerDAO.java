package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;

@Repository
public interface CustomerDAO {

	
	//거래처 목록보기 
	public int getCustomerList();
	
	//거래처 목록 페이징처리
	public List<CustomerVO> getCustomerList(PagingVO pvo);
	
	//거래처 상세보기 
	public CustomerVO getCustomerInfo(String cust_id);
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO vo);
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO mvo);
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id);
	
	
	
}