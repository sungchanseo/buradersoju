package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository

public interface QualityDAO {
	
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
	
	//수주등록 번호 자동 카운트
	public String getLastGeneratedNumber() throws Exception;
	
	// 검수등록 - 등록
	public void qualityInsertDB(ProductionVO vo, List<String> def_codeList, List<String> def_qtyList);
	
	// 공병 관리 - 목록 가져오기
	public List<ProductionVO> getBottleList() throws Exception;
	
	// 공병관리 - 수량 등록
	public void btInsert(ProductionVO vo) throws Exception;
	
	// 공병관리 - 불량 등록
	public void btUpdate(ProductionVO vo) throws Exception;
	
//	// 공병관리 - 등록했었는지 체크
//	public int btUpCheck(ProductionVO vo);
	
}
