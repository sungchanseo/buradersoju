package com.itwillbs.service;
import java.util.List;
import com.itwillbs.domain.InMaterialVO;



public interface InMaterialService {
	
	// 1. 입고 리스트
	public List<InMaterialVO> getInMaterialListAll() throws Exception;
	
	// 2. 필터 리스트 (미입고 / 입고완료)
	public List<InMaterialVO> getInMaterialListFilter(String in_progress);
	
	// 3. 입고 상세보기
	public InMaterialVO getInMaterialInfo(String in_id);
	
}
