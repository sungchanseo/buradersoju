package com.itwillbs.persistence;
import java.util.List;
import java.util.Map;

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

	// 2. 입고 상세보기
	@Override
	public InMaterialVO getInMaterialInfo(String order_id) throws Exception{
		logger.debug("########## getInMaterialInfo 호출");
		return sqlSession.selectOne(NAMESPACE+".getInMaterialInfo", order_id);
	}

	// 3-1. 입고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception{
		logger.debug("########## getMaxNumber 호출");
		String maxNumber = sqlSession.selectOne(NAMESPACE + ".getMaxNumber"); // 230620001
		logger.debug("############## maxNumber : " + maxNumber);
		return maxNumber;
	}

	// 3-2. 입고번호 최대날짜(maxDate) 230620
	@Override
	public String getMaxDate() throws Exception{
		logger.debug("########## getMaxDate 호출");
		String maxDate = sqlSession.selectOne(NAMESPACE + ".getMaxDate"); // 230620
		logger.debug("############## maxDate : " + maxDate);
		return maxDate;
	}
	
	// 3-3. 입고번호 등록하기
	@Override
	public void registInId(InMaterialVO vo) throws Exception{
		logger.debug("########## resgistInId 호출");
		logger.debug("########## " + vo.getIn_id());
		logger.debug("########## " + vo.getOrder_id());
		sqlSession.update(NAMESPACE + ".registInId", vo);
	}

	// 4. 특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
	@Override
	public void getAddMa(String order_id) throws Exception {
		logger.debug("########## getAddMa 호출");
		sqlSession.selectOne(NAMESPACE + ".addMa", order_id);
	}

	// 5. ma_qty 값 구하기
	@Override
	public List<InMaterialVO> getMaQty(String ma_id) throws Exception {
		logger.debug("########## getMaQty 호출");
		return sqlSession.selectList(NAMESPACE+".maQty", ma_id);
	}
	
	

	
	


	
}
