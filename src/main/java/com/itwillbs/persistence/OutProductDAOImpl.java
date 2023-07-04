package com.itwillbs.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OutProductVO;



@Repository
public class OutProductDAOImpl implements OutProductDAO {

	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(OutProductDAOImpl.class);
	
	
	// DB연결을 위한 xml 객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.itwillbs.mappers.outproductMapper";

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	
	
	// 1. 출고 리스트
	@Override
	public List<OutProductVO> getOutProductList() throws Exception{
		logger.debug("############### getOutproductList 호출");
		return sqlSession.selectList(NAMESPACE+".getOutProductList");
	}
	
	// 2. 출고 상세보기
	@Override
	public OutProductVO getOutProductInfo(String production_id) throws Exception{
		logger.debug("########## getOutProductInfo 호출");
		return sqlSession.selectOne(NAMESPACE+".getOutProductInfo", production_id);
	}

	// 3-1. 출고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception{
		logger.debug("########## getMaxNumber 호출");
		String maxNumber = sqlSession.selectOne(NAMESPACE + ".getMaxNumber"); // 230620001
		logger.debug("############## maxNumber : " + maxNumber);
		return maxNumber;
	}

	// 3-2. 출고번호 최대날짜(maxDate) 230620
	@Override
	public String getMaxDate() throws Exception{
		logger.debug("########## getMaxDate 호출");
		String maxDate = sqlSession.selectOne(NAMESPACE + ".getMaxDate"); // 230620
		logger.debug("############## maxDate : " + maxDate);
		return maxDate;
	}
	
	// 3-3. 출고번호 등록하기
	@Override
	public void registOpId(OutProductVO vo) throws Exception{
		logger.debug("########## resgistOpId 호출");
		logger.debug("########## " + vo.getOp_id());
		logger.debug("########## " + vo.getProduction_id());
		sqlSession.update(NAMESPACE + ".registOpId", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
