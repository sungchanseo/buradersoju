package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.CustomerService;
import com.itwillbs.service.EmployeeService;
import com.itwillbs.service.PagingService;

@Controller
@RequestMapping(value = "/customer/*")
public class CustomerController {

	// 로그기록을 위한 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	// Service 객체 사용을 위한 의존성 주입
	@Inject
	private CustomerService custService;
	@Inject
	private PagingService pageService;
	@Inject
	private EmployeeService empService;

	// http://localhost:8088/test/customer/list
	// http://localhost:8088/customer/list

	// 거래처목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String customerListGET(Model model, PagingVO pvo, 
			HttpServletRequest request, HttpSession session) throws Exception {
		logger.debug("@@@@@@@@@Controller : 거래처 리스트 조회!");
		logger.debug("@@@@@@@@@Controller : {}",pvo);

		
		//로그인 세션이 없을 때 로그인 페이지로 이동한다. 
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
		
		List<Object> customerList=null;
		
		//거래처목록을 가져오는 custService 호출
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
		logger.debug("@@@@@@@@@Controller : customerList={}",customerList);
		logger.debug("@@@@@@@@@Controller : emp_department={}",session.getAttribute("emp_department"));
		//변수에 담아서 전달
		model.addAttribute("customerList", customerList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		model.addAttribute("pvo",pvo);
		
		return null;		
	}

	// 거래처 상세보기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void customerInfoGET(CustomerVO vo, Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 상세보기 !");

		logger.debug(vo.getCust_id() + "");
		// servicer객체 호출
		CustomerVO customerInfo = custService.getCustomerInfo(vo.getCust_id());

		// 변수에 넣어 뷰페이지로 보내기
		model.addAttribute("customerInfo", customerInfo);

	}

	// http://localhost:8088/customer/insert
	// 거래처 등록 입력하기
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertCustomerGET(CustomerVO vo)  throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 등록GET하기!!!!");
	//	return "customer/insert";
	}

	// 거래처 등록 디비처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertCustomerPOST(CustomerVO vo, 
			@RequestParam("address") String address)  throws Exception {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 등록POST하기!!!!");
		logger.debug("@@@@@@@입력된 정보 : " + vo);
		vo.setCust_address(address+", "+vo.getCust_address());
		custService.insertCustomer(vo);

		return "redirect:/customer/list";
	}
	
	//view페이지의 ajax에서 정보를 받아서 다시 되돌려줄려면 @ResponseBody 어노테이숀을 반듯이 적어야 한다. 
	//다만, 콘츄롤러 상단의 @Controller 대신 @RestController 어노테이숀을 추가하면 안 적어도 된다. 
	//거래처 사업자등록번호 ajax맵핑
	@ResponseBody
	@RequestMapping(value="/regCheck")
	public String regNumCheck(@RequestParam("reg_num") String reg_num) throws Exception{
		logger.debug("@@@@@@@@@@@@Controller : 사업자번호 체크 AJAX!!!!");
		logger.debug("@@@@@@@@@@@@Controller : reg_num={}", reg_num);
		
		String result=null;
		int numCheckResult = custService.regNumCheck(reg_num);
		logger.debug("@@@@@@@@@@@@Controller : numCheckResult={}", numCheckResult);
		if (numCheckResult==1) {
			result = "no";
		} else {
			result = "yes";
		}
		logger.debug("@@@@@@@@@@@@Controller : result={}", result);
		return result;
	}
	

	// 거래처 수정 입력하기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyCustomerGET(CustomerVO vo, Model model) throws Exception{
		logger.debug("@@@@@@@@@@Contorller : 거래처 수정 GET하기 !!!");
		CustomerVO customerInfo = custService.getCustomerInfo(vo.getCust_id());

		model.addAttribute(customerInfo);
	}

	// 거래처 수정 디비처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyCustomerPOST(CustomerVO mvo,
			@RequestParam("address") String address) throws Exception {
		logger.debug("@@@@@@@@@@Contorller : 거래처 수정 POST하기 !!!");
		logger.debug("@@@@@@@@@controller : 수정한 거래처정보 : " + mvo);
		mvo.setCust_address(address+", "+mvo.getCust_address());
		
		custService.modifyCustomer(mvo);
		return "redirect:/customer/list";

	}
    
	// 거래처 삭제 디비처리
	
	@ResponseBody
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String removeCustomerPOST(@RequestParam("cust_id") String cust_id) throws Exception {
		logger.debug("@@@@@@@@@@@Controller : 거래처 삭제POST하기 !!!!!");
//		
		String[] arrIdx = cust_id.split(",");
		logger.debug("@@@@@@@@@@@Controller : arrIdx = {}",arrIdx);
		for (int i=0; i<arrIdx.length; i++) {
			custService.removeCustomer(arrIdx[i]);
		}
		
//		custService.removeCustomer(cust_id);

//		return null;
		return "redirect:/customer/list";
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
//		return null;
	}
	@ResponseBody
	@RequestMapping(value="/empInfo", method = RequestMethod.GET)
	public EmployeeVO getEmpInfo(@RequestParam("emp_id") String emp_id) throws Exception{
		logger.debug("@@@@@@@@@@@Controller : 직원정보 가져오기 !!!!!");
		logger.debug("@@@@@@@@@@@Controller : {}", emp_id);

		EmployeeVO vo = empService.getEmployee(emp_id);
		logger.debug("@@@@@@@@@@@Controller : {}", vo);

		return vo;
	}
	
}