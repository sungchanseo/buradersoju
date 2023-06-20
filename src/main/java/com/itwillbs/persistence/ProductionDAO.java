package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository

public interface ProductionDAO {
	
	// 작업지시 등록
	public void insertWorkOrder(ProductionVO vo) throws Exception;

	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList() throws Exception;
	
	// 작업지시 상세
	public ProductionVO detailWorkOrder(String production_id) throws Exception;
}
