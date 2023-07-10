package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface WorkOrderService {
	
	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList() throws Exception;
	
	// 작업지시 등록 페이지
	public void insertWorkOrder(ProductionVO vo) throws Exception;
	
	// 작업지시 등록-수주번호 조회
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception;
	
	// 작업지시 등록-자재재고 조회
	public List<ProductionVO> getMaterialList(String product_id) throws Exception;
	
	// 작업지시 등록-자재재고 업데이트
	public void maQtyUpdate(List<String> ma_nameList, List<String> ma_qtyList) throws Exception;
	
	// 작업지시 삭제-자재재고 업데이트
	public void maQtyUpdate2(List<String> ma_nameList, List<Float> ma_qtyList) throws Exception;
	
	// 작업지시 등록-해당 수주번호에 작업지시번호 저장
	public void contSetPrId(ProductionVO vo) throws Exception;
	
	// 작업지시 상세
	public ProductionVO detailWorkOrder(String production_id) throws Exception;
	
	// 페이징처리 변수저장을 위한 Service생성
	public PagingVO setPageInfoForWorkOrder(PagingVO pvo) throws Exception;
	
	// 페이징처리 변수저장을 위한 Service생성
	public PagingVO setPageInfoForWorkOrderP2(PagingVO pvo) throws Exception;
	
	// 페이징처리 변수저장을 위한 Service생성
	public PagingVO setPageInfoForWorkOrderP3(PagingVO pvo) throws Exception;
		
		// 페이징처리 변수저장을 위한 Service생성
	public PagingVO setPageInfoForWorkOrderP4(PagingVO pvo) throws Exception;

	// 검수등록시 조회용 페이징처리 Service생성
	public PagingVO setPageInfoForWorkOrder2(PagingVO pvo) throws Exception;

	// 수주검색 페이징처리 변수저장을 Service생성
	public PagingVO setPageInfoForContract(PagingVO pvo) throws Exception;
	
	// 작업지시 삭제 - 수주번호, 작업지시 삭제여부
	public void delWoCont(ProductionVO vo) throws Exception;

	
}

