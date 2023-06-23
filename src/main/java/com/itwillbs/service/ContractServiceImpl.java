package com.itwillbs.service;

import java.time.LocalDate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.ContractDAO;

@Service
public class ContractServiceImpl implements ContractService {

	//로그출력을 위한 로거인스턴스 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);
	
	//DAO 사용을 위한 인스턴스 주입
	@Autowired
	private ContractDAO cdao;
	@Autowired
	private PagingService pageService;
	
	//페이징처리 변수저장을 위한 서비스 구현
	@Override
	public PagingVO setPageInfoForContract(PagingVO pvo) throws Exception {
		logger.debug("@@@@@@ContractService : 수주목록 페이징처리를 위한 변수 초기화 실행합니다.");
		
		//contract서비스에 필요한 변수를 저장. 
		pvo.setTable("contract");
		pvo.setId("cont_id");
		pvo.setPageSize(5);
		pvo.setStartRow(1);
		pvo.setStatus_name("cont_status");
		pvo.setStatus_value("0");
		logger.debug("@@@@@@ContractrService : {}",pvo);
		
		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@ContractService : {}",pvo);
		return pvo;
	}
	
	//수주 상세보기
	@Override
	public ContractVO getContractInfo(String cont_id) throws Exception{
		logger.debug("@@@@@@ContractService : 수주 상세보기 실행합니다.");
		return cdao.readContractInfo(cont_id);
	}

	//수주 등록하기
	@Override
	public void registContract(ContractVO cvo) throws Exception{
		logger.debug("@@@@@@ContractService : 수주 등록하기 실행합니다.");
		
		
		///////////cont_id 조합하기 시작!///////////
		//먼저 디비 데이터의 가장 최신 자료를 불러온다. 
		String lastId = cdao.getLastGeneratedNumber();
		logger.debug("@@@@@@ContractService : {}", lastId);
		
		//cont_id 접두사
		String prefix = "CO";
		
		// 현재 날짜를 계산한다. 
		LocalDate currentDate = LocalDate.now();
		String datePart = currentDate.toString().replace("-", "").substring(2, 8); // 년월일 6글자
	
		// 1부터 시작하는 카운트를 생성한다. 
		String countPart = String.format("%03d", 1);// 001부터 시작
		    	
		
		if(lastId != null) {
			//가운트 부분을 추려낸다. 
			String datePartUp = lastId.substring(2,8);
			Integer countPartUp = Integer.parseInt(lastId.substring(9,11));
			logger.debug("@@@@@@ContractService : {}", datePartUp);
			logger.debug("@@@@@@ContractService : {}", countPartUp);
			
			
			
			//날짜부분이 같고 끝번호가 1이상일 때는 1을 더해서 카운트한다.  
			if(countPartUp >= 1) {
				countPartUp +=1;
				countPart = String.format("%03d", countPartUp);
			}
			// 접두사+날짜+카운트를 조합한다.
		}
		String result = prefix + datePart + countPart;
		logger.debug("@@@@@@ContractService : {}", result);

		cvo.setCont_id(result);
		///////////cont_id 조합하기 끝!///////////

		cdao.insertContract(cvo);
	}

	//수주 수정하기
	@Override
	public Integer modifyContract(ContractVO cvo) throws Exception{
		logger.debug("@@@@@@ContractService : 수주 수정하기 실행합니다.");
		return cdao.updateContract(cvo);
	}

	//수주 삭제하기
	@Override
	public Integer removeContract(String cont_id) throws Exception{
		logger.debug("@@@@@@ContractService : 수주 삭제하기 실행합니다.");
		return cdao.deleteContract(cont_id);
	}
	
}
