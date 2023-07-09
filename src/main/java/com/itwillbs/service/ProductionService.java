package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface ProductionService {

	// 생산목록
	public List<ProductionVO> getProductionList() throws Exception;
		
	// 생산등록 (작업지시번호 조회)
	public ProductionVO getInsertSearch(String production_id) throws Exception;
	
	// 생산등록 (혼합등록)
	public void insertStage1(ProductionVO vo) throws Exception;
	
	// 생산등록 (주입등록)
	public void insertStage2(ProductionVO vo) throws Exception;
	
	// 생산등록 (포장등록)
	public void insertStage3(ProductionVO vo) throws Exception;
	
	
	
	// 검색 기능과 관련된 메서드
	// 아무 조건 없을 때 전체 목록 조회
	public List<ProductionVO> getListObjectProductionVO() throws Exception;
	
	// 검색어가 있을 때 전체 목록 조회
	public List<ProductionVO> getListSearchObjectProductionVO(Map<String, Object> paramMap) throws Exception;

	

	// 혼합 수정
	public Integer modifyStage1(ProductionVO vo) throws Exception;
	
	// 주입 수정
	public Integer modifyStage2(ProductionVO vo) throws Exception;
	
	// 포장 수정
	public Integer modifyStage3(ProductionVO vo) throws Exception;
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 페이징처리 세부로직
	// public PagingVO pagingAction(PagingVO pvo) throws Exception;
	
	// 1. 개수 구하기
	// 입고 전체 목록 조회
	// public int getListAll(PagingVO pvo)throws Exception ;
	
	// 페이징 목록 개수
	// public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
	// 검색어 + 페이징 전체 목록	
	// public int getListSearchAll(PagingVO pvo)throws Exception ;
	
	// 필터 + 페이징 목록 개수	
	// public int getListFilterAll(PagingVO pvo)throws Exception ;
	
	// 검색어 + 필터 + 페이징 목록 개수
	// public int getListSearchFilterAll(PagingVO pvo) throws Exception;
	
	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체
	// public List<Object> getListPageSizeObjectProductionVO(PagingVO pvo) throws Exception;
	
	// 검색어 있을 때 전체 목록 객체
	// public List<Object> getListSearchObjectProductionVO(PagingVO pvo) throws Exception;
	
	// 검색어 + 필터처리 전체 목록 객체
	// public List<Object> getListFilterObjectProductionVO(PagingVO pvo)throws Exception;
	
	// 검색어와 필터 모두 있을 때 전체 목록 객체
	// public List<Object> getListSearchFilterObjectProductionVO(PagingVO pvo) throws Exception;
	
}

