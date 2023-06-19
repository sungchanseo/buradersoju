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

	@Override
	public void warehouseInsert(WarehouseVO vo) {
	  
		wdao.warehouseInsert(vo);
	}
	

	@Override
	public WarehouseVO warehouseID(String whs_id) {
	
		return wdao.warehouseID(whs_id);
	}

	@Override
	public Integer modifyWarehouse(WarehouseVO mvo) {
	    
	     return  wdao.modifyWarehouse(mvo);
		
	}

	@Override
	public Integer removeWarehouse(String whs_id) {
		
		return wdao.removeWarehouse(whs_id);
	}

}

