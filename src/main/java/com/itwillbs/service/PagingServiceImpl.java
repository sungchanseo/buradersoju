package com.itwillbs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.PagingDAO;

@Service
public class PagingServiceImpl implements PagingService {
	
	//로그 출력을 위한 로거 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(PagingServiceImpl.class);

	//DAO사용을 위한 객체 주입 
	@Autowired
	private PagingDAO pdao;
	
	//PagingDAO사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	
	//페이징처리 세부로직
	@Override
	public PagingVO pagingAction(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : 페이징처리를 위한 계산 시작!");
		//////////////////////////////////////////////////////////
		// 페이징처리1/

		// 페이지 번호를 불러온다.
		// 만약 페이지 번호가 없으면 1번으로 고정하고, 있다면 그것을 가져다 쓴다.
		if (pvo.getPageNum() == null) pvo.setPageNum(1);
		logger.debug("@@@@@@@@@@@PagingSerivce : pageNum={}",pvo.getPageNum());
		
		// 현재 페이지, 시작페이지 및 끝페이지를 계산한다.
		pvo.setCurrentPage(pvo.getPageNum());
		logger.debug("@@@@@@@@@@@PagingSerivce : currentPage={}",pvo.getCurrentPage());
		
		pvo.setStartRow((pvo.getCurrentPage()-1)*pvo.getPageSize());
		logger.debug("@@@@@@@@@@@PagingSerivce : startRow={}",pvo.getStartRow());

		pvo.setEndRow(pvo.getCurrentPage()*pvo.getPageSize());
		logger.debug("@@@@@@@@@@@PagingSerivce : endRow={}",pvo.getEndRow());
		//////////////////////////////////////////////////////////

		//////////////////////////////////////////////////////////
		// 페이징처리2
		// 페이지 번호 계산하기
		logger.debug("@@@@@@@@@@@PagingSerivce : 페이징처리2 시작합니다.");
		int count;
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@@@PagingSerivce : 검색어가 있을 때 입니다. ");
			count = getListSearchAll(pvo);
			logger.debug("@@@@@@@@@@@Serivce : 검색어 있을 때 전체 리스트 : " + count);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@@@PagingSerivce : 검색어가 없을 때 입니다. ");
			count = getListAll(pvo);
			logger.debug("@@@@@@@@@@@Serivce : 검색어 없을 때 전체 리스트 : " + count);
		}
		int pageCount;
		int pageBlock;
		int startPage;
		int endPage;
		
		if (count != 0) {
			pageCount = count / pvo.getPageSize() + (count % pvo.getPageSize() == 0 ? 0 : 1);
			logger.debug("@@@@@@@@@@@PagingSerivce : 디버그중....");

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
		////////////////////페이징처리끝///////////////////////////
		logger.debug("@@@@@@@@@@@Serivce : 페이징처리 끝났습니다.");
		return pvo;
	}
	
	//거래처 전체 목록 조회
	@Override
	public int getListAll(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListAll()메소드 호출!");
		pvo.setTable("customer");
		return pdao.getListAll(pvo);
	}
	//페이징 목록갯수 가져오기
	@Override
	public int getListPageSizeAll(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeAll()메소드 호출!");
		return pdao.getListPageSizeAll(pvo);
	}
	//검색어+페이징 전체목록 가져오기 	
	@Override
	public int getListSearchAll(PagingVO pvo) throws Exception  {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchAll()메소드 호출!");
		return pdao.getListSearchAll(pvo);
	}
	//필터+페이징 목록갯수 가져오기 	
	@Override
	public int getListFilterAll(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterAll()메소드 호출!");
		return pdao.getListFilterAll(pvo);
	}
	//검색어+필터+페이징 목록 갯수 가져오기 
	@Override
	public int getListSearchFilterAll(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterAll()메소드 호출!");
		return pdao.getListSearchFilterAll(pvo);
	}
	
	///////////////////////////////////////////////////////////////
	
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObject(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObject()메소드 호출!");
		return pdao.getListPageSizeObject(pvo);
	}
	
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObject(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObject()메소드 호출!");
		return pdao.getListSearchObject(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObject(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObject()메소드 호출!");
		return pdao.getListFilterObject(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObject(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObject()메소드 호출!");
		return pdao.getListSearchFilterObject(pvo);
	}
	
	
}
