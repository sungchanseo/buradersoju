package com.itwillbs.service;
import java.util.List;
import com.itwillbs.domain.InMaterialVO;



public interface InMaterialService {
	
	// 1. 입고 리스트
	public List<InMaterialVO> getInMaterialListAll() throws Exception;
	
	// 2. 필터 리스트 (미입고 / 입고완료)
	public List<InMaterialVO> getInMaterialListFilter(String in_progress) throws Exception;
	
	// 3. 입고 상세보기
	public InMaterialVO getInMaterialInfo(String order_id) throws Exception;
	
	// 4-1. 입고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;

	// 4-2. 입고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;

	// 5. 입고번호 등록하기
	public void registInId(InMaterialVO vo) throws Exception;
	
	// 6. 특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
	public int getMaCnt(String order_id) throws Exception;
	
	
}
