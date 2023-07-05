package com.itwillbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface WorkOrderService {
	
	// 작업지시 등록
	public void insertWorkOrder(ProductionVO vo) throws Exception;
	
	// 작업지시 등록-수주번호 조회
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception;
	
	// 작업지시 등록-자재재고 조회
	public List<ProductionVO> getMaterialList(String product_id) throws Exception;
	
	// 작업지시 등록-자재재고 업데이트
	public void maQtyUpdate(List<String> ma_nameList, List<String> ma_qtyList) throws Exception;
	
	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList() throws Exception;
	
	// 작업지시 상세
	public ProductionVO detailWorkOrder(String production_id) throws Exception;
	
	//페이징처리 변수저장을 위한 serive생성
	public PagingVO setPageInfoForWorkOrder(PagingVO pvo) throws Exception;

//	public void maQtyUpdate(String[] ma_nameList, String[] ma_qtyList);

	
}

