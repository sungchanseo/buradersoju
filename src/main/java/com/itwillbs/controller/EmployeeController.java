package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void insertGET() throws Exception {
	    logger.debug("C: 회원가입 입력페이지 GET");

//	    return "/employee/insert";
	}
	
	// http://localhost:8088/employee/insert
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertPOST(EmployeeVO vo) throws Exception {
		logger.debug("insertPOST() 호출!");
		logger.debug("controller : {} ", vo);

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
