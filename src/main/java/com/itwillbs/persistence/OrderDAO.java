	package com.itwillbs.persistence;



import java.util.List;





import org.springframework.stereotype.Repository;


import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PagingVO;

@Repository
public interface OrderDAO {

	// 발주 목록보기
	public List<OrderVO> getOrderList() throws Exception;
	
	// 발주 수정하기
	public Integer modifyOrder(OrderVO ovo) throws Exception;
	
	// 발주 등록하기 
	public void insertOrder(OrderVO vo) throws Exception;
			
	//발주번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;
		
    // 발주번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;
	
	// 발주번호등록하기 
    public void regisOrderId(OrderVO vo) throws Exception;
	
    // 발주 정보 조회하기
 	public OrderVO getOrderInfo(String order_id) throws Exception;
 	
 	// 발주 정보 삭제하기
 	public Integer deleteOrder(String order_id) throws Exception;
    
 	// 자재 발주 정보 조회하기 
 	public List<OrderVO> getMaterialList(String ma_id) throws Exception;
 	
 	 // 발주 정보 조회하기 (자동완성기능구현 )
 	public OrderVO getOrderInfoauto(String order_id) throws Exception;
 	
    //  특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
 	public void getAddMa(String order_id) throws Exception;
 	
 	
 	
 	
 	

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 개수 구하기
	// 전체 목록 개수 가져오기
	public int getListAll(PagingVO pvo)throws Exception ;

	//아무조건이 없을 때 전체 목록 개수
	public int getListPageSizeAll(PagingVO pvo) throws Exception;

	//검색어 + 페이징처리 전체 목록 개수	
	public int getListSearchAll(PagingVO pvo)throws Exception;
	
	//검색어 + 필터처리 전체 목록 개수 	
	public int getListFilterAll(PagingVO pvo)throws Exception;
	
	//검색어와 필터 모두 있을 때 전체 목록 개수
	public int getListSearchFilterAll(PagingVO pvo) throws Exception;
	
	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체
	public List<Object> getListPageSizeObjectOrderVO(PagingVO pvo) throws Exception;
	
	// 검색어 있을 때 목록 객체	
	public List<Object> getListSearchObjectOrderVO(PagingVO pvo) throws Exception;
	
	// 검색어 + 필터처리 전체 목록 개수	
	public List<Object> getListFilterObjectOrderVO(PagingVO pvo)throws Exception;
	
	// 검색어와 필터 모두 있을 때 전체 목록 개수
	public List<Object> getListSearchFilterObjectOrderVO(PagingVO pvo) throws Exception;
	
 

 	
}
