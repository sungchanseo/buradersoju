package com.itwillbs.service;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OutProductVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.OutProductDAO;



@Service
public class OutProductServiceImpl implements OutProductService{

	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(InMaterialServiceImpl.class);
	
	
	// 객체 주입
	@Inject
	private OutProductDAO odao;
	
	
	// PagingDAO 사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 출고 리스트
	@Override
	public List<OutProductVO> getOutProductList() throws Exception{
		return odao.getOutProductList();
	}

	// 2. 출고 상세보기
	@Override
	public OutProductVO getOutProductInfo(String production_id) throws Exception{
		return odao.getOutProductInfo(production_id);
	}

	// 3-1. 출고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception {
		return odao.getMaxNumber();
	}
	
	// 3-2. 출고번호 최대날짜 (maxDate) 230620
	@Override
	public String getMaxDate() throws Exception {
		return odao.getMaxDate();
	}
	
	// 3-3. 출고번호 등록하기
	@Override
	public void registOpId(OutProductVO vo) throws Exception{
		odao.registOpId(vo);
	}
	
	
	
	
	
	
	
	
	
}
