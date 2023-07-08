package com.itwillbs.service;
import java.util.List;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OutProductVO;
import com.itwillbs.domain.PagingVO;



@Service
public interface OutProductService {

	// 1. 출고 리스트
	public List<OutProductVO> getOutProductList() throws Exception;
	
	// 2. 출고 상세보기
	public OutProductVO getOutProductInfo(String cont_id) throws Exception;
	
	// 3-1. 출고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;

	// 3-2. 출고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;

	// 3-3. 출고번호 등록하기
	public void registOpId(OutProductVO vo) throws Exception;
	
	// 4. 상품에 필요한 소요량과 현재고량 가져오기
	public List<OutProductVO> getInventory(String product_id) throws Exception;
	
	// 5. tmp_qty 생성
	public void getTmpQty(String cont_id) throws Exception;
	
	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 페이징처리 세부로직
	public PagingVO pagingAction(PagingVO pvo) throws Exception;
	
	// 1. 개수 구하기
	// 입고 전체 목록 조회
	public int getListAll(PagingVO pvo)throws Exception ;
	
	// 페이징 목록 개수
	public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
	// 검색어 + 페이징 전체 목록	
	public int getListSearchAll(PagingVO pvo)throws Exception ;
	
	// 필터 + 페이징 목록 개수	
	public int getListFilterAll(PagingVO pvo)throws Exception ;
	
	// 검색어 + 필터 + 페이징 목록 개수
	public int getListSearchFilterAll(PagingVO pvo) throws Exception;
	
	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체
	public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception;
	
	// 검색어 있을 때 전체 목록 객체
	public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception;
	
	// 검색어 + 필터처리 전체 목록 객체
	public List<Object> getListFilterObjectOutProductVO(PagingVO pvo)throws Exception;
	
	// 검색어와 필터 모두 있을 때 전체 목록 객체
	public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception;
	
}
