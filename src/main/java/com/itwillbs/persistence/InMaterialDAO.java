package com.itwillbs.persistence;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.itwillbs.domain.InMaterialVO;



@Repository
public interface InMaterialDAO {
	
	// 1. 입고 리스트
	public List<InMaterialVO> getInMaterialListAll() throws Exception;
	
	// 2. 입고 상세보기
	public InMaterialVO getInMaterialInfo(String order_id) throws Exception;
	
	// 3-1. 입고번호 최대값 (maxNumber) 230620004
	public String getMaxNumber() throws Exception;
	
	// 3-2. 입고번호 최대날짜 (maxDate) 230620
	public String getMaxDate() throws Exception;
	
	// 3-3. 입고번호 등록하기
	public void registInId(InMaterialVO vo) throws Exception;
	
	// 4. 특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
	public void getAddMa(String order_id) throws Exception;
	
	// 5. 입고처리시 해당 자재 재고량 증가
	public void getPlusMa(InMaterialVO vo) throws Exception;
	
	
}
