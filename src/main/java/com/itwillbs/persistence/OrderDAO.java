package com.itwillbs.persistence;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderVO;

@Repository
public interface OrderDAO {

	// 발주 목록보기
	public  List<OrderVO>getOrderList();
}
