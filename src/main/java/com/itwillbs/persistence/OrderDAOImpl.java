package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	//DB연결을 위한 xml 객체 주입(의존성 주입)
	@Inject
	private SqlSession sqlSession;
	
	
	// mapper식별을 위한 NAMESPACE
	private static final String NAMESPACE ="com.itwillbs.mappers.orderMapper";

	// 발주목록 보기
	@Override
	public List<OrderVO> getOrderList(String order_id) {
		logger.debug("@@@@@@@@@DAO 발주 목록을 조회합니다 @@@@@");
		return sqlSession.selectList(NAMESPACE+".getOrderList",order_id);
	}
    
    // 발주등록하기
	@Override
	public void orderInsert(OrderVO vo) {
	
		logger.debug("@@@@@@DAO 발주 등록해봅시다.... ㅠㅠ");
		sqlSession.insert(NAMESPACE+".orderInsert",vo);
		
	}

	// 발주수정하기 
	@Override
	public Integer modifyOrder(OrderVO vo) {
	
		return null;
	}

	@Override
	public OrderVO getOrderInfo(String ma_id) {
		logger.debug("@@@@@@DAO 조인 해봅시다.... ㅠㅠ");
		return sqlSession.selectOne(NAMESPACE+".getOrderInfo",ma_id);
	}
   
	

}
