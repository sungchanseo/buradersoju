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
			logger.debug("@@@@@@@@@@@PagingSerivce : 검색어 있을 때 전체 리스트 : " + count);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@@@PagingSerivce : 검색어가 없을 때 입니다. ");
			count = getListAll(pvo);
			logger.debug("@@@@@@@@@@@PagingSerivce : 검색어 없을 때 전체 리스트 : " + count);
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
		////////////////////페이징처리끝///////////////////////////
		logger.debug("@@@@@@@@@@@PagingSerivce : 페이징처리 끝났습니다.");
		logger.debug("@@@@@@@@@@@PagingSerivce : {}",pvo);
		return pvo;
	}
	
	//전체 목록 조회
	@Override
	public int getListAll(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListAll()메소드 호출!");
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
	
	
	
	
	
	
	/////////////////////////////////CustomerVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectCustomerVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectCustomerVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectCustomerVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectCustomerVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectCustomerVO()메소드 호출!");
		return pdao.getListSearchObjectCustomerVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectCustomerVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectCustomerVO()메소드 호출!");
		return pdao.getListFilterObjectCustomerVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectCustomerVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectCustomerVO()메소드 호출!");
		return pdao.getListSearchFilterObjectCustomerVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////ContractVO/////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectContractVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectContractVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectContractVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectContractVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectContractVO()메소드 호출!");
		return pdao.getListSearchObjectContractVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectContractVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectContractVO()메소드 호출!");
		return pdao.getListFilterObjectContractVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectContractVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectContractVO()메소드 호출!");
		return pdao.getListSearchFilterObjectContractVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////EmployeeVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectEmployeeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectEmployeeVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectEmployeeVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectEmployeeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectEmployeeVO()메소드 호출!");
		return pdao.getListSearchObjectEmployeeVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectEmployeeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectEmployeeVO()메소드 호출!");
		return pdao.getListFilterObjectEmployeeVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectEmployeeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectEmployeeVO()메소드 호출!");
		return pdao.getListSearchFilterObjectEmployeeVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////InMaterialVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectInMaterialVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectInMaterialVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectInMaterialVO()메소드 호출!");
		return pdao.getListSearchObjectInMaterialVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectInMaterialVO()메소드 호출!");
		return pdao.getListFilterObjectInMaterialVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectInMaterialVO()메소드 호출!");
		return pdao.getListSearchFilterObjectInMaterialVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////MaterialVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectMaterialVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectMaterialVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectMaterialVO()메소드 호출!");
		return pdao.getListSearchObjectMaterialVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectMaterialVO()메소드 호출!");
		return pdao.getListFilterObjectMaterialVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectMaterialVO()메소드 호출!");
		return pdao.getListSearchFilterObjectMaterialVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////NoticeVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectNoticeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectNoticeVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectNoticeVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectNoticeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectNoticeVO()메소드 호출!");
		return pdao.getListSearchObjectNoticeVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectNoticeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectNoticeVO()메소드 호출!");
		return pdao.getListFilterObjectNoticeVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectNoticeVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectNoticeVO()메소드 호출!");
		return pdao.getListSearchFilterObjectNoticeVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////OrderVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectOrderVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectOrderVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectOrderVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectOrderVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectOrderVO()메소드 호출!");
		return pdao.getListSearchObjectOrderVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectOrderVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectOrderVO()메소드 호출!");
		return pdao.getListFilterObjectOrderVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectOrderVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectOrderVO()메소드 호출!");
		return pdao.getListSearchFilterObjectOrderVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////OutProductVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectOutProductV()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectOutProductVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectOutProductVO()메소드 호출!");
		return pdao.getListSearchObjectOutProductVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectOutProductV()메소드 호출!");
		return pdao.getListFilterObjectOutProductVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectOutProductV()메소드 호출!");
		return pdao.getListSearchFilterObjectOutProductVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////ProductionVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectProductionVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectProductionVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectProductionVO()메소드 호출!");
		return pdao.getListSearchObjectProductionVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectProductionVO()메소드 호출!");
		return pdao.getListFilterObjectProductionVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectProductionVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectProductionVO()메소드 호출!");
		return pdao.getListSearchFilterObjectProductionVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////WarehouseVO////////////////////////////////////
	//아무조건이 없을 때 전체 목록 객체 가져오기
	@Override
	public List<Object> getListPageSizeObjectWarehouseVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListPageSizeObjectWarehouseVO()메소드 호출!");
		List<Object> result = pdao.getListPageSizeObjectWarehouseVO(pvo);
		return result;
	}
	//검색어 있을 때 전체목록 객체 가져오기 	
	@Override
	public List<Object> getListSearchObjectWarehouseVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchObjectProductionVO()메소드 호출!");
		return pdao.getListSearchObjectWarehouseVO(pvo);
	}
	//필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectWarehouseVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListFilterObjectProductionVO()메소드 호출!");
		return pdao.getListFilterObjectWarehouseVO(pvo);
	}
	//검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectWarehouseVO(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@@@@@@PagingSerivce : getListSearchFilterObjectWarehouseVO()메소드 호출!");
		return pdao.getListSearchFilterObjectWarehouseVO(pvo);
	}
	///////////////////////////////////////////////////////////////////////////////
	
}
