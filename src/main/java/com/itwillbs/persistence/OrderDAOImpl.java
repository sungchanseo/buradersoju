package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;
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
	public List<OrderVO> getOrderList() {
		logger.debug("@@@@@@@@@DAO 발주 목록을 조회합니다 @@@@@");
		return sqlSession.selectList(NAMESPACE+".getOrderList");
	}
    
	// 발주수정하기 
	@Override
	public Integer modifyOrder(OrderVO ovo) {
	
		return sqlSession.update(NAMESPACE+".modifyOrder",ovo);
	}


	@Override
	public void insertOrder(OrderVO vo) {		
		sqlSession.insert(NAMESPACE+".insertOrder",vo);
		sqlSession.insert(NAMESPACE+".insertOrders",vo);
	//	sqlSession.selectOne(NAMESPACE+"getMaterialList",vo);
	}

	@Override
	public String getMaxNumber() {
		
		return sqlSession.selectOne(NAMESPACE+".getMaxNumber"); //230620001
	}

	@Override
	public String getMaxDate() {
	
		return sqlSession.selectOne(NAMESPACE+".getMaxDate");
	}

	@Override
	public void regisOrderId(OrderVO vo) throws Exception {
	
		sqlSession.update(NAMESPACE + ".regisOrderId", vo);
	}

	@Override
	public OrderVO getOrderInfo(String order_id) throws Exception {
		
		
		return sqlSession.selectOne(NAMESPACE+".getOrderInfo",order_id);
	}

	@Override
	public Integer deleteOrder(String order_id) throws Exception {
	
		return sqlSession.delete(NAMESPACE+".deleteOrder", order_id);
	}

	@Override
	public List<OrderVO> getMaterialList(String ma_id ) throws Exception {
		  
		return sqlSession.selectOne(NAMESPACE+".getMaterialList", ma_id);
	}

	@Override
	public OrderVO getMaterial(String ma_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getMaterial",ma_id);
	}

	
	
	
	
	
}
