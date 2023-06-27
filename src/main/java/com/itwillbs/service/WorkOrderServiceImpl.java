package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.WorkOrderDAO;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {
	
	// DAO 객체 접근
	@Inject
	private WorkOrderDAO wdao;
	
	// 작업지시 목록
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception{
		return wdao.getWorkOrderList();
	}

	// 작업지시 등록(수주번호 조회)
	@Override
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception{
		return wdao.getWoInsertSearch(cont_id);
	}
	
	// 작업지시 등록(자재 재고 조회)
	@Override
	public List<ProductionVO> getMaterialList(String product_id) throws Exception {
		// TODO Auto-generated method stub
		return wdao.getMaterialList(product_id);
	}
	
	// 작업지시 등록(DB저장)
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		wdao.insertWorkOrder(vo);
	}
	
	// 작업지시 상세
	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception{
		return wdao.detailWorkOrder(production_id);
	}

	

	
}
