package com.itwillbs.service;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.MaterialDAO;



@Service
public class MaterialServiceImpl implements MaterialService {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialServiceImpl.class);
	
	// 객체 주입
	@Inject
	private MaterialDAO mdao;
	@Inject
	private PagingService pageService;
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 0. 페이징처리 변수저장을 위한 Service 생성
	public PagingVO setPageInfoForMaterial(PagingVO pvo) throws Exception{
		
		// 필요한 변수 저장
		pvo.setTable("material");
		pvo.setId("ma_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("ma_status");
		pvo.setStatus_value("1");

		
		// 페이지 계산을 위해서 pagingSerivce 메서드 호출
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@CustomerService : {}",pvo);
	
		return pvo;
	}
	
	
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

	
	// 3. 자재 검색
	@Override
	public List<MaterialVO> getSearchList(MaterialVO vo) throws Exception {
		return mdao.getSearchList(vo);
	}
	
	
	// 4-1. 자재 품목코드 자동넘버링
	@Override
	public String getMaxNumber() throws Exception{
		return mdao.getMaxNumber();
	}
	
	// 4-2. 자재 등록
	@Override
	public void insertMaterial(MaterialVO vo) throws Exception{
		mdao.insertMaterial(vo);
	}
	
	
	// 5. 자재 수정
	@Override
	public Integer modifyMaterial(MaterialVO mvo) throws Exception{
		return mdao.modifyMaterial(mvo);
	}

	
	// 6. 자재 삭제
	@Override
	public Integer deleteMaterial(String ma_id) throws Exception{
		return mdao.deleteMaterial(ma_id);
	}

	
	// 7. 사원 이름 가져오기
	@Override
	public String getEmpName(String ma_id) throws Exception {
		return mdao.getEmpName(ma_id);
	}






}
