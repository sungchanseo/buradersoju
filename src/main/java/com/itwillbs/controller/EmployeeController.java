package com.itwillbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.EmployeeService;
import com.itwillbs.service.PagingService;

import net.coobird.thumbnailator.Thumbnails;

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
	
	// http://15.165.34.161:8080/main
	
	// http://localhost:8088/employee/insert
	// 회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertPOST(EmployeeVO vo, MultipartHttpServletRequest multi, RedirectAttributes rttr) throws Exception {
		logger.debug("insertPOST() 호출!");
		logger.debug("controller : {} ", vo);
		
		// 사번 생성
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
        
        // 이미지 업로드
		// 인코딩
		multi.setCharacterEncoding("UTF-8");
		// 전달된 정보 저장
		logger.debug(multi+"");

		// 다중 파일정보 저장 (Map) 
		//  1. 파라메터 저장 2. 파일정보 저장 
		Map map = new HashMap();
		// 전달하는 파라메터정보를 저장
		Enumeration enu = multi.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multi.getParameter(name);
			//logger.debug("name : "+name+", value : "+value);
			map.put(name, value);
		}
		logger.debug(" 전달된 파라메터 정보(이름,값) 저장완료(파일정보 제외)");
		logger.debug("map :"+map);
		
		// 파일정보(파라메터)+파일업로드 처리
		List fileList = fileProcess(multi, vo);
		map.put("fileList", fileList);

		logger.debug("map :	"+map);
		
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "CREATEOK");		
        
		// 사원원등록을 위한 Service 메서드 호출
		eService.insertEmployee(vo);
		
		return "redirect:/employee/list";
	}
	
	public List<String> fileProcess(MultipartHttpServletRequest multi, EmployeeVO vo) throws Exception {
	    logger.debug("파일정보 저장 + 파일업로드");

	    // 파일의 정보(파라메터)를 저장할 리스트
	    List<String> fileList = new ArrayList<String>();

	    Iterator<String> fileNames = multi.getFileNames();
	    while (fileNames.hasNext()) {
	        // 파일의 정보를 전달하는 input 태그 이름(파라메터명)
	        String fileName = fileNames.next();
	        logger.debug("fileName(파라메터명): " + fileName);

	        MultipartFile mFile = multi.getFile(fileName);
	        String oFileName = mFile.getOriginalFilename();
	        logger.debug("fileName(파일명): " + oFileName);

	        // 파일명을 리스트에 저장
	        fileList.add(oFileName);

	        // 2) 파일업로드
	        File file = new File("C:\\upload\\employee" + "\\" + fileName);

	        if (mFile.getSize() != 0) {
	            // 폼태그업로드 파일의 정보가 있을때
	            if (!file.exists()) {
	                // 업로드 폴더에 파일이 없을때
	                if (file.getParentFile().mkdirs()) {
	                    file.createNewFile();
	                }
	            }
	            // 업로드에 필요한 임시 파일정보를 실제 업로드 위치로 이동
	            mFile.transferTo(new File("C:\\upload\\employee" + "\\" + oFileName));
	        }//mFile.getSize()
	    }//while

	    // 파일명을 NoticeVO에 저장
	    if (!fileList.isEmpty()) {
	        String fileString = String.join("/", fileList);
	        vo.setEmp_image(fileString);
	    }

	    logger.debug("파일정보 저장,파일업로드 완료");
	    
	    // 파일명 리스트 반환
	    return fileList;
	}
	
	@RequestMapping(value = "/imgDown", method = RequestMethod.GET)
	public void imgDownloadGET(@RequestParam("fileName") String fileName, 
			HttpServletResponse response) throws Exception {
		logger.debug(" imgDownloadGET() 호출 ");
		
		// 전달정보 저장
		logger.debug(" fileName : " + fileName);
		
		// 업로드 폴더에서 다운로드 파일의 정보를 가져오기
		File downFile = new File("C:\\upload\\employee" + "\\" + fileName);
		
		// 응답정보를 통한 출력스트림 객체 준비
		OutputStream out = response.getOutputStream();
		
		// 이미지 파일의 경우는 원본파일(고화질) 직접 표시(비효율적인 처리)
		// -> 썸네일 구현
		
		String imgName = fileName.substring(0, fileName.lastIndexOf("."));
		File thumbnail = new File("C:\\upload\\thumbnail" + "\\" +".png");
		
		if(downFile.exists()) {
			thumbnail.getParentFile().mkdirs();
			// 썸네일 파일 생성
			Thumbnails.of(downFile).size(250, 300).outputFormat("png").toFile(thumbnail);
			
			// 썸네일 정보 바로 출력
			Thumbnails.of(downFile).size(250, 300).outputFormat("png").toOutputStream(out);
		}
		
		// 모든파일의 형태가 다운로드창으로 수행
		
		// 전달되는 파일명이 한글일때 -> 인코딩처리
		fileName = URLEncoder.encode(fileName, "UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("content-disposition", "attachment; fileName=" + fileName);
		
		// 파일 다운로드(전송)
		FileInputStream fis = new FileInputStream(downFile);
		
		byte[] buffer = new byte[1024*8];
		
		int data = 0;
		while((data = fis.read(buffer)) != -1) {
			// => 파일의 끝(-1) 까지 반복
			out.write(buffer, 0, data);
		}
		
		out.flush(); // 버퍼의 빈공간을 채우기
		
		out.close();
		fis.close();
		logger.debug(" 파일 다운로드 완료! ");
		
	} // fileDownloadGET
	
	// http://localhost:8088/employee/list
	// 사원리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listGET(Model model, PagingVO pvo, HttpSession session) throws Exception{
		logger.debug(" listGET() 호출! ");
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
	public String modifyPOST(EmployeeVO uvo, MultipartHttpServletRequest multi, RedirectAttributes rttr) throws Exception {
		logger.debug(" modifyPOST() 호출 ");
		// 한글처리 => 인코딩 필터 처리
		// 전달정보 저장(수정데이터)
		logger.debug(" 파라메터 자동수집!!");
		logger.debug("uvo :" + uvo);
		
        // 이미지 업로드
		// 인코딩
		multi.setCharacterEncoding("UTF-8");
		// 전달된 정보 저장
		logger.debug(multi+"");

		// 다중 파일정보 저장 (Map) 
		//  1. 파라메터 저장 2. 파일정보 저장 
		Map map = new HashMap();
		// 전달하는 파라메터정보를 저장
		Enumeration enu = multi.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multi.getParameter(name);
			//logger.debug("name : "+name+", value : "+value);
			map.put(name, value);
		}
		logger.debug(" 전달된 파라메터 정보(이름,값) 저장완료(파일정보 제외)");
		logger.debug("map :"+map);
		
		// 파일정보(파라메터)+파일업로드 처리
		List fileList = fileProcess(multi, uvo);
		map.put("fileList", fileList);

		logger.debug("map :	"+map);
		
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "CREATEOK");
		
		eService.modifiyEmployee(uvo);
		
		return "redirect:/employee/list";
	}
	
}
