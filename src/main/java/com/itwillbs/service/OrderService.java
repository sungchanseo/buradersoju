package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PagingVO;

public interface OrderService {

	// 발주목록 보기
	public List<OrderVO> getOrderList() throws Exception;	
	
    // 발주수정하기
	public Integer modifyOrder(OrderVO ovo) throws Exception;
   
    // 발주 등록하기
    public void insertOrder(OrderVO vo) throws Exception;
    
    // 발주번호 최대값 (maxNumber) 230620004
 	public String getMaxNumber() throws Exception;

 	// 발주번호 최대날짜 (maxDate) 230620
 	public String getMaxDate() throws Exception;
 	
    // 발주번호 등록하기
 	public void registOrderId(OrderVO vo) throws Exception;
 	
 	// 발주 페이징 처리 및 탭기능 및 검색기능하기
 	public PagingVO setPageOrder(PagingVO pvo) throws Exception;
 	
 	// 발주 목록 조회하기 
 	public OrderVO getOrderInfo(String order_id) throws Exception;
 	
 	// 발주 정보 삭제하기
 	public Integer deleteOrder(String order_id) throws Exception;
 
 	// 자재 발주 정보가져오기
 	public List<OrderVO> getMaterialList(String ma_id) throws Exception;

    public OrderVO getMaterial(String ma_id) throws Exception;
}
