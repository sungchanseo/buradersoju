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
	
	
	
	// 1. 자재 목록
	@Override
	public List<MaterialVO> getMaterialList() {
		logger.debug("%%%%% 서비스 %%%%% getMaterialList_호출");
		return mdao.getMaterialList();
	}

	// 2. 자재 등록
	@Override
	public void insertMaterial(MaterialVO vo) {
		logger.debug("%%%%% 서비스 %%%%% insertMaterial_호출");
		mdao.insertMaterial(vo);
	}
	
	// 3. 자재 수정
	@Override
	public Integer modifyMaterial(MaterialVO mvo) {
		
		return null;
	}

	// 4. 자재 삭제
	@Override
	public Integer removeMaterial(String ma_id) {
		
		return null;
	}

}
