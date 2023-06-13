package com.itwillbs.persistence;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import com.itwillbs.domain.MaterialVO;



@Repository
public class MaterialDAOImpl implements MaterialDAO {
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialDAOImpl.class);
	
	
	// DB연결을 위한 xml 객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.itwillbs.mappers.materialMapper";
	

	// 메서드 정의
	// 1. 자재 목록
	@Override
	public List<MaterialVO> getMaterialList() {
		logger.debug("##### DAO ##### getMaterialList_호출");
		return sqlSession.selectList(NAMESPACE+".getMaterialList");
	}
	
	// 2. 자재 등록
	@Override
	public void insertMaterial(MaterialVO vo) {
		logger.debug("##### DAO ##### insertMaterial_호출");
		sqlSession.insert(NAMESPACE + ".insertMaterial", vo);
		logger.debug("##### DAO ##### 자재 등록 완료");
	}
	
	// 3. 자재 수정
	@Override
	public Integer modifyMaterial(MaterialVO mvo) {

		return null;
	}
	
	// 4. 자제 삭제
	@Override
	public Integer removeMaterial(String ma_id) {

		return null;
	}

	
	
}
