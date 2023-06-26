package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.persistence.InventoryDAO;

@Service
public class InventoryServiceImpl implements InventoryService {

	 @Inject
	 private InventoryDAO idao;
	 

	 
	 @Override
	public List<MaterialVO> getInventoryList() {
		return idao.getInventoryList();
	}

	public MaterialVO modifyInventoryID(String ma_id) {
		
		return idao.modifyInventoryID(ma_id);
	}
	
	@Override
	public Integer modifyInventory(MaterialVO mvo) {
		
		return idao.modifyInventory(mvo);
		
	}
	
	@Override
	public void insertInventory(MaterialVO vo) {

		 idao.insertInventory(vo);
	}


	
}
