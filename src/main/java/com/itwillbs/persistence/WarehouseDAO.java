package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WarehouseVO;

@Repository
public interface WarehouseDAO {

	// 창고목록 보기
	public List<WarehouseVO> getWarehouseList(); 
}
