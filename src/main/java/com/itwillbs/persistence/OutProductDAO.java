package com.itwillbs.persistence;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OutProductVO;



@Repository
public interface OutProductDAO {
    
	// 1. 출고 리스트
 	public List<OutProductVO> getOutProductList() throws Exception;
 	
 	
 	
 	
 	
 	
 	
 	
}
