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
	
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// DAO - 작업지시 저장(등록)
		wdao.insertWorkOrder(vo);
	}

	@Override
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception{
		return wdao.getWoInsertSearch(cont_id);
	}
	
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception{
		return wdao.getWorkOrderList();
	}

	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception{
		return wdao.detailWorkOrder(production_id);
	}
	@Override
	public List<ProductionVO> getMaterialList(String product_id) throws Exception {
		// TODO Auto-generated method stub
		return wdao.getMaterialList(product_id);
	}

	

	
}
