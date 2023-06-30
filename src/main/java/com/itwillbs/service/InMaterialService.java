package com.itwillbs.service;
import java.util.List;
import java.util.Map;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.PagingVO;



public interface InMaterialService {
	
	// 1. 입고 리스트
	public List<InMaterialVO> getInMaterialListAll() throws Exception;
	
	// 2. 입고 상세보기
	public InMaterialVO getInMaterialInfo(String order_id) throws Exception;
	
	// 3-1. 입고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;

	// 3-2. 입고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;

	// 3-3. 입고번호 등록하기
	public void registInId(InMaterialVO vo) throws Exception;
	
	// 4. 특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
	public void getAddMa(String order_id) throws Exception;
	
	// 5. 입고처리시 해당 자재 재고량 증가
	public void getplusMa(InMaterialVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 0. 페이징처리 세부로직
	public PagingVO pagingAction(PagingVO pvo) throws Exception;
	
	// 1. 개수 구하기
	// 입고 전체 목록 조회
	public int getListAll(PagingVO pvo)throws Exception ;
	
	// 페이징 목록갯수 가져오기
	public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
	// 검색어+페이징 전체목록 가져오기 	
	public int getListSearchAll(PagingVO pvo)throws Exception ;
	
	// 필터+페이징 목록갯수 가져오기 	
	public int getListFilterAll(PagingVO pvo)throws Exception ;
	
	// 검색어+필터+페이징 목록 갯수 가져오기 
	public int getListSearchFilterAll(PagingVO pvo) throws Exception;
	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체 가져오기
	public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception;
	
	// 검색어 있을 때 전체목록 객체 가져오기 	
	public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception;
	
	// 검색어+필터처리 전체 목록 객체 가져오기 	
	public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo)throws Exception;
	
	// 검색어와 필터 모두 있을 때 전체 목록 객체 가져오기 
	public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception;
	
	
}
