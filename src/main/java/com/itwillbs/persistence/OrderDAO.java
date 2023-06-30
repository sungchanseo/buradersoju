package com.itwillbs.persistence;



import java.util.List;





import org.springframework.stereotype.Repository;


import com.itwillbs.domain.OrderVO;

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
 	
 	public OrderVO getMaterial(String ma_id) throws Exception;
 	
}
