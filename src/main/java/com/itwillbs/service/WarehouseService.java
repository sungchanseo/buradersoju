package com.itwillbs.service;

import java.util.List;



import com.itwillbs.domain.WarehouseVO;


public interface WarehouseService {

	// 창고 리스트 보기
	public List<WarehouseVO> getWarehouseList();

    // 창고 등록 하기
	public void warehouseInsert(WarehouseVO vo);
}
