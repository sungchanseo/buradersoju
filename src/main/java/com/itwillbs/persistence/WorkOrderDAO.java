package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;


@Repository

public interface WorkOrderDAO {
	
	
	// 작업지시 목록
	public List<ProductionVO> getWorkOrderList() throws Exception;
	
	// 작업지시 등록-수주번호 조회
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception;
	
	// 작업지시 등록-자재 재고 조회
	public List<ProductionVO> getMaterialList(String product_id) throws Exception;
	
	// 작업지시 등록 번호 자동 카운트
	public String getLastGeneratedNumber() throws Exception;
	
	// 작업지시 등록 DB저장
	public void insertWorkOrder(ProductionVO vo) throws Exception;
	
	// 작업지시 등록 - 해당 수주번호에 작업지시번호 저장
	public void contSetPrId(ProductionVO vo) throws Exception;
	
	// 작업지시 등록 - 창고의 자재 수 업데이트
	public void maQtyUpdate(List<String> ma_nameList, List<String> ma_qtyList) throws Exception;

	// 작업지시 상세
	public ProductionVO detailWorkOrder(String production_id) throws Exception;
	
	// 작업지시 삭제 - 자재db
	public void maQtyUpdate2(List<String> ma_nameList, List<Float> ma_qtyList) throws Exception;
	
	// 작업지시 삭제 - 수주번호, 작업지시 삭제여부
	public void delWoCont(ProductionVO vo) throws Exception;
	
	//
	
	
	
	
}
