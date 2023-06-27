package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.OrderVO;

public interface OrderService {

	// 발주목록 보기
	public List<OrderVO> getOrderList() throws Exception;
	
	
    // 발주수정하기
	public Integer modifyOrder(OrderVO mvo);
   
    // 발주 등록하기
    public void insertOrder(OrderVO vo) throws Exception;
    
    // 발주번호 최대값 (maxNumber) 230620004
 	public String getMaxNumber() throws Exception;

 	// 발주번호 최대날짜 (maxDate) 230620
 	public String getMaxDate() throws Exception;
 	
    // 발주번호 등록하기
 	public void registOrderId(OrderVO vo) throws Exception;
    
  
    
}
