package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.ProductionDAO;
import com.itwillbs.persistence.QualityDAO;

@Service
public class QualityServiceImpl implements QualityService {
	
	// DAO 객체 접근
	@Inject
	private QualityDAO qdao;
	
	
	@Override
	public List<ProductionVO> getQualityList() throws Exception{
		return qdao.getQualityList();
	}

	@Override
	public ProductionVO getQualityInfo(String qc_num) {
		// TODO Auto-generated method stub
		return qdao.getQualityInfo(qc_num);
	}

	@Override
	public void insertQuality(ProductionVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public ProductionVO getInsertSearch(String production_id) {
		// TODO Auto-generated method stub
		return qdao.getInsertSearch(production_id);
	}

	@Override
	public Integer updateQuality(ProductionVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qualityInsertDB(ProductionVO vo) {
		qdao.qualityInsertDB(vo);
		
	}

	@Override
	public List<ProductionVO> getBottleList() throws Exception {
		// TODO Auto-generated method stub
		return qdao.getBottleList();
	}


	
	

	
}
