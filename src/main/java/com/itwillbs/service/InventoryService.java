package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MaterialVO;

public interface InventoryService {

	// 재고목록 보기
	public List<MaterialVO> getInventoryList();
	
	// 재고목록 수정하기
	public Integer modifyInventory(MaterialVO mvo);
}
