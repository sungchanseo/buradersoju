package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.OrderVO;
import com.itwillbs.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	// dao 사용을 위한 의존성 주입
	
	@Inject
	private OrderDAO odao;

	// 전체 리스트 불러오기
	@Override
	public List<OrderVO> getOrderList() {

		return odao.getOrderList();		
	}

	@Override
	public void orderInsert(OrderVO vo) {
		
		odao.orderInsert(vo);
		
	}

	@Override
	public Integer modifyOrder(OrderVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderVO getOrderInfo(String ma_id) {
		return odao.getOrderInfo(ma_id);
	}




	
}
