package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.ProductionVO;


@Repository

public interface ProductionDAO {
	
	// 생산목록
	public List<ProductionVO> getProductionList() throws Exception;
	
	
}
