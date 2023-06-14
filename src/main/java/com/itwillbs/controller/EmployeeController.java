package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.service.EmployeeService;

@Controller
@RequestMapping(value = "/employee/*")
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	// 서비스정보 필요 
	@Inject
	private EmployeeService eService;
	
	// http://localhost:8088/employee/insert
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		logger.debug("C: 회원가입 입력페이지 GET");
		return "/employee/insert";
	}
	
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(EmployeeVO vo) throws Exception {
		logger.debug("insertPOST() 호출!");
		
		// 서비스-회원가입 메서드
		//   => DAO - 회원가입메서드 호출
		eService.insertEmployee(vo);
		
		return "redirect:/member/login";
	}
	
	// http://localhost:8088/employee/list
	// 사원리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.debug(" listGET() 호출! ");
		
		List<EmployeeVO> employeeList = eService.getEmployeeList();
		
		model.addAttribute("employeeList", employeeList);
	}
	
	// http://localhost:8088/employee/info
	// 사원 정보 조회
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void infoGET(EmployeeVO vo, Model model) {
		logger.debug(" infoGET() 호출 ");
		
		// 회원정보 가져오기 - 아이디정보(세션) 디비에 있는 회원정보 모두 조회
		// 서비스 -> DAO 
		
		logger.debug("@@@@@id :"+ vo.getEmp_id());
		
		EmployeeVO resultVO = eService.getEmployee(vo.getEmp_id());
		
		logger.debug("@@@@@@ resultVO : " + resultVO);
		// 연결된 뷰페이지에 전달 => Model 객체
		model.addAttribute("resultVO", resultVO);
		//model.addAttribute(resultVO);

		// 페이지 이동
		logger.debug(" /employee/info.jsp 페이지로 이동 ");
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
		
		// 서비스 -> 회원정보 수정가능한 기능
		int empResult = eService.employeeModify(uvo);
		
		int emp_id = uvo.getEmp_id();
		
		logger.debug("@@@emp_id : " + emp_id);
		
		logger.debug("empResult : " + empResult);
		
		// 페이지 이동
		if(empResult == 1) {
			// 수정 성공
			return "redirect:/employee/info?emp_id="+emp_id;
		}else {
			// 수정 실패
			return "redirect:/employee/modify?emp_id="+emp_id;
		}
		
	}
	
	
	
	
	
}
