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
 	
 	
 	// 발주 목록 조회하기 
 	public OrderVO getOrderInfo(String order_id) throws Exception;
 	
 	// 발주 정보 삭제하기
 	public Integer deleteOrder(String order_id) throws Exception;
 
 	// 자재 발주 정보가져오기
 	public List<OrderVO> getMaterialList(String ma_id) throws Exception;
 	 
 	// 발주 정보 조회하기 (자동완성기능구현 )
 	public OrderVO getOrderInfoauto(String order_id) throws Exception;
 	
//  특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
 	public void getAddMa(String order_id) throws Exception;
 
    
 	
 	
 // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 	// 페이징처리 세부로직
 	public PagingVO pagingAction(PagingVO pvo) throws Exception;
 	
 	// 1. 개수 구하기
 	// 입고 전체 목록 조회
 	public int getListAll(PagingVO pvo)throws Exception ;
 	
 	// 페이징 목록 개수
 	public int getListPageSizeAll(PagingVO pvo) throws Exception;
 	
 	// 검색어 + 페이징 전체 목록	
 	public int getListSearchAll(PagingVO pvo)throws Exception ;
 	
 	// 필터 + 페이징 목록 개수	
 	public int getListFilterAll(PagingVO pvo)throws Exception ;
 	
 	// 검색어 + 필터 + 페이징 목록 개수
 	public int getListSearchFilterAll(PagingVO pvo) throws Exception;
 	
 	
 	// 2. 객체 가져오기
 	// 아무조건이 없을 때 전체 목록 객체
 	public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception;
 	
 	// 검색어 있을 때 전체 목록 객체
 	public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception;
 	
 	// 검색어 + 필터처리 전체 목록 객체
 	public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo)throws Exception;
 	
 	// 검색어와 필터 모두 있을 때 전체 목록 객체
 	public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception;
 	
 	
 	
}
