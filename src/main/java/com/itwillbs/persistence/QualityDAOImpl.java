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
		
		//검수등록 번호 자동 카운트
		@Override
		public String getLastGeneratedNumber() throws Exception {
			logger.debug("수주등록 번호 카운트");
			return sqlSession.selectOne(NAMESPACE+".getLastGeneratedNumber");
		}
		

		@Override
		public void qualityInsertDB(ProductionVO vo, List<String> def_codeList, List<String> def_qtyList) {
			logger.info("@@@@ DAOImpl -검수 등록 등록시작 @@@@");
				
			int result = sqlSession.insert(NAMESPACE+".qInsertDB", vo);
			logger.debug("qc insert 완료");
			logger.debug("@@@@@@@@@ insert완료 후 vo : "+vo);
			
			// 상품 재고 추가
			sqlSession.update(NAMESPACE+".prUpdate", vo);
			logger.debug("production 테이블에 불량수를 뺀 생산량 변경 완료");
			logger.debug("@@@@@@@@@ update완료 후 vo : "+vo);
			//불량 코드 등록
			for (int i = 0; i < def_codeList.size(); i++) {
				vo.setDef_code(def_codeList.get(i));
				vo.setDef_qty(Integer.parseInt(def_qtyList.get(i)));
				sqlSession.insert(NAMESPACE+".qInsertDB2", vo);
			}
			
			if(result != 0)
				logger.debug("저장 완료!");
			
		}

		@Override
		public List<ProductionVO> getBottleList() throws Exception {
			logger.info("@@@@공병 목록 가져오기@@@@");
			return sqlSession.selectList(NAMESPACE+".bottleList");
		}

		@Override
		public void btInsert(ProductionVO vo) throws Exception {
			logger.debug("@@@@@@@@@@@@@디비 저장 시작 : "+vo);
			
			int result = sqlSession.selectOne(NAMESPACE+".btISearch", vo);
			logger.debug("@@@@@@@@@@@@@result : "+result);
					if(result == 0) {
						sqlSession.update(NAMESPACE+".btInsert", vo);
						logger.debug("중복 날짜 x 저장 완료");
					}else {
						logger.debug("중복 날짜, 저장실패");
					}
		}

		@Override
		public void btUpdate(ProductionVO vo) throws Exception {
			
			sqlSession.update(NAMESPACE+".btUpdate", vo); 
			sqlSession.update(NAMESPACE+".btMaUpdate", vo);
		}

		@Override
		public int btUpCheck(ProductionVO vo) {
			// TODO Auto-generated method stub
			int result = sqlSession.update(NAMESPACE+".todayDef", vo); 
			
			return result;
		}





	
	
}
