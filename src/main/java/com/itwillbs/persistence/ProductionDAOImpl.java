package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository
public class ProductionDAOImpl implements ProductionDAO {
	
	// 디비연결정보, mapper접근 => sqlSession 객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionDAOImpl.class);
	
	// mapper의 namespace 정보
	private static final String NAMESPACE = "com.itwillbs.mappers.productionMapper";
	
	// 생산목록
	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		logger.debug(" getProductionList() 호출 ");
		return sqlSession.selectList(NAMESPACE+".getProductionList");
	}

	// 작업지시번호 조회
	@Override
	public ProductionVO getInsertSearch(String production_id) throws Exception {
		logger.debug(" getInsertSearch() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".insertSearch", production_id);
	}

	// 혼합 등록
	@Override
	public void insertStage1(ProductionVO vo) throws Exception {
		logger.debug(" insertStage1() 호출 ");
		int insertResult = sqlSession.insert(NAMESPACE + ".insertStage1", vo);
		int updateResult = sqlSession.update(NAMESPACE + ".updateWostatus", vo);
		
		if (insertResult != 0 && updateResult != 0) {
	        logger.debug("혼합 등록 & 작업지시상태 변경 완료!");
	    } else if (insertResult != 0) {
	        logger.debug("혼합 등록 완료!");
	    } else if (updateResult != 0) {
	        logger.debug("작업지시상태 변경 완료!");
	    } else {
	        logger.debug("혼합 등록 & 작업지시상태 변경 실패!");
	    }
	}

	// 주입 등록
	@Override
	public void insertStage2(ProductionVO vo) throws Exception {
		logger.debug(" insertStage2() 호출 ");
		int result = sqlSession.insert(NAMESPACE + ".insertStage2", vo);
		
		if(result != 0)
			logger.debug(" 주입등록 완료! ");
		
	}

	// 포장 등록
	@Override
	public void insertStage3(ProductionVO vo) throws Exception {
		logger.debug(" insertStage3() 호출 ");
		int insertResult = sqlSession.insert(NAMESPACE + ".insertStage3", vo);
		int updateResult = sqlSession.update(NAMESPACE + ".updateProductionQty", vo);
		
		if (insertResult != 0 && updateResult != 0) {
	        logger.debug("포장 & 생산수량 등록 완료!");
	    } else if (insertResult != 0) {
	        logger.debug("포장 등록 완료!");
	    } else if (updateResult != 0) {
	        logger.debug("생산수량 등록 완료!");
	    } else {
	        logger.debug("포장 & 생산수량 등록 실패!");
	    }
		
	}
	
	
	
	
}
