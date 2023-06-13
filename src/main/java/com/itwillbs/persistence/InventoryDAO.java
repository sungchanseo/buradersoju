package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MaterialVO;

@Repository
public interface InventoryDAO {

	public List<MaterialVO> getInventoryList();
	
}
