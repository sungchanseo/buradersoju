package com.itwillbs.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.WorkOrderDAO;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {
	

	private static final Logger logger = LoggerFactory.getLogger(WorkOrderServiceImpl.class);
	
	// DAO 객체 접근
	@Inject
	private WorkOrderDAO wdao;
	@Inject
	private PagingService pageService;
	
	@Override
	public PagingVO setPageInfoForWorkOrder(PagingVO pvo) throws Exception{
		logger.debug("@@@@@@CustomerService : setPageInfoForCustomer호출!");
		
		//WorkOrder서비스에 필요한 변수를 저장. 
		pvo.setTable("production a, product b");
		pvo.setId("production_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("a.product_id = b.product_id and workOrder_status");
		pvo.setStatus_value("대기");
		logger.debug("@@@@@@WorkOrderService : {}",pvo);

		
		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@WorkOrderService : {}",pvo);
		return pvo;
	}
	
	// 작업지시 목록
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception{
		return wdao.getWorkOrderList();
	}

	// 작업지시 등록(수주번호 조회)
	@Override
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception{
		return wdao.getWoInsertSearch(cont_id);
	}
	
	// 작업지시 등록(자재 재고 조회)
	@Override
	public List<ProductionVO> getMaterialList(String product_id) throws Exception {
		// TODO Auto-generated method stub
		return wdao.getMaterialList(product_id);
	}
	
	// 작업지시 등록(DB저장)
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		logger.debug("@@@@@@WorkOrderService : 작업지시 등록 실행");
		
		
		///////////cont_id 조합하기 시작!///////////
		//먼저 디비 데이터의 가장 최신 자료를 불러온다. 
		String lastId = wdao.getLastGeneratedNumber();
		logger.debug("@@@@@@WorkOrderService : {}", lastId);
		
		//cont_id 접두사
		String prefix = "PR";
		
		// 현재 날짜를 계산한다. 
		LocalDate currentDate = LocalDate.now();
		String datePart = currentDate.toString().replace("-", "").substring(2, 8); // 년월일 6글자
	
		// 1부터 시작하는 카운트를 생성한다. 
		String countPart = String.format("%03d", 1);// 001부터 시작
		logger.debug("@@@@@@WorkOrderService : countPart={}", countPart);

		String result = null;
		if(lastId != null) {
			//수주목록에 아무것도 없을 때
			logger.debug("@@@@@@WorkOrderService : 수주목록이 없습니다");

			//접두사+현재날짜+001을 그냥 더한다.
			result = prefix + datePart + countPart;
			logger.debug("@@@@@@WorkOrderService : result={}", result);

		}else {
			//수주목록이 있을 때 
			logger.debug("@@@@@@WorkOrderService : 수주목록이 없습니다"); 

			//가운데 날짜 8자리를 추출한다. 
			String datePartUp = lastId.substring(2,8);
			logger.debug("@@@@@@WorkOrderService : datePartUp={}", datePartUp);

			//데이타베이의 날짜부분과 오늘날짜 추출한 부분이 같으면 카운트에 1을 더한다. 
			if(datePart.equals(datePartUp)) {
				//카운트 부분을 추려낸다. 
				Integer countPartUp = Integer.parseInt(lastId.substring(9,11));
				logger.debug("@@@@@@WorkOrderService : countPartUp={}", countPartUp);

				//날짜부분이 같고 끝번호가 1이상일 때는 1을 더해서 카운트한다.  
				if(countPartUp != 1) {
					countPartUp +=1;
					countPart = String.format("%03d", countPartUp);
					// 접두사+날짜+카운트를 조합한다.
					result = prefix + datePart + countPart;
					logger.debug("@@@@@@WorkOrderService : result={}", result);
				}
			}
		}
//		String result = prefix + datePart + countPart;
		logger.debug("@@@@@@WorkOrderService : {}", result);

		vo.setProduction_id(result);
		///////////cont_id 조합하기 끝!///////////
		
		wdao.insertWorkOrder(vo);
	}
	
	// 작업지시 등록(DB저장)
	@Override
	public void maQtyUpdate(List<String> ma_nameList, List<String> ma_qtyList) throws Exception {
		logger.debug(" maQtyUpdate()-service 호출 ");
		wdao.maQtyUpdate(ma_nameList, ma_qtyList);
	}
	
	// 작업지시 상세
	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception{
		return wdao.detailWorkOrder(production_id);
	}

	

	
}
