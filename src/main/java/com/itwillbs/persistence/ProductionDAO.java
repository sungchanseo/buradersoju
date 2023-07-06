package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.ProductionVO;


@Repository

public interface ProductionDAO {
	
	// 생산목록
	public List<ProductionVO> getProductionList() throws Exception;
		
	// 작업지시번호 조회
	public ProductionVO getInsertSearch(String production_id) throws Exception;
	
	// 혼합 등록
	public void insertStage1(ProductionVO vo) throws Exception;
	
	// 주입 등록
	public void insertStage2(ProductionVO vo) throws Exception;
	
	// 포장 등록
	public void insertStage3(ProductionVO vo) throws Exception;
	
	
}
