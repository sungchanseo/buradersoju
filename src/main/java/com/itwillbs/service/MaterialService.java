package com.itwillbs.service;
import java.util.List;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;



public interface MaterialService {
	
	// 0. 페이징처리 변수저장을 위한 Service 생성
	public PagingVO setPageInfoForMaterial(PagingVO pvo) throws Exception;
	
	// 1. 자재 목록 조회
	public List<MaterialVO> getMaterialList() throws Exception;
	
	// 2. 자재 정보 조회
	public MaterialVO getMaterialInfo(String ma_id) throws Exception;
	
	// 3. 자재 검색
	public List<MaterialVO> getSearchList(MaterialVO vo) throws Exception;
	
	// 4-1. 자재 품목코드 자동넘버링
	public String getMaxNumber() throws Exception;
	
	// 4-2. 자재 등록
	public void insertMaterial(MaterialVO vo) throws Exception;
	
	// 5. 자재 수정
	public Integer modifyMaterial(MaterialVO mvo) throws Exception;
	
	// 6. 자재 삭제
	public Integer deleteMaterial(String ma_id) throws Exception;

}
