package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MaterialVO;

public interface InventoryService {

	// 재고목록 보기
	public List<MaterialVO> getInventoryList();
	
	// 재고목록 아이디 가져오기
	public MaterialVO modifyInventoryID(String ma_id);

	// 재고목록 수정하기
	public Integer modifyInventory(MaterialVO mvo);



}
