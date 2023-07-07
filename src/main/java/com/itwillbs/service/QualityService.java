package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface QualityService {
	
	// 품질관리 - 목록 가져오기
	public List<ProductionVO> getQualityList() throws Exception;
	
	//페이징처리 변수저장을 위한 serive생성
	public PagingVO setPageInfoForQuality(PagingVO pvo) throws Exception;
	
	// 품질관리 - 검수 상세보기
	public ProductionVO getQualityInfo(String qc_num);
	
	// 품질관리 - 검수 등록 페이지
	public void insertQuality(ProductionVO vo);
	
	// 검수등록 - 조회
	public ProductionVO getInsertSearch(String production_id);
	
	// 검수등록 - 등록
	public void qualityInsertDB(ProductionVO vo, List<String> def_codeList, List<String> def_qtyList) throws Exception;
	
	// 품질관리 - 검수 수정 (시간남으면 넣고 삭제로 하기로함)
	public Integer updateQuality(ProductionVO pvo);
	
	// 공병 관리
	public List<ProductionVO> getBottleList() throws Exception;
	
	// 공병관리 - 수량 등록
	public void btInsert(ProductionVO vo) throws Exception;
	
	// 공병관리 - 불량 등록
	public void btUpdate(ProductionVO vo) throws Exception;
	
	
}

