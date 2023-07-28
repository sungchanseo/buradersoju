package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {

	 private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	// dao 사용을 위한 의존성주입
	@Inject
	private CustomerDAO cdao;
	@Inject
	private PagingService pageService;

	@Override
	public PagingVO setPageInfoForCustomer(PagingVO pvo) throws Exception{
		logger.debug("@@@@@@CustomerService : setPageInfoForCustomer호출!");
		/*
		 * CustomerService
		 * - 페이징처리를 위해서는 도메인별로 다른 변수를 저장해야 한다. 
		 * => 해당 변수를 CustomerService에서 저장!
		 * - 페이징처리 계산은 공통이므로 PagingService에서 처리한다.
		 * => PagingSeriv의 메소드를 호출! 
		 */
		
		//customer서비스에 필요한 변수를 저장. 
		pvo.setTable("customer");
		pvo.setId("cust_id");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("cust_status");
		pvo.setStatus_value("0");
		logger.debug("@@@@@@CustomerService : {}",pvo);

		
		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@CustomerService : {}",pvo);
		return pvo;
	}
	
	@Override
	public CustomerVO getCustomerInfo(String cust_id) throws Exception{
		return cdao.getCustomerInfo(cust_id);
	}
	
	@Override
	public void insertCustomer(CustomerVO vo) throws Exception{
		
		//디비에서 가장 최신 거래처를 불러온다. 
		String lastId = cdao.getLastGeneratedNumber();
		logger.debug("@@@@@@CustomerService : {}", lastId);
		
		//가져온 데이타의 끝 번호만 잘라낸다. CU001
		int countPartUp = Integer.parseInt(lastId.substring(3,5));
		logger.debug("@@@@@@CustomerService : countPartup = {}", countPartUp);
		
		//cust_id 접두사
		String prefix = "CU";
		
		//1부터 시작하는 카운트 생성
		String countPart = String.format("%03d", 1);
		
		//거래처 데이타가 아무것도 없을 때 result
		String result = prefix + countPart;
		
		//잘라낸 끝번호가 1이상일 때는 1을 더해서 카운트한다.  
		if(countPartUp != 1) {
			countPartUp +=1;
			countPart = String.format("%03d", countPartUp);
			// 접두사+날짜+카운트를 조합한다.
			result = prefix + countPart;
		}
		logger.debug("@@@@@@ContractService : result={}", result);

		vo.setCust_id(result);
		
		cdao.insertCustomer(vo);
	}

	@Override
	public Integer modifyCustomer(CustomerVO mvo) throws Exception {
		return cdao.modifyCustomer(mvo);
	}

	@Override
	public Integer removeCustomer(String cust_id) throws Exception {
		return cdao.removeCustomer(cust_id);
	}
	
	//거래처 중복체크 ajax
	public Integer regNumCheck(String reg_num) throws Exception{
		return cdao.regNumCheck(reg_num);
	}

}