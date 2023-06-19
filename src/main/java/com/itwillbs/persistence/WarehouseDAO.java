package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WarehouseVO;

@Repository
public interface WarehouseDAO {

	// 창고목록 보기
	public List<WarehouseVO> getWarehouseList();
	
	// 창고등록 하기
	public void warehouseInsert(WarehouseVO vo);
    
	//창고 아이디 가져오기
	public WarehouseVO warehouseID(String whs_id);
	
	// 창고정보 수정하기
	public Integer modifyWarehouse(WarehouseVO mvo); 
   
	// 창고정보 삭제하기
	public Integer removeWarehouse(String whs_id);
}
