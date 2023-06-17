package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProductionVO;

public interface ProductionService {

	// 작업지시 등록
	public void insertWorkOrder(ProductionVO vo) throws Exception;
	
	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList();
	
	}
