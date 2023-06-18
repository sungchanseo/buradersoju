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
		String prefix = "CO";
        
        // 현재 날짜
        LocalDate currentDate = LocalDate.now();
        String datePart = currentDate.toString().replace("-", ""); // 년월일 8글자
        
        // 카운트 부분
        String countPart = String.format("%03d", 1); // 001부터 시작
        
        // 문자열 조합
        String result = prefix + datePart + countPart;
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
