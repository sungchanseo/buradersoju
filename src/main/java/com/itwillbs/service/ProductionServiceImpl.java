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
	public List<ProductionVO> getWorkOrderList() {
		return pdao.getWorkOrderList();
	}
	
	@Override
	public List<ProductionVO> getQualityList() throws Exception{
		return pdao.getQualityList();
	}

	@Override
	public ProductionVO getQualityInfo(String qc_num) {
		// TODO Auto-generated method stub
		return pdao.getQualityInfo(qc_num);
	}

	@Override
	public void insertQuality(ProductionVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public ProductionVO getInsertSearch(String production_id) {
		// TODO Auto-generated method stub
		return pdao.getInsertSearch(production_id);
	}

	@Override
	public Integer updateQuality(ProductionVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qualityInsertDB(ProductionVO vo) {
		pdao.qualityInsertDB(vo);
		
	}

	@Override
	public List<ProductionVO> getBottleList() throws Exception {
		// TODO Auto-generated method stub
		return pdao.getBottleList();
	}



	// DAO 객체 주입
	@Autowired
	private ProductionDAO pdao;
	
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// DAO - 작업지시 저장(등록)
		pdao.insertWorkOrder(vo);
		
	}

	@Override
	public List<ProductionVO> getWorkOrderList() {
		return pdao.getWorkOrderList();
	}
	
	

	
}
