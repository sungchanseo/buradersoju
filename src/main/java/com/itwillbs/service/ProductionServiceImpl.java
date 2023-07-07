package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.PagingDAO;
import com.itwillbs.persistence.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {
	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(ProductionServiceImpl.class);

	// 객체 주입
	@Inject
	private ProductionDAO pdao;	
	
	// PagingDAO 사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	

	
	// 생산목록
	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		return pdao.getProductionList();
	}
	
	// 생산등록(작업지시번호 조회)
	@Override
	public ProductionVO getInsertSearch(String production_id) throws Exception {
		return pdao.getInsertSearch(production_id);
	}

	// 생산등록 (혼합등록)
	@Override
	public void insertStage1(ProductionVO vo) throws Exception {
		pdao.insertStage1(vo);
		
	}

	// 생산등록 (주입등록)
	@Override
	public void insertStage2(ProductionVO vo) throws Exception {
		pdao.insertStage2(vo);
		
	}

	// 생산등록 (포장등록)
	@Override
	public void insertStage3(ProductionVO vo) throws Exception {
		pdao.insertStage3(vo);
		
	}
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 0. 페이징처리 세부로직
	@Override
	public PagingVO pagingAction(PagingVO pvo) throws Exception {
		pvo.setTable("production");
		pvo.setId("production_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("del_woStatus");
		pvo.setStatus_value("0");
		
		// 페이징처리1
		// 페이지 번호를 불러옴
		// 만약 페이지 번호가 없으면 1번으로 고정하고, 있다면 가져다 사용
		if (pvo.getPageNum() == null) pvo.setPageNum(1);
		
		// 현재 페이지, 시작페이지, 끝페이지 계산
		pvo.setCurrentPage(pvo.getPageNum());
		pvo.setStartRow((pvo.getCurrentPage()-1)*pvo.getPageSize());
		pvo.setEndRow(pvo.getCurrentPage()*pvo.getPageSize());
	
		
		// 페이징처리2
		// 페이지 번호 계산
		int count;
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			// 검색어가 있을 때 
			count = getListSearchAll(pvo);
		}else {
			// 검색어가 없을 때
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
		logger.debug("############### 페이징처리 끝");
		logger.debug("############### Paging : {}", pvo);
		return pvo;
	}
	
	
	// 1. 개수 가져오기
	// 전체 목록 조회
	@Override
	public int getListAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListAll() 호출");
		return pdao.getListAll(pvo);
	}
	
	// 페이징 목록 개수
	@Override
	public int getListPageSizeAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListPageSizeAl() 호출");
		return pdao.getListPageSizeAll(pvo);
	}
	
	// 검색어 + 페이징 전체 목록 	
	@Override
	public int getListSearchAll(PagingVO pvo) throws Exception  {
		logger.debug("############### Paging : getListSearchAll 호출");
		return pdao.getListSearchAll(pvo);
	}
	
	// 필터 + 페이징 목록 개수
	@Override
	public int getListFilterAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListFilterAll 호출");
		return pdao.getListFilterAll(pvo);
	}
	
	// 검색어 + 필터 + 페이징 목록 개수
	@Override
	public int getListSearchFilterAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchFilterAll 호출");
		return pdao.getListSearchFilterAll(pvo);
	}
	
	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체
	@Override
	public List<Object> getListPageSizeObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListPageSizeObjectProductionVO 호출");
		List<Object> result = pdao.getListPageSizeObjectProductionVO(pvo);
		return result;
	}
	
	// 검색어 있을 때 전체 목록 객체	
	@Override
	public List<Object> getListSearchObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchObjectProductionVO 호출");
		return pdao.getListSearchObjectProductionVO(pvo);
	}
	
	// 필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListFilterObjectProductionVO 호출");
		return pdao.getListFilterObjectProductionVO(pvo);
	}
	
	// 검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchFilterObjectProductionVO 호출");
		return pdao.getListSearchFilterObjectProductionVO(pvo);
	}

	
}
