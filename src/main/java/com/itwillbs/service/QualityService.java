package com.itwillbs.service;

import java.util.List;


import com.itwillbs.domain.ProductionVO;

public interface QualityService {
	
	// 품질관리 - 목록 가져오기
	public List<ProductionVO> getQualityList() throws Exception;
	
	// 품질관리 - 검수 상세보기
	public ProductionVO getQualityInfo(String qc_num);
	
	// 품질관리 - 검수 등록 페이지
	public void insertQuality(ProductionVO vo);
	
	// 검수등록 - 조회
	public ProductionVO getInsertSearch(String production_id);
	
	// 4-1. 입고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;

	// 4-2. 입고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;
	
	// 검수등록 - 등록
	public void qualityInsertDB(ProductionVO vo);
	
	// 품질관리 - 검수 수정 (아직 비었음)
	public Integer updateQuality(ProductionVO pvo);
	
	// 공병 관리
	public List<ProductionVO> getBottleList() throws Exception;
	
	// 공병관리 - 수량 등록
	public void btInsert(ProductionVO vo);
	
	// 공병관리 - 불량 등록
	public void btUpdate(ProductionVO vo) throws Exception;
	
	
}

