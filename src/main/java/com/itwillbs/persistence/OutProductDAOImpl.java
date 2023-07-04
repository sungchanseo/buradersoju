package com.itwillbs.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OutProductVO;
import com.itwillbs.domain.PagingVO;



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
	public OutProductVO getOutProductInfo(String cont_id) throws Exception{
		logger.debug("########## getOutProductInfo 호출");
		return sqlSession.selectOne(NAMESPACE+".getOutProductInfo", cont_id);
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
	public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectOutProductVO", pvo);
	}
	
	// 검색어 있을 때 목록 객체	
	@Override
	public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception {
	logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
		return sqlSession.selectList(NAMESPACE+".getListSearchObjectOutProductVO", pvo);
	}
	
	// 필터있을 때 전체 목록 객체
	@Override
	public List<Object> getListFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListFilterObjecOutProductVO",pvo);
	}
	
	// 검색어와 필터 모두 있을 때 전체 목록 개수
	@Override
	public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectOutProductVO", pvo);
	}

}
