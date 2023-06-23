package com.itwillbs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.ContractService;
import com.itwillbs.service.PagingService;

@Controller
@RequestMapping(value = "/contract/*")
public class ContractController {

	//로그출력을 위한 로거 인스턴스 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
	
	//서비스 이용을 위한 인스턴스 주입
	@Autowired
	private ContractService contService;
	@Autowired
	private PagingService pageSerivce;
	
	// http://localhost:8088/contract/list
	
	//수주 목록 불러오기 
	@GetMapping(value="/list")
	public void contractListGET(PagingVO pvo, Model model) throws Exception{
		logger.debug("%%%%%%%%%%ContractController : 수주 리스트 조회!");
		
		List<Object> contractList = null;
		
		//수주 목록을 가져오는 contService 호출
		pvo = contService.setPageInfoForContract(pvo);
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
		//service객체를 호출
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			contractList = pageSerivce.getListSearchObjectContractVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			contractList = pageSerivce.getListPageSizeObjectContractVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : {}",contractList);
	
		//변수에 담아서 전달
		model.addAttribute("contractList", contractList);
		model.addAttribute("pvo",pvo);
	}
	// 수주내용 자세히보기 
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void contractInfoGET(ContractVO cvo, Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 상세보기 !");

		logger.debug("@@@@@@@@@@@@Controller : {}",cvo);
		// servicer객체 호출
		ContractVO contractInfo = contService.getContractInfo(cvo.getCont_id());
		// 변수에 넣어 뷰페이지로 보내기
		model.addAttribute("contractInfo", contractInfo);
	}
	
	// http://localhost:8088/contract/insert
	// 수주 등록 입력하기
	@GetMapping(value = "/insert")
	public void registContractGET(ContractVO cvo)  throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 등록GET하기!!!!");
	}

	// 수주 등록 디비처리
//	@PostMapping(value = "/insert")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String registContractPOST(ContractVO cvo)  throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 등록POST하기!!!!");
		logger.debug("@@@@@@@입력된 정보 : " + cvo);

		contService.registContract(cvo);
		
		return "redirect:/contract/list";
	}
	
	// 수주 수정 입력하기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyContractGET(ContractVO cvo, Model model) throws Exception{
		logger.debug("@@@@@@@@@@Contorller : 수주 수정 GET하기 !!!");
		cvo = contService.getContractInfo(cvo.getCont_id());
		model.addAttribute("contractInfo", cvo);
	}

	// 거래처 수정 디비처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyCustomerPOST(ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@Contorller : 수주 수정 POST하기 !!!");
		logger.debug("@@@@@@@@@controller : 수정한 수주정보 : " + cvo);

		contService.modifyContract(cvo);
		return "redirect:/contract/list";

	}

	// 거래처 삭제 디비처리
	@GetMapping(value = "/remove")
	public String removeContractPOST(ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@@Controller : 수주 삭제POST하기 !!!!!");

		contService.removeContract(cvo.getCont_id());

		return "redirect:/contract/list";
	}
}
