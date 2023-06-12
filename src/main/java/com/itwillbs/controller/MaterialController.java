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
		logger.debug("@@@@@Controller@@@@@ materialListGET_호출");
		
		// serivce 객체 호출 
		List<MaterialVO> materialList = mService.getMaterialList();
		
		// View 페이지 정보 전달
		model.addAttribute("materialList", materialList);
	}
	
	
}
