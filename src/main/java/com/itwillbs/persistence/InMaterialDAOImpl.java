package com.itwillbs.persistence;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;



@Repository
public class InMaterialDAOImpl implements InMaterialDAO {
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(InMaterialDAOImpl.class);
	
	
	// DB연결을 위한 xml 객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.itwillbs.mappers.inMaterialMapper";


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 입고 리스트
	@Override
	public List<InMaterialVO> getInMaterialListAll() throws Exception{
		logger.debug("########## getInMaterialListAll_호출");
		return sqlSession.selectList(NAMESPACE+".getInMaterialListAll");
	}

	
	// 2. 필터 리스트 (미입고 / 입고완료)
	@Override
	public List<InMaterialVO> getInMaterialListFilter(String in_progress) {
		return null;
	}

	
	// 3. 입고 상세보기
	@Override
	public InMaterialVO getInMaterialInfo(String in_id) {
		return null;
	}
	

	
	



	
	

	
	
}
