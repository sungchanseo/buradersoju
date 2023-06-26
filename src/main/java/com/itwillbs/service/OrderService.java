package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.OrderVO;

public interface OrderService {

	// 발주목록 보기
	public List<OrderVO> getOrderList();
	
	// 발주등록 하기
	public void orderInsert(OrderVO vo);
	
    // 발주수정하기
	public Integer modifyOrder(OrderVO mvo);
	
	// 발주조인하기 
    public OrderVO getOrderInfo(String ma_id);
}
