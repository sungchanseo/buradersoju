package com.itwillbs.controller;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.service.MaterialService;



@Controller
@RequestMapping(value = "/purchasing/material/*")
public class MaterialController {

	
	
	// http://localhost:8088/purchasing/material/list
	
	
	
	// 1. 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);
	
	
	
	// 2. 객체 주입 (DI)
	@Inject
	private MaterialService mService;
	
	
	
	// 3. 메서드 정의
	// 3-1. 자재 목록 보기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void materialListGET(Model model) {
		logger.debug("@@@@@ 컨트롤러 @@@@@ materialListGET_호출");
		
		// serivce 객체 호출 
		List<MaterialVO> materialList = mService.getMaterialList();
		
		// View 페이지 정보 전달
		model.addAttribute("materialList", materialList);
	}
	
	
	// 3-2. 자재 등록 (입력) 
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertMaterialGET() {
		logger.debug("@@@@@ 컨트롤러 @@@@@ insertMaterialGET_호출");
		logger.debug("insert.jsp 뷰페이지 이동");
		return "/purchasing/material/insert";
	}
	
	// 3-2. 자재 등록 (데이터처리)
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertMaterialPOST(MaterialVO vo) {
		logger.debug("@@@@@ 컨트롤러 @@@@@ insertMaterialPOST_호출");
		
		// 파라미터 자동수집 -> 전달 정보 저장
//		logger.debug(vo + "");
		
		// 서비스 -> DAO 자재등록 메서드 호출
		mService.insertMaterial(vo);
		
		// 페이지 이동
		return "redirect:/purchasing/material/list";
	}
	
	
	// 3-3. 자재 수정 (조회)
	@RequestMapping(value="", method=RequestMethod.GET)
	public void modifyMaterialGET(MaterialVO vo) {
		logger.debug("@@@@@ 컨트롤러 @@@@@ modifyMaterialGET_호출");
		
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
