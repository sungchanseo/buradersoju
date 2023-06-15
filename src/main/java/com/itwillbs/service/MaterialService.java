package com.itwillbs.service;
import java.util.List;
import com.itwillbs.domain.MaterialVO;



public interface MaterialService {
	
	// 자재 목록 조회
	public List<MaterialVO> getMaterialList();
	
	// 자재 정보 조회
	public MaterialVO getMaterialInfo(String ma_id);
	
	// 자재 등록
	public void insertMaterial(MaterialVO vo);
	
	// 자재 수정
	public Integer modifyMaterial(MaterialVO mvo);
	
	// 자재 삭제
	public Integer deleteMaterial(MaterialVO dvo);

}
