package com.itwillbs.persistence;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OutProductVO;



public interface OutProductDAO {
    
	// 1. 출고 리스트
 	public List<OutProductVO> getOutProductList() throws Exception;
 	
	// 2. 출고 상세보기
	public OutProductVO getOutProductInfo(String production_id) throws Exception;
	
	// 3-1. 출고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;
	
	// 3-2. 출고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;
 	
	// 3-3. 출고번호 등록하기
	public void registOpId(OutProductVO vo) throws Exception;
 	
 	
 	
 	
 	
 	
}
