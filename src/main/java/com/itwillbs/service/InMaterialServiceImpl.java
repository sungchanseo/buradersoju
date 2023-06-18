package com.itwillbs.service;
import java.util.List;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	public List<InMaterialVO> getInMaterialListFilter(String in_progress) {
		return null;
	}

	
	// 3. 입고 상세보기
	@Override
	public InMaterialVO getInMaterialInfo(String in_id) {
		return null;
	}

	
	// 4. 입고번호 등록하기
	@Override
	public void registInId(InMaterialVO vo) {
		idao.registInId(vo);
	}
	
	
	


	
	

}
