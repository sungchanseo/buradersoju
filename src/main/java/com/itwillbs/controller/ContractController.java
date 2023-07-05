package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.service.ContractService;
import com.itwillbs.service.CustomerService;
import com.itwillbs.service.EmployeeService;
import com.itwillbs.service.PagingService;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping(value = "/contract/*")
public class ContractController {

	// 로그출력을 위한 로거 인스턴스 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);

	// 서비스 이용을 위한 인스턴스 주입
	@Autowired
	private ContractService contService;
	@Autowired
	private PagingService pageService;
	@Autowired
	private EmployeeService empService;
	@Autowired
	private CustomerService custService;
	@Autowired
	private ProductionService proService;
	// http://localhost:8088/contract/list

	// 수주 목록 불러오기
	@GetMapping(value = "/list")
	public String contractListGET(PagingVO pvo, Model model, HttpSession session) throws Exception {
		logger.debug("%%%%%%%%%%ContractController : 수주 리스트 조회!");

		//로그인 세션이 없을 때 로그인 페이지로 이동한다. 
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
		
		List<Object> contractList = null;

		// 수주 목록을 가져오는 contService 호출
		pvo = contService.setPageInfoForContract(pvo);
		logger.debug("@@@@@@@@@Controller : {}", pvo);

		// service객체를 호출
		if (pvo.getSelector() != null && pvo.getSelector() != "") {
			// 검색어가 있을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			contractList = pageService.getListSearchObjectContractVO(pvo);
		} else {
			// 검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			contractList = pageService.getListPageSizeObjectContractVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : {}", contractList);

		// 변수에 담아서 전달
		model.addAttribute("contractList", contractList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		model.addAttribute("pvo", pvo);
		
		return null;
	}

	// 수주내용 자세히보기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void contractInfoGET(ContractVO cvo, Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 상세보기 !");

		logger.debug("@@@@@@@@@@@@Controller : {}", cvo);
		// servicer객체 호출
		ContractVO contractInfo = contService.getContractInfo(cvo.getCont_id());
		// 변수에 넣어 뷰페이지로 보내기
		model.addAttribute("contractInfo", contractInfo);
	}

	// http://localhost:8088/contract/insert
	// 수주 등록 입력하기
	@GetMapping(value = "/insert")
	public void registContractGET(ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 등록GET하기!!!!");
	}

	// 수주 등록 디비처리
//	@PostMapping(value = "/insert")
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String registContractPOST(@RequestBody ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 수주 등록POST하기!!!!");
		logger.debug("@@@@@@@입력된 정보 : " + cvo);

		contService.registContract(cvo);
		contService.contIdInsert(cvo.getCont_id());
		return "redirect:/contract/list";
	}

	// 수주 수정 입력하기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyContractGET(ContractVO cvo, Model model) throws Exception {
		logger.debug("@@@@@@@@@@Contorller : 수주 수정 GET하기 !!!");
		ContractVO contractInfo = contService.getContractInfo(cvo.getCont_id());
		
		model.addAttribute("contractInfo", contractInfo);
	}

	// 수주 수정 디비처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyCustomerPOST(ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@Contorller : 수주 수정 POST하기 !!!");
		logger.debug("@@@@@@@@@controller : 수정한 수주정보 : " + cvo);

		contService.modifyContract(cvo);
		return "redirect:/contract/list";

	}

	// 수주 삭제 디비처리
	@PostMapping(value = "/remove")
	public String removeContractPOST(ContractVO cvo) throws Exception {
		logger.debug("@@@@@@@@@@@Controller : 수주 삭제POST하기 !!!!!");

		contService.removeContract(cvo.getCont_id());

		return "redirect:/contract/list";
	}
	
	//직원찾기 
	@RequestMapping(value="/empFind", method = RequestMethod.GET)
	public void findEmpGET(PagingVO pvo, Model model, HttpSession session) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 직원찾기 !!!!!");
		
		List<Object> employeeList = null;
		
		//사원 목록을 가져오는 employeeService 호출
		pvo = empService.setPageInfoForEmployee(pvo);
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
		//service객체를 호출
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			employeeList = pageService.getListSearchObjectEmployeeVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			employeeList = pageService.getListPageSizeObjectEmployeeVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : employeeList={}",employeeList);
	
		// 변수에 담아서 전달
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("pvo",pvo);
		// 인사팀 일때 버튼 활성화
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		logger.debug("emp_department 호출", session.getAttribute("emp_department"));
//			return null;
	}
	
	//직원정보 검색 맵핑
	@ResponseBody
	@RequestMapping(value="/empInfo", method = RequestMethod.GET)
	public EmployeeVO getEmpInfo(@RequestParam("emp_id") String emp_id) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 직원정보 가져오기 !!!!!");
		logger.debug("@@@@@@@@@@@Controller : {}", emp_id);

		EmployeeVO vo = empService.getEmployee(emp_id);
		logger.debug("@@@@@@@@@@@Controller : {}", vo);

		return vo;
	}
	
	//거래처 검색창
	@RequestMapping(value="/custFind", method = RequestMethod.GET)
	public void findCustGET(PagingVO pvo, Model model) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 팝업으로 거래처찾기 !!!!!");
		
		List<Object> customerList = null;
		
		pvo = custService.setPageInfoForCustomer(pvo);
		logger.debug("@@@@@@@@@Controller : {}",pvo);
		
		//service객체를 호출
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			//검색어가 있을 때 
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			customerList = pageService.getListSearchObjectCustomerVO(pvo);
		}else {
			//검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			customerList = pageService.getListPageSizeObjectCustomerVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : employeeList={}",customerList);
	
		// 변수에 담아서 전달
		model.addAttribute("customerList", customerList);
		model.addAttribute("pvo",pvo);
	}
	
	//거래처클릭 자동완성 
	@ResponseBody
	@RequestMapping(value="/custInfo", method = RequestMethod.GET)
	public CustomerVO getCustInfo(@RequestParam("cust_id") String cust_id) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 거래처정보 가져오기 !!!!!");
		logger.debug("@@@@@@@@@@@Controller : {}", cust_id);

		CustomerVO vo = custService.getCustomerInfo(cust_id);
		logger.debug("@@@@@@@@@@@Controller : {}", vo);

		return vo;
	}
	
	//상품명 자동완성 팝업창
	@RequestMapping(value="/productFind", method = RequestMethod.GET)
	public void findProductGET(PagingVO pvo, Model model) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 팝업으로 상품명찾기 !!!!!");

		List<ProductionVO> productionList = proService.getProductionList();
        model.addAttribute("productionList", productionList);
	}
	
	//상품명 자동완성 
	@ResponseBody
	@RequestMapping(value="/productInfo", method = RequestMethod.GET)
	public ProductionVO getProductInfo(@RequestParam("product_id") String product_id) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 거래처정보 가져오기 !!!!!");
		logger.debug("@@@@@@@@@@@Controller : {}", product_id);

		ProductionVO vo = contService.getProductInfo(product_id);
		logger.debug("@@@@@@@@@@@Controller : {}", vo);

		return vo;
	}
}
