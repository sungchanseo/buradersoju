package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.InventoryDAO;

@Service
public class InventoryServiceImpl implements InventoryService {

	 @Inject
	 private InventoryDAO idao;
	 
	 @Inject
	 private PagingService pageService;
	 
	 

	private static final Logger logger = LoggerFactory.getLogger(InventoryServiceImpl.class);

	 
	 @Override
	public PagingVO getListSearchObjectMaterialVO(PagingVO pvo) throws Exception {
		
		 pvo.setTable("material");
		 pvo.setId("ma_id");
		 pvo.setPageSize(10);
		 pvo.setStartRow(1);
		 pvo.setStatus_name("status");
		 pvo.setStatus_value("1");
		 logger.debug("@@@@@@CustomerService : {}",pvo);
		 
		 //페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		 pvo = pageService.pagingAction(pvo);
		 logger.debug("@@@@@@CustomerService : {}",pvo);
			
		 return pvo;

	}

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
