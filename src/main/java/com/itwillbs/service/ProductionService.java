package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.ProductionVO;

public interface ProductionService {
	

	// 작업지시 등록
	public void insertWorkOrder(ProductionVO vo) throws Exception;
	
	// 작업지시 등록-수주번호 조회
	public ContractVO getWoInsertSearch(String cont_id) throws Exception;
	
	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList() throws Exception;
	
	// 작업지시 상세
	public ProductionVO detailWorkOrder(String production_id) throws Exception;

	
	
}

