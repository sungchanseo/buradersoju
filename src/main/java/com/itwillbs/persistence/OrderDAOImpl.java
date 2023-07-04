package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PagingVO;

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
	public OrderVO getOrderInfoauto(String order_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".getOrderInfoauto",order_id);
	}

	@Override
	public void getAddMa(String order_id) throws Exception {
		sqlSession.selectOne(NAMESPACE+".addMa", order_id);
	}
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
		// 1. 개수 가져오기
		// 전체 목록 개수
		@Override
		public int getListAll(PagingVO pvo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".getListAll", pvo);
		}
		
		// 아무조건이 없을 때 전체 목록 개수
		@Override
		public int getListPageSizeAll(PagingVO pvo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".getListPageSizeAll", pvo);
		}
		
		// 검색어 있을 때 목록 개수 	
		@Override
		public int getListSearchAll(PagingVO pvo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".getListSearchAll", pvo);
		}
		
		// 필터있을때 전체 목록 개수	
		@Override
		public int getListFilterAll(PagingVO pvo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".getListFilterAll", pvo);
		}
		
		// 검색어와 필터 모두 있을 때 전체 목록 개수
		@Override
		public int getListSearchFilterAll(PagingVO pvo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".getListFilterAll", pvo);
		}
		
		
		// 2. 객체 가져오기
		// 아무조건이 없을 때 전체 목록 객체
		@Override
		public List<Object> getListPageSizeObjectOrderVO(PagingVO pvo) throws Exception {
			return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectOrderVO", pvo);
		}
		
		// 검색어 있을 때 목록 객체	
		@Override
		public List<Object> getListSearchObjectOrderVO(PagingVO pvo) throws Exception {
		logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
			return sqlSession.selectList(NAMESPACE+".getListSearchObjectOrderVO", pvo);
		}
		
		// 필터있을 때 전체 목록 객체
		@Override
		public List<Object> getListFilterObjectOrderVO(PagingVO pvo) throws Exception {
			return sqlSession.selectList(NAMESPACE+".getListFilterObjectOrderVO",pvo);
		}
		
		// 검색어와 필터 모두 있을 때 전체 목록 개수
		@Override
		public List<Object> getListSearchFilterObjectOrderVO(PagingVO pvo) throws Exception {
			return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectOrderVO", pvo);
		}
}
