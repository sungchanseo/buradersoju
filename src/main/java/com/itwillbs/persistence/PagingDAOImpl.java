package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

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

	/////////////////////////////////CustomerVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectCustomerVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectCustomerVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectCustomerVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchObjectCustomerVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectCustomerVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListFilterObjectCustomerVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectCustomerVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectCustomerVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////ContractVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectContractVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectContractVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectContractVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectContractVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectContractVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectContractVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectContractVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectContractVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////EmployeeVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectEmployeeVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectEmployeeVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectEmployeeVO(PagingVO pvo) throws Exception {
	logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectEmployeeVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectEmployeeVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectEmployeeVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectEmployeeVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectEmployeeVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	
	
	/////////////////////////////////NoticeVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectNoticeVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectNoticeVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectNoticeVO(PagingVO pvo) throws Exception {
		logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
		return sqlSession.selectList(NAMESPACE+".getListSearchObjectNoticeVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectNoticeVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListFilterObjectNoticeVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectNoticeVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjecNoticeVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////MaterialVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectMaterialVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectMaterialVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("****************PagingDAO : getListSearchObject()메소드 호출!");
		return sqlSession.selectList(NAMESPACE+".getListSearchObjectMaterialVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectMaterialVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListFilterObjectMaterialVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectMaterialVO(PagingVO pvo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectMaterialVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////OrderVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectOrderVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectOrderVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectOrderVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectOrderVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectOrderVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectOrderVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectOrderVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectOrderVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////OutProductVO.java////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectOutProductVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectOutProductVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectOutProductVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectOutProductVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectOutProductVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////ProductionVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectProductionVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectProductionVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectProductionVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectProductionVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectProductionVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectProductionVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectProductionVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectProductionVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////WarehouseVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectWarehouseVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListPageSizeObjectWarehouseVO", pvo);
	}
	//검색어 있을 때 목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectWarehouseVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchObjectWarehouseVO", pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectWarehouseVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListFilterObjectWarehouseVO",pvo);
	}
	//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectWarehouseVO(PagingVO pvo) throws Exception {
	return sqlSession.selectList(NAMESPACE+".getListSearchFilterObjectWarehouseVO", pvo);
	}
	///////////////////////////////////////////////////////////////////////////////

	
}
