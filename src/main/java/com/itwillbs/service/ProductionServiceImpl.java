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
	
	@Inject
	private PagingService pageService;
	
	//페이징처리 변수저장을 위한 서비스 구현
		@Override
		public PagingVO getListSearchObjectProductionVO(PagingVO pvo) throws Exception {
			
			//production 서비스에 필요한 변수 저장
//			pvo.setTable("pr_complete");
//			pvo.setId("production_id");
//			pvo.setPageSize(10);
//			pvo.setStartRow(1);
//			pvo.setStatus_name("production_status");
//			pvo.setStatus_value("1");
			
			pvo.setTable("production pd, product p, pr_complete pc, employee e");         
			pvo.setId("pc.production_id");         
			pvo.setPageSize(10);         
			pvo.setStartRow(1);         
			pvo.setStatus_name("pd.product_id = p.product_id and pd.production_emp = e.emp_id and pd.production_id = pc.production_id and pc.production_status");
			pvo.setStatus_value("포장");
			
			//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
			pvo = pageService.pagingAction(pvo);
			return pvo;
		}
	

	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		return pdao.getProductionList();
	}

	@Override
	public ProductionVO getInsertSearch(String production_id) throws Exception {
		return pdao.getInsertSearch(production_id);
	}

	@Override
	public void insertStage1(ProductionVO vo) throws Exception {
		pdao.insertStage1(vo);
		
	}

	@Override
	public void insertStage2(ProductionVO vo) throws Exception {
		pdao.insertStage2(vo);
		
	}

	@Override
	public void insertStage3(ProductionVO vo) throws Exception {
		pdao.insertStage3(vo);
		
	}
	
	

	
}
