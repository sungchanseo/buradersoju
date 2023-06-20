package com.itwillbs.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.persistence.InMaterialDAO;



@Service
public class InMaterialServiceImpl implements InMaterialService {


	// DAO 객체 주입
	@Inject
	private InMaterialDAO idao;

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 입고 리스트
	@Override
	public List<InMaterialVO> getInMaterialListAll() throws Exception{
		return idao.getInMaterialListAll();
	}
	
	
	// 2. 필터 리스트 (미입고 / 입고완료)
	@Override
	public List<InMaterialVO> getInMaterialListFilter(String in_progress) throws Exception{
		return null;
	}

	
	// 3. 입고 상세보기
	@Override
	public InMaterialVO getInMaterialInfo(String in_id) throws Exception{
		return null;
	}

	
	// 4-1. 입고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception {
		return idao.getMaxNumber();
	}
	
	// 4-2. 입고번호 최대날짜 (maxDate) 230620
	@Override
	public String getMaxDate() throws Exception {
		return idao.getMaxDate();
	}
	
	
	// 5. 입고번호 등록하기
	@Override
	public void registInId(InMaterialVO vo) throws Exception{
		idao.registInId(vo);
	}

	
	
	
	

	
	

}
