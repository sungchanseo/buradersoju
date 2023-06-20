package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
@Service
public interface PagingService {
	
	//페이징처리 세부로직
	public PagingVO pagingAction(PagingVO pvo) throws Exception;

	//////////////////////////////////////////////////////////////////////////
	
	//거래처 전체 목록 조회
	public int getListAll(PagingVO pvo)throws Exception ;

	//페이징 목록갯수 가져오기
	public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
	//검색어+페이징 전체목록 가져오기 	
	public int getListSearchAll(PagingVO pvo)throws Exception ;
	
	//필터+페이징 목록갯수 가져오기 	
	public int getListFilterAll(PagingVO pvo)throws Exception ;
	
	//검색어+필터+페이징 목록 갯수 가져오기 
	public int getListSearchFilterAll(PagingVO pvo) throws Exception;
	
	/////////////////////////////////////////////////////////////////////////
	
	//아무조건이 없을 때 전체 목록 객체 가져오기
	public List<Object> getListPageSizeObject(PagingVO pvo) throws Exception;
	
	//검색어 있을 때 전체목록 객체 가져오기 	
	public List<Object> getListSearchObject(PagingVO pvo) throws Exception;
	
	//검색어+필터처리 전체 목록 객체 가져오기 	
	public List<Object> getListFilterObject(PagingVO pvo)throws Exception;

	//검색어와 필터 모두 있을 때 전체 목록 객체 가져오기 
	public List<Object> getListSearchFilterObject(PagingVO pvo) throws Exception;
	
}
