package com.itwillbs.service;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.InMaterialDAO;
import com.itwillbs.persistence.PagingDAO;



@Service
public class InMaterialServiceImpl implements InMaterialService {
	
	
	// 객체 주입
	@Inject
	private InMaterialDAO idao;
	
	// PagingDAO사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	
	
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

	// 5. 입고처리시 해당 자재 재고량 증가
	@Override
	public void getplusMa(InMaterialVO vo) throws Exception {
		idao.getPlusMa(vo);
	}

	
	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 0. 페이징처리 세부로직
	@Override
	public PagingVO pagingAction(PagingVO pvo) throws Exception {
		// 페이징처리1
		// 페이지 번호를 불러온다.
		// 만약 페이지 번호가 없으면 1번으로 고정하고, 있다면 그것을 가져다 쓴다.
		if (pvo.getPageNum() == null) pvo.setPageNum(1);
		
		// 현재 페이지, 시작페이지 및 끝페이지를 계산한다.
		pvo.setCurrentPage(pvo.getPageNum());
		pvo.setStartRow((pvo.getCurrentPage()-1)*pvo.getPageSize());
		pvo.setEndRow(pvo.getCurrentPage()*pvo.getPageSize());

		
		// 페이징처리2
		// 페이지 번호 계산하기
		int count;
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			count = getListSearchAll(pvo);
		}else {
			//검색어가 없을 때
			count = getListAll(pvo);
		}
		int pageCount;
		int pageBlock;
		int startPage;
		int endPage;
		
		if (count != 0) {
			pageCount = count / pvo.getPageSize() + (count % pvo.getPageSize() == 0 ? 0 : 1);

			pageBlock=5;

			startPage = ((pvo.getCurrentPage() - 1) / pageBlock) * pageBlock + 1;
			
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			
			pvo.setPageCount(pageCount);
			pvo.setPageBlock(pageBlock);
			pvo.setStartPage(startPage);
			pvo.setEndPage(endPage);
			
		}
		// 페이징처리 끝
		return pvo;
	}
		
	
	// 1. 개수 가져오기
	//전체 목록 조회
	@Override
	public int getListAll(PagingVO pvo) throws Exception {
		return idao.getListAll(pvo);
	}
	//페이징 목록갯수 가져오기
	@Override
	public int getListPageSizeAll(PagingVO pvo) throws Exception {
		return idao.getListPageSizeAll(pvo);
	}
	//검색어+페이징 전체목록 가져오기 	
	@Override
	public int getListSearchAll(PagingVO pvo) throws Exception  {
		return idao.getListSearchAll(pvo);
	}
	//필터+페이징 목록갯수 가져오기 	
	@Override
	public int getListFilterAll(PagingVO pvo) throws Exception {
		return idao.getListFilterAll(pvo);
	}
	//검색어+필터+페이징 목록 갯수 가져오기 
	@Override
	public int getListSearchFilterAll(PagingVO pvo) throws Exception {
		return idao.getListSearchFilterAll(pvo);
	}

	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception {
		List<Object> result = idao.getListPageSizeObjectInMaterialVO(pvo);
		return result;
	}
	
	// 검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception {
		return idao.getListSearchObjectInMaterialVO(pvo);
	}
	
	// 필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		return idao.getListFilterObjectInMaterialVO(pvo);
	}
	
	// 검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		return idao.getListSearchFilterObjectInMaterialVO(pvo);
	}

}
