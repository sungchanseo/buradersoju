package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.PagingDAO;
import com.itwillbs.persistence.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {
	
	// DAO 객체 접근
	@Inject
	private ProductionDAO pdao;
	
//	@Inject
//	private PagingService pageService;
	
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// DAO - 작업지시 저장(등록)
		pdao.insertWorkOrder(vo);
		
	}

	@Override
	public ContractVO getWoInsertSearch(String cont_id) throws Exception{
		return pdao.getWoInsertSearch(cont_id);
	}
	
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception{
		return pdao.getWorkOrderList();
	}

	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception{
		return pdao.detailWorkOrder(production_id);
	}

	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		return pdao.getProductionList();
	}

	
//	@Override
//	public PagingVO setPageInfoForProduction(PagingVO pvo) throws Exception{
//		
//		/*
//		 * CustomerService
//		 * - 페이징처리를 위해서는 도메인별로 다른 변수를 저장해야 한다. 
//		 * => 해당 변수를 CustomerService에서 저장!
//		 * - 페이징처리 계산은 공통이므로 PagingService에서 처리한다.
//		 * => PagingSeriv의 메소드를 호출! 
//		 */
//		
//		//customer서비스에 필요한 변수를 저장. 
//		pvo.setTable("production");
//		pvo.setId("production_id");
//		pvo.setPageSize(5);
//		pvo.setStartRow(1);
////		pvo.setStatus_name("cust_status");
////		pvo.setStatus_value("0");
//		
//
//		
//		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
//		pvo = pageService.pagingAction(pvo);
////		logger.debug("@@@@@@CustomerService : {}",pvo);
//		return pvo;
//	}

	

	
}
