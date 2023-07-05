package com.itwillbs.controller;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.MaterialService;
import com.itwillbs.service.PagingService;



@Controller
@RequestMapping(value = "/purchasing/material/*")
public class MaterialController {

	// http://localhost:8088/purchasing/material/list

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);

	// 객체 주입 (DI)
	@Inject
	private MaterialService mService;
	@Inject
	private PagingService pageService;

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1-1. 자재 목록 & 자동넘버링
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String materialListGET(Model model, PagingVO pvo,
								HttpServletRequest request, HttpSession session) throws Exception {
		logger.debug("@@@@@@@@@@ materialListGET_호출");

		// 로그인 세션 제어
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
		
		// 페이징 처리 service 호출
		pvo = mService.setPageInfoForMaterial(pvo);
		
		// 리스트 출력 (페이징처리)
		List<Object> materialList = null;
		if(pvo.getSelector()!=null && pvo.getSelector()!="") {
			// 검색어가 있을 때 
			materialList = pageService.getListSearchObjectMaterialVO(pvo);
		}else {
			// 검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			materialList = pageService.getListPageSizeObjectMaterialVO(pvo);
		}
		
		// 자동넘버링
		String maxNumber = mService.getMaxNumber();
		logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	
		
		// View 페이지 정보 전달
		model.addAttribute("materialList", materialList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		model.addAttribute("emp_name", session.getAttribute("emp_name"));
		model.addAttribute("maxNumber", maxNumber);
		model.addAttribute("pvo", pvo);
		
		return null;
	}

	
	// 2. 자재 등록 - 행추가 & 데이터처리
	@RequestMapping(value="/maid", method=RequestMethod.POST)
	public String getMaIdPOST(MaterialVO vo) throws Exception {
		logger.debug("@@@@@@@@@@ getMaIdPOST() 호출");
		
		// 파라미터 자동 수집 정보 저장하기
		logger.debug("@@@@@@@@@@@@@@ 등록할 데이터 = " + vo);	
		mService.insertMaterial(vo);
		
		// 페이지 이동
		return "redirect:/purchasing/material/list";
	}

	
	// 3-1. 자재 수정 (조회)
	// 기존의 정보 출력 & 수정 정보 입력
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@ResponseBody
	public MaterialVO modifyMaterialGET(Model model, @RequestParam("ma_id") String ma_id) throws Exception {
		logger.debug("@@@@@@@@@@ modifyMaterialGET 호출");
		
		// 기존의 정보 출력
		MaterialVO resultVO = mService.getMaterialInfo(ma_id);
		logger.debug("@@@@@@@@@@ 기존 데이터 : " + resultVO);
		
		return resultVO;
	}
	
	// 3-2. 자재 수정 (데이터처리)
	@RequestMapping(value = "/modify", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyMaterialPOST(@RequestBody MaterialVO mvo) throws Exception {
		logger.debug("@@@@@@@@@@ modifyMaterialPOST_호출");

		// 전달된 정보 저장
		logger.debug("@@@@@@@@@@ 수정된 데이터 : " + mvo);

		// 서비스 객체 사용으로 데이터 처리
		Integer result = mService.modifyMaterial(mvo);
		logger.debug("@@@@@@@@@@ 업데이트 된 행의 수  : " + result);

		return "redirect:/purchasing/material/list";
	}


	// 4. 자재 삭제 (데이터처리)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteMaterialPOST(@RequestParam("ma_id") String ma_id) throws Exception {
		logger.debug("@@@@@@@@@@ deleteMaterialPOST_호출");

		// 삭제하고자하는 품목코드에 해당하는 데이터 삭제
		int result = mService.deleteMaterial(ma_id);
		logger.debug("@@@@@@@@@@ 삭제 된 행의 수 : " + result);
	}

	
	
	
	
	
	

}
