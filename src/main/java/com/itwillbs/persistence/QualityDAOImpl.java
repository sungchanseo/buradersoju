package com.itwillbs.persistence;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.itwillbs.domain.ProductionVO;

@Repository
public class QualityDAOImpl implements QualityDAO {
	

	// DB 연결 (의존주입)
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	//mapper구분하는 값 namespace
	private static final String NAMESPACE = "com.itwillbs.mappers.qualityMapper";

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(QualityDAOImpl.class);
		
	
		// 품질관리 목록 보기 
		@Override
		public List<ProductionVO> getQualityList() throws Exception{
			logger.info("@@@@품질관리 목록 가져오기@@@@");
			return sqlSession.selectList(NAMESPACE+".qualityList");
		}

		@Override
		public ProductionVO getQualityInfo(String qc_num) {
			logger.info("@@@@검수 상세 보기@@@@");
			return sqlSession.selectOne(NAMESPACE+".qualityInfo", qc_num);
		}

		@Override
		public void insertQuality(ProductionVO pvo) {
			logger.info("@@@@검수 등록 페이지 열기@@@@");
		}

		@Override
		public ProductionVO getInsertSearch(String production_id) {
			logger.info("@@@@검수 등록 조회@@@@");
			return sqlSession.selectOne(NAMESPACE+".insertSearch", production_id);
		}

		@Override
		public Integer updateQuality(ProductionVO pvo) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public void qualityInsertDB(ProductionVO vo) {
			logger.info("@@@@검수 등록 등록시작@@@@");
				
			int result = sqlSession.insert(NAMESPACE+".qInsertDB", vo);
			sqlSession.insert(NAMESPACE+".qInsertDB2", vo);
			
			if(result != 0)
				logger.debug("저장 완료!");
			
		}

		@Override
		public List<ProductionVO> getBottleList() throws Exception {
			logger.info("@@@@공병 목록 가져오기@@@@");
			return sqlSession.selectList(NAMESPACE+".bottleList");
		}

		@Override
		public void btInsert(ProductionVO vo) {
			int result = sqlSession.update(NAMESPACE+".btInsert", vo);
			
			if(result != 0)
				logger.debug("저장 완료!");
		}

		@Override
		public void btUpdate(ProductionVO vo) throws Exception {
			sqlSession.update(NAMESPACE+".btUpdate", vo);
		}




	
	
}
