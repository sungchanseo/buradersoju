package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PagingVO;
@Repository
public interface PagingDAO {

	
		//전체 목록 갯수를 가져오기 
		public int getListAll(PagingVO pvo)throws Exception ;

		//아무조건이 없을 때 전체 목록갯수 가져오기
		public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
		//검색어+페이징처리 전체 목록갯수 가져오기 	
		public int getListSearchAll(PagingVO pvo)throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public int getListFilterAll(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public int getListSearchFilterAll(PagingVO pvo) throws Exception;
		
		/////////////////////////////////////////////////////////////
		
		/////////////////////////////////CustomerVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectCustomerVO(PagingVO pvo) throws Exception;

		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectCustomerVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectCustomerVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectCustomerVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////ContractVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectContractVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectContractVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectContractVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectContractVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////EmployeeVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectEmployeeVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectEmployeeVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectEmployeeVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectEmployeeVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		
		/////////////////////////////////InMaterialVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////MaterialVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectMaterialVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectMaterialVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectMaterialVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectMaterialVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////NoticeVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectNoticeVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectNoticeVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectNoticeVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectNoticeVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////OrderVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectOrderVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectOrderVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectOrderVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectOrderVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////OutProductVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectOutProductVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////ProductionVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectProductionVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectProductionVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectProductionVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectProductionVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		/////////////////////////////////WarehouseVO////////////////////////////////////
		//아무조건이 없을 때 전체 목록 객체 가져오기
		public List<Object> getListPageSizeObjectWarehouseVO(PagingVO pvo) throws Exception;
		
		//검색어 있을 때 목록 객체 가져오기 	
		public List<Object> getListSearchObjectWarehouseVO(PagingVO pvo) throws Exception;
		
		//검색어+필터처리 전체 목록갯수 가져오기 	
		public List<Object> getListFilterObjectWarehouseVO(PagingVO pvo)throws Exception;
		
		//검색어와 필터 모두 있을 때 전체 목록 갯수 가져오기 
		public List<Object> getListSearchFilterObjectWarehouseVO(PagingVO pvo) throws Exception;
		///////////////////////////////////////////////////////////////////////////////
		
		
		
}
