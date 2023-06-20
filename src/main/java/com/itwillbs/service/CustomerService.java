package com.itwillbs.service;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;

public interface CustomerService {
	
	//페이징처리 변수저장을 위한 serive생성
	public PagingVO setPageInfoForCustomer(PagingVO pvo) throws Exception;
	
	//거래처 상세정보 조회
	public CustomerVO getCustomerInfo(String cust_id) throws Exception;
	
	//거래처 등록하기 
	public void insertCustomer(CustomerVO vo) throws Exception;
	
	//거래처 수정하기 
	public Integer modifyCustomer(CustomerVO mvo) throws Exception;
	
	//거래처 삭제하기 
	public Integer removeCustomer(String cust_id) throws Exception;
	

}