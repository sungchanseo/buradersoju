package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository

public interface ProductionDAO {
	
	// 작업지시 등록
	public void insertWorkOrder(ProductionVO vo) throws Exception;

	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList();
	
	// 품질관리 - 목록 가져오기
	public List<ProductionVO> getQualityList() throws Exception;
	
	// 품질관리 - 검수 상세보기
	public ProductionVO getQualityInfo(String qc_num);
	
	// 품질관리 - 검수 등록
	public void insertQuality(ProductionVO vo);
	
	// 검수등록 - 조회
	public ProductionVO getInsertSearch(String production_id);
	
	// 품질관리 - 검수 수정
	public Integer updateQuality(ProductionVO pvo);
	
	// 검수등록 - 등록
	public void qualityInsertDB(ProductionVO vo);
	
	// 공병 관리
	public List<ProductionVO> getBottleList() throws Exception;
	
	
}
