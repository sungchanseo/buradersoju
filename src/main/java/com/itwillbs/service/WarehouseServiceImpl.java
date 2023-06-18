package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.persistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService  {

	@Inject
	private WarehouseDAO wdao;
	
	@Override
	public List<WarehouseVO> getWarehouseList() {
	
		
		return wdao.getWarehouseList();
	}
	
}

