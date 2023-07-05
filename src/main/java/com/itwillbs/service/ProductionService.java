package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface ProductionService {

	// 생산목록
	public List<ProductionVO> getProductionList() throws Exception;
	
	// 생산목록 페이징 처리
	public PagingVO getListSearchObjectProductionVO(PagingVO pvo) throws Exception;
		
	// 생산등록 (작업지시번호 조회)
	public ProductionVO getInsertSearch(String production_id) throws Exception;
	
	// 생산등록 (혼합등록)
	public void insertStage1(ProductionVO vo) throws Exception;
	
	// 생산등록 (주입등록)
	public void insertStage2(ProductionVO vo) throws Exception;
	
	// 생산등록 (포장등록)
	public void insertStage3(ProductionVO vo) throws Exception;
	
	
}

