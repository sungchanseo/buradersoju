package com.itwillbs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.NoticeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.PagingService;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	// 서비스 객체 주입
	@Autowired
	private NoticeService service;
	@Inject
	private PagingService pageService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	// 글쓰기 - /notice/insert  (GET)
	// http://localhost:8088/notice/insert
	@RequestMapping(value = "/insert",method = RequestMethod.GET)
	public void registGET() throws Exception{
		logger.debug(" insertGET() 호출! ");
		logger.debug(" /notice/insert.jsp 페이지 이동 ");
	}

	// 공지 등록 - /notice/insert  (POST)
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String registPOST(NoticeVO vo,RedirectAttributes rttr) throws Exception{
		logger.debug(" insertPOST() 호출 ");
		// 한글처리(필터) + 페이지 전달된 데이터(파라메터) 저장
		logger.debug("vo : {}",vo); //err 레벨에서 사용권장
		
//		String boardUploadPath = "../resources/upload/"; 
//		
//		if(file.isEmpty()) {
//			vo.setNotice_file(null);
//	    } else {
//	        // 현재 시간을 기반으로 한 고유한 파일 이름 생성
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//	        String filename = sdf.format(new Date()) + "_" + file.getOriginalFilename();
//	        FileCopyUtils.copy(file.getBytes(), new File(boardUploadPath, filename));
//	        
//	        vo.setNotice_file(filename);
//	    }
		
		// 서비스 - 글쓰기 동작 호출
		service.insertBoard(vo);
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "CREATEOK");

		return "redirect:/notice/list";
	}

	// 게시판 글 리스트 - http://localhost:8088/notice/list
	@GetMapping(value = "/list")
	public String noticeListGET(PagingVO pvo,HttpSession session,Model model,@ModelAttribute("result") String result) throws Exception{
		logger.debug(" noticeListGET() 호출 ");
		List<Object> noticeList = null;
		
		//로그인 세션이 없을 때 로그인 페이지로 이동한다. 
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/main/login";
		}
		
		// 공지 목록을 가져오는 contService 호출
		pvo = service.setPageInfoForNotice(pvo);
		logger.debug("@@@@@@@@@Controller : {}", pvo);
		
		// service객체를 호출
		if (pvo.getSelector() != null && pvo.getSelector() != "") {
			// 검색어가 있을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 있을 때입니다");
			noticeList = pageService.getListSearchObjectNoticeVO(pvo);
		} else {
			// 검색어가 없을 때
			logger.debug("@@@@@@@@@Controller : 검색어가 없을 때입니다");
			noticeList = pageService.getListPageSizeObjectNoticeVO(pvo);
		}
		logger.debug("@@@@@@@@@Controller : {}", noticeList);

		// 변수에 담아서 전달
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("emp_department", session.getAttribute("emp_department"));
		model.addAttribute("pvo", pvo);

		return null;
	}
	// 게시판 글 리스트 - http://localhost:8088/notice/list
	// 글 내용(본문)보기
	@RequestMapping(value = "/info",method = RequestMethod.GET)
	public void readGET(Model model,
			HttpSession session,
			@RequestParam("notice_id") int notice_id/* ,@ModelAttribute BoardVO vo */) throws Exception{
		// @RequestParam => getParameter() , 1:1 매핑 , 자동으로 타입케스팅(형변환)
		// @ModelAttribute =>  getParameter() + Model, 1:N 매핑
		logger.debug(" infoGET() 호출 ");

		// 전달정보 저장(bno)
		logger.debug(" notice_id : "+notice_id);
		//		logger.debug("vo : "+vo.getBno());

		boolean checkValue = (Boolean)session.getAttribute("checkViewCnt");

		if(checkValue) {
			// 조회수 1증가	 (checkViewCnt 정보가 참일때만)
			// => 서비스 동작 호출 
			service.upViewcnt(notice_id);
			session.setAttribute("checkViewCnt", false);
		}

		// 글정보 조회(특정글)
		// 글정보를 Model 저장 => 연결된 뷰페이지로 전달
		model.addAttribute("vo", service.getBoard(notice_id));
		//model.addAttribute(service.getBoard(bno));
		// => 호출하는 이름 : boardVO
		//     전달하는 key(이름)이 없는 경우
		//     전달된는 객체의 타입의 첫글자를 소문자로 변경해서 이름으로 사용

		// 뷰페이지로 이동	(/board/read.jsp)	
	}

	// http://localhost:8088/notice/modify?bno=6
	// 글 정보 수정(GET)
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void updateBoardGET(Model model, @RequestParam("notice_id") int notice_id ) throws Exception{
		logger.debug(" updateBoardGET() 호출 ");
		// 전달정보 저장(bno)
		logger.debug(" notice_id : "+notice_id);

		// 서비스 - 특정 글정보 가져오기
		// Model 저장해서 연결된 뷰페이지로 전달
		model.addAttribute("vo", service.getBoard(notice_id) ); 
		//  /notice/modifiy.jsp (read.jsp 참조)
	}

	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String updateBoardPOST(NoticeVO nvo) throws Exception {
		logger.debug(" modifyPOST() 호출 ! ");
		logger.debug(" 파라메터 자동수집 !! ");
		logger.debug("vo " + nvo);

		int result = service.boardModify(nvo);

		logger.debug("result : 	"+result);
		// 페이지 이동(main)

		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String deleteBoardPOST(@RequestParam("notice_id") int notice_id) throws Exception {
		logger.debug("deleteBoardPOST() 호출");

		int result =  service.boardDelete(notice_id);

		logger.debug("result: " + result);

		// 페이지 이동(main)
		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/mainNoticeList", method = RequestMethod.GET)
	@ResponseBody
	public List<NoticeVO> mainNoticeListGET(HttpSession session) throws Exception {
		logger.debug("mainNoticeListGET() 호출");

		// 서비스 - DB에 저장된 글 정보를 가져오기
		List<NoticeVO> boardList = service.getListAll();
		logger.debug("boardList: " + boardList);

		// 조회수 체크 값
		session.setAttribute("checkViewCnt", true);

		return boardList;
	}

	
}// controller