package com.itwillbs.service;

import java.util.List;



import com.itwillbs.domain.WarehouseVO;


public interface WarehouseService {

	// 창고 리스트 보기
	public List<WarehouseVO> getWarehouseList();

    // 창고 등록 하기
	public void warehouseInsert(WarehouseVO vo);
	
	//창고아이디 가져오기
	public WarehouseVO warehouseID(String whs_id);
	
    // 창고정보 수정하기
	public Integer modifyWarehouse(WarehouseVO mvo);
    
	// 창고정보 삭제하기
	public Integer removeWarehouse(String whs_id);
	
	
}
