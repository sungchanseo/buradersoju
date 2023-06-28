package com.itwillbs.service;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.persistence.InMaterialDAO;



@Service
public class InMaterialServiceImpl implements InMaterialService {


	// DAO 객체 주입
	@Inject
	private InMaterialDAO idao;

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 입고 리스트
	@Override
	public List<InMaterialVO> getInMaterialListAll() throws Exception{
		return idao.getInMaterialListAll();
	}
	
	// 2. 입고 상세보기
	@Override
	public InMaterialVO getInMaterialInfo(String order_id) throws Exception{
		return idao.getInMaterialInfo(order_id);
	}

	// 3-1. 입고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception {
		return idao.getMaxNumber();
	}
	
	// 3-2. 입고번호 최대날짜 (maxDate) 230620
	@Override
	public String getMaxDate() throws Exception {
		return idao.getMaxDate();
	}
	
	// 3-3. 입고번호 등록하기
	@Override
	public void registInId(InMaterialVO vo) throws Exception{
		idao.registInId(vo);
	}

	// 4. 특정 order_id의 기존 재고량 + 발주량 (== 총 재고량)
	@Override
	public void getAddMa(String order_id) throws Exception {
		idao.getAddMa(order_id);
	}

	// 5. ma_qty 값 구하기
	@Override
	public List<InMaterialVO> getMaQty(String ma_id) throws Exception {
		return idao.getMaQty(ma_id);
	}
	
	

	
	
	
	

	
	

}
