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
	public List<WarehouseVO> getWarehouseList() throws Exception {
	
		
		return wdao.getWarehouseList();
	}

	@Override
	public void warehouseInsert(WarehouseVO vo)  throws Exception{
	  
		wdao.warehouseInsert(vo);
	}
	

	@Override
	public WarehouseVO warehouseID(String whs_id) throws Exception{
	
		return wdao.warehouseID(whs_id);
	}

	@Override
	public Integer modifyWarehouse(WarehouseVO mvo) throws Exception{
	    
	     return  wdao.modifyWarehouse(mvo);
		
	}

	@Override
	public Integer removeWarehouse(String whs_id) throws Exception{
		
		return wdao.removeWarehouse(whs_id);
	}

	@Override
	public String getMaxNumber() throws Exception {
		
		return wdao.getMaxNumber();
	}

	@Override
	public WarehouseVO regisWhsId(String whs_id) throws Exception {
		
		return wdao.regisWhsId(whs_id);
	}

	@Override
	public String getMaxprNumber() throws Exception {
		
		return wdao.getMaxprNumber();
	}

	
}

