package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {
	
	// DAO 객체 접근
	@Inject
	private ProductionDAO pdao;
	
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// DAO - 작업지시 저장(등록)
		pdao.insertWorkOrder(vo);
		
	}

	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception{
		return pdao.getWorkOrderList();
	}

	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception{
		return pdao.detailWorkOrder(production_id);
	}


	

	
}
