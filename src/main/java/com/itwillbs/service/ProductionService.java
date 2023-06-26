package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface ProductionService {

	// 생산목록
	public List<ProductionVO> getProductionList() throws Exception;
	
//	// 페이징
//	public PagingVO setPageInfoForProduction(PagingVO pvo) throws Exception;
	
	
}

