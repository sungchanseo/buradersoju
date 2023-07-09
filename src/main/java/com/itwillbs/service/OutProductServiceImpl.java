package com.itwillbs.service;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.OutProductVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.OutProductDAO;



@Service
public class OutProductServiceImpl implements OutProductService{

	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(InMaterialServiceImpl.class);
	
	
	// 객체 주입
	@Inject
	private OutProductDAO odao;
	
	
	// PagingDAO 사용을 위한 객체 생성
	PagingVO pvo = new PagingVO();
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 출고 리스트
	@Override
	public List<OutProductVO> getOutProductList() throws Exception{
		return odao.getOutProductList();
	}

	// 2. 출고 상세보기
	@Override
	public OutProductVO getOutProductInfo(String cont_id) throws Exception{
		return odao.getOutProductInfo(cont_id);
	}

	// 3-1. 출고번호 최대값 (maxNumber) 230620004
	@Override
	public String getMaxNumber() throws Exception {
		return odao.getMaxNumber();
	}
	
	// 3-2. 출고번호 최대날짜 (maxDate) 230620
	@Override
	public String getMaxDate() throws Exception {
		return odao.getMaxDate();
	}
	
	// 3-3. 출고번호 등록하기
	@Override
	public void registOpId(OutProductVO vo) throws Exception{
		odao.registOpId(vo);
	}
	
	// 4. 상품에 필요한 소요량과 현재고량 가져오기
	@Override
	public List<OutProductVO> getInventory(String product_id) throws Exception {
		return odao.getInventory(product_id);
	}
	
	// 5. tmp_qty 생성
	@Override
	public void getTmpQty(String cont_id) throws Exception {
		odao.getTmpQty(cont_id);
	}
	
	
	
	
	
	
	
	


	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 0. 페이징처리 세부로직
	@Override
	public PagingVO pagingAction(PagingVO pvo) throws Exception {
		pvo.setTable("out_product");
		pvo.setId("op_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("op_status");
		pvo.setStatus_value("1");
		
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
		if(pvo.getOp_id() != null || pvo.getProduct_name() != null || pvo.getOp_empName() != null) {
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
	public List<Object> getListPageSizeObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListPageSizeObjectOutProductVO 호출");
		List<Object> result = odao.getListPageSizeObjectOutProductVO(pvo);
		return result;
	}
	
	// 검색어 있을 때 전체 목록 객체	
	@Override
	public List<Object> getListSearchObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchObjectOutProductVO 호출");
		return odao.getListSearchObjectOutProductVO(pvo);
	}
	
	// 필터있을 때 전체 목록 객체 가져오기 	
	@Override
	public List<Object> getListFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListFilterObjectOutProductVO 호출");
		return odao.getListFilterObjectOutProductVO(pvo);
	}
	
	// 검색어와 필터 모두 있을 때 전체 객체 가져오기 
	@Override
	public List<Object> getListSearchFilterObjectOutProductVO(PagingVO pvo) throws Exception {
		logger.debug("############### Paging : getListSearchFilterObjectOutProductVO 호출");
		return odao.getListSearchFilterObjectOutProductVO(pvo);
	}
	
	
	
	
	
	
	
	
}
