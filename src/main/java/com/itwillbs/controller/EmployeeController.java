package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.EmployeeService;
import com.itwillbs.service.PagingService;

@Controller
@RequestMapping(value = "/employee/*")
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	// 서비스정보 필요 
	@Inject
	private EmployeeService eService;
	@Inject
	private PagingService pageService;
	
	// http://localhost:8088/employee/insert
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET() throws Exception {
	    logger.debug("C: 회원가입 입력페이지 GET");

//	    return "/employee/insert";
	}
	
	// http://localhost:8088/employee/insert
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertPOST(EmployeeVO vo, @RequestParam("address") String address) throws Exception {
		logger.debug("insertPOST() 호출!");
		logger.debug("controller : {} ", vo);
		
		// 주소 하나로 만들기
		vo.setEmp_address(address+" "+vo.getEmp_address());

        // 현재 연도 가져오기
        LocalDateTime now = LocalDateTime.now();
        String year = String.valueOf(now.getYear());

        // 다음 번호 가져오기
        int nextNumber = eService.getNextNumber();
        
        // 현재 연도와 다음 번호의 년도 비교
        String lastGeneratedNumber = eService.getLastGeneratedNumber();
        String lastYear = lastGeneratedNumber.substring(0, 4);
        
        if (!year.equals(lastYear)) {
            // 년도가 변경된 경우
            nextNumber = 1; // 다음 번호를 1로 초기화
        }

        // 3자리 번호로 포맷팅
        String threeDigitNumber = String.format("%03d", nextNumber);

        // 현재 연도 숫자와 3자리 번호 조합하여 할당
        String generatedNumber = year + threeDigitNumber;
        vo.setEmp_id(generatedNumber);
        
		// 사원원등록을 위한 Service 메서드 호출
		eService.insertEmployee(vo);
		
		return "redirect:/employee/list";
	}
	
	// http://localhost:8088/employee/list
	// 사원리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listGET(Model model, PagingVO pvo, HttpSession session) throws Exception{
//		logger.debug(" listGET() 호출! ");
//		
//		List<EmployeeVO> employeeList = eService.getEmployeeList();
//		
//		model.addAttribute("employeeList", employeeList);
		
		// 로그인 세션
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
		
		List<Object> employeeList = null;
		
		//사원 목록을 가져오는 employeeService 호출
		pvo = eService.setPageInfoForEmployee(pvo);
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
		return null;
	}
	
	// http://localhost:8088/employee/info
	// 사원 정보 조회
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void infoGET(EmployeeVO vo, Model model, HttpSession session) {
		logger.debug(" infoGET() 호출 ");
		
		// 회원정보 가져오기 - 아이디정보(세션) 디비에 있는 회원정보 모두 조회
		// 서비스 -> DAO 
		
		logger.debug("@@@@@id :"+ vo.getEmp_id());
		
		EmployeeVO resultVO = eService.getEmployee(vo.getEmp_id());
		
		logger.debug("@@@@@@ resultVO : " + resultVO);
		// 연결된 뷰페이지에 전달 => Model 객체
		model.addAttribute("resultVO", resultVO);
		//model.addAttribute(resultVO);
		
		// 인사팀 일때 버튼 활성화 
		model.addAttribute("emp_department", session.getAttribute("emp_department"));

		// 페이지 이동
		logger.debug(" /employee/info.jsp 페이지로 이동 ");
	}
	
	
	// http://localhost:8088/employee/modify
	// 사원 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(String emp_id, Model model) {
		logger.debug(" modifyGET() 호출! ");
		logger.debug(" emp_id " + emp_id);
		EmployeeVO resultVO = eService.getEmployee(emp_id);
		logger.debug(" @@@@@uvo : " + resultVO);
		model.addAttribute("resultVO", resultVO);
	}
	
	// http://localhost:8088/employee/modify
	// 사원 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(EmployeeVO uvo) {
		logger.debug(" modifyPOST() 호출 ");
		// 한글처리 => 인코딩 필터 처리
		// 전달정보 저장(수정데이터)
		logger.debug(" 파라메터 자동수집!!");
		logger.debug("uvo :" + uvo);
		
		eService.modifiyEmployee(uvo);
		return "redirect:/employee/list";
		
	}
	
}
