package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PagingVO;

@Repository
public class PagingDAOImpl implements PagingDAO {

	//로그 출력을 위한 로거 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(PagingDAOImpl.class);
	
	//쿼리문 사용을 위한 sqlSession 객체 주입
	@Autowired
	private SqlSession sqlSession;
	
	//mapper식별을 위한 NAMESPACE 객체 생성
	private static final String NAMESPACE = "com.itwillbs.mappers.pagingMapper";
		
	//전체 목록 갯수를 가져오기 
	@Override
	public int getListAll(PagingVO pvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getListAll", pvo);
	}
	////////////////////////////////////////////////////////////////////
	
	//아무조건이 없을 때 전체 목록갯수 가져오기
	@Override
	public int getListPageSizeAll(PagingVO pvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getListPageSizeAll", pvo);
	}
	//검색어 있을 때 목록갯수 가져오기 	
	@Override
	public int getListSearchAll(PagingVO pvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getListSearchAll", pvo);
	}
	//필터있을때 전체 목록갯수 가져오기 	
	@Override
	public int getListFilterAll(PagingVO pvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getListFilterAll", pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public int getListSearchFilterAll(PagingVO pvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getListFilterAll", pvo);
	}
	////////////////////////////////////////////////////////////////////

	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObject(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListPageSizeObject", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObject(PagingVO pvo) throws Exception {
		logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
		return sqlSession.selectList(NAMESPACE+".getListSearchObject", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObject(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListFilterObject",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObject(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchFilterObject", pvo);
	}
	
}
