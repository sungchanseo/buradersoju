package com.itwillbs.persistence;

import java.util.List;



import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WarehouseVO;

@Repository
public interface WarehouseDAO {

	// 창고목록 보기
	public List<WarehouseVO> getWarehouseList()throws Exception;
	
	// 창고등록 하기
	public void warehouseInsert(WarehouseVO vo)throws Exception;
    
	//창고 아이디 가져오기
	public WarehouseVO warehouseID(String whs_id)throws Exception;
	
	// 창고정보 수정하기
	public Integer modifyWarehouse(WarehouseVO mvo)throws Exception; 

	// 창고정보 삭제하기
	public Integer removeWarehouse(String whs_id)throws Exception;
	
	// 창고 품목코드 자동넘버링
	public String getMaxNumber() throws Exception;
	
	// 창고 품목코드 자동넘버링2
	public String getMaxprNumber() throws Exception;

    // 창고수정하기위한 아이디 가져오기
	public WarehouseVO regisWhsId(String whs_id) throws Exception;
	
	// 창고 정보 삭제하기
	public Integer deleteWhs(String whs_id) throws Exception;
	
}
