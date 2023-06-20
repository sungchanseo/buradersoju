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

	
	// 4. 입고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() {
		String maxNumber = sqlSession.selectOne(NAMESPACE + ".getMaxNumber"); // 230620001
		logger.debug("############## maxNumber : " + maxNumber);
		return maxNumber;
	}

	
	// 5. 입고번호 최대날짜(maxDate) 230620
	@Override
	public String getMaxDate() {
		String maxDate = sqlSession.selectOne(NAMESPACE + ".getMaxDate"); // 230620
		logger.debug("############## maxDate : " + maxDate);
		return maxDate;
	}
	
	
	// 6. 입고번호 등록하기
	@Override
	public void registInId(InMaterialVO vo) {
		logger.debug("########## resgistInId 호출");
		logger.debug("########## " + vo.getIn_id());
		logger.debug("########## " + vo.getOrder_id());
		sqlSession.update(NAMESPACE + ".registInId", vo);
	}

	
	
	

	

	
}
