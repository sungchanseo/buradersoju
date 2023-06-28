package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.PagingDAO;
import com.itwillbs.persistence.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {
	
	// DAO 객체 접근
	@Inject
	private ProductionDAO pdao;	

	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		return pdao.getProductionList();
	}

	@Override
	public void insertProducion(ProductionVO vo) throws Exception {
		pdao.insertProducion(vo);
		
	}

	@Override
	public ProductionVO getInsertSearch(String production_id) throws Exception {
		return pdao.getInsertSearch(production_id);
	}

	

	
}
