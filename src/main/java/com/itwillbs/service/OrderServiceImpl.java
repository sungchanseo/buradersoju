package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.InMaterialVO;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.InMaterialDAO;
import com.itwillbs.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	// dao 사용을 위한 의존성 주입
	
	@Inject
	private OrderDAO odao;
	
	// PagingDAO 사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
    

	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
    

	// 전체 리스트 불러오기
	@Override
	public List<OrderVO> getOrderList() throws Exception {

		return odao.getOrderList();		
	}

	@Override
	public Integer modifyOrder(OrderVO ovo) throws Exception{
		
		return odao.modifyOrder(ovo);
	}

	@Override
	public void insertOrder(OrderVO vo) throws Exception {
		odao.insertOrder(vo);
		
	}

	@Override
	public String getMaxNumber() throws Exception {
		
		return odao.getMaxNumber();
	}

	@Override
	public String getMaxDate() throws Exception {
		
		return odao.getMaxDate();
	}

	@Override
	public void registOrderId(OrderVO vo) throws Exception {
		odao.regisOrderId(vo);
	}

	@Override
	public OrderVO getOrderInfo(String order_id) throws Exception {
		
		return odao.getOrderInfo(order_id);
	}

	@Override
	public Integer deleteOrder(String order_id) throws Exception {
		
		return odao.deleteOrder(order_id);	
	}

	@Override
	public List<OrderVO> getMaterialList(String ma_id) throws Exception {
	
		return odao.getMaterialList(ma_id);
	}

	@Override
	public OrderVO getOrderInfoauto(String order_id) throws Exception {
		
		return odao.getOrderInfoauto(order_id);
	}

	@Override
	public void getAddMa(String order_id) throws Exception {
	
		odao.getAddMa(order_id);
		
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
    // 0. 페이징처리 세부로직
	@Override
	public PagingVO pagingAction(PagingVO pvo) throws Exception {
		
		pvo.setTable("orders");
		pvo.setId("order_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("order_status");
		pvo.setStatus_value("1");
		
		// 페이징처리1
		// 페이지 번호를 불러옴
		// 만약 페이지 번호가 없으면 1번으로 고정하고, 있다면 가져다 사용
		if (pvo.getPageNum() == null) pvo.setPageNum(1);
		logger.debug("통과2");
		
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
		return odao.getListAll(pvo);
	}
	
	// 페이징 목록 개수
	@Override
	public int getListPageSizeAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListPageSizeAl() 호출");
		return odao.getListPageSizeAll(pvo);
	}
	
	// 검색어 + 페이징 전체 목록 	
	@Override
	public int getListSearchAll(PagingVO pvo) throws Exception  {
		logger.debug("############### Paging : getListSearchAll 호출");
		return odao.getListSearchAll(pvo);
	}
	
	// 필터 + 페이징 목록 개수
	@Override
	public int getListFilterAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListFilterAll 호출");
		return odao.getListFilterAll(pvo);
	}
	
	// 검색어 + 필터 + 페이징 목록 개수
	@Override
	public int getListSearchFilterAll(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchFilterAll 호출");
		return odao.getListSearchFilterAll(pvo);
	}

	
	// 2. 객체 가져오기
	// 아무조건이 없을 때 전체 목록 객체
	@Override
	public List<Object> getListPageSizeObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListPageSizeObjectInMaterialVO 호출");
		List<Object> result = odao.getListPageSizeObjectInMaterialVO(pvo);
		return result;
	}
	
	// 검색어 있을 때 전체 목록 객체	
	@Override
	public List<Object> getListSearchObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchObjectInMaterialVO 호출");
		return odao.getListSearchObjectInMaterialVO(pvo);
	}
	
	// 필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListFilterObjectInMaterialVO 호출");
		return odao.getListFilterObjectInMaterialVO(pvo);
	}
	
	// 검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectInMaterialVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchFilterObjectInMaterialVO 호출");
		return odao.getListSearchFilterObjectInMaterialVO(pvo);
	}

	
    
	
	
}
