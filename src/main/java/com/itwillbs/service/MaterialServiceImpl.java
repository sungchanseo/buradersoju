package com.itwillbs.service;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.persistence.MaterialDAO;



@Service
public class MaterialServiceImpl implements MaterialService {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialServiceImpl.class);
	
	// DAO 객체 주입
	@Inject
	private MaterialDAO mdao;
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 자재 목록 조회
	@Override
	public List<MaterialVO> getMaterialList() throws Exception {
		return mdao.getMaterialList();
	}
	
	
	// 2. 자재 정보 조회
	@Override
	public MaterialVO getMaterialInfo(String ma_id) throws Exception{
		return mdao.getMaterialInfo(ma_id);
	}

	
	// 3-1. 자재 품목코드 자동넘버링
	@Override
	public String getMaxNumber() throws Exception{
		return mdao.getMaxNumber();
	}
	
	// 3-2. 자재 등록
	@Override
	public void insertMaterial(MaterialVO vo) throws Exception{
		mdao.insertMaterial(vo);
	}
	
	
	// 4. 자재 수정
	@Override
	public Integer modifyMaterial(MaterialVO mvo) throws Exception{
		return mdao.modifyMaterial(mvo);
	}

	
	// 5. 자재 삭제
	@Override
	public Integer deleteMaterial(String ma_id) throws Exception{
		return mdao.deleteMaterial(ma_id);
	}





	
	
	
	
	
	
	
	
	
	

}
