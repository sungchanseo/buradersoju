package com.itwillbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.NoticeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.PagingService;

import net.coobird.thumbnailator.Thumbnails;

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
	public String registPOST(NoticeVO vo,RedirectAttributes rttr,MultipartHttpServletRequest multi) throws Exception{
		logger.debug("파일 업로드도 포함된 insertPOST() 호출 ");
		// 한글처리(필터) + 페이지 전달된 데이터(파라메터) 저장
		logger.debug("vo : {}",vo); //err 레벨에서 사용권장
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
		
		// 서비스 - 글쓰기 동작 호출
		service.insertBoard(vo);
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "CREATEOK");

		return "redirect:/notice/list";
	}
	
	public List<String> fileProcess(MultipartHttpServletRequest multi, NoticeVO vo) throws Exception {
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
	        File file = new File("C:\\upload\\\\notice" + "\\" + fileName);

	        if (mFile.getSize() != 0) {
	            // 폼태그업로드 파일의 정보가 있을때
	            if (!file.exists()) {
	                // 업로드 폴더에 파일이 없을때
	                if (file.getParentFile().mkdirs()) {
	                    file.createNewFile();
	                }
	            }
	            // 업로드에 필요한 임시 파일정보를 실제 업로드 위치로 이동
	            mFile.transferTo(new File("C:\\upload\\notice" + "\\" + oFileName));
	        }//mFile.getSize()
	    }//while

	    // 파일명을 NoticeVO에 저장
	    if (!fileList.isEmpty()) {
	        String fileString = String.join("/", fileList);
	        vo.setNotice_file(fileString);
	    }

	    logger.debug("파일정보 저장,파일업로드 완료");
	    
	    // 파일명 리스트 반환
	    return fileList;
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
		model.addAttribute("vo", service.getBoard(notice_id));

	}
	
	// /fileDown?fileName=파일명
	@RequestMapping(value = "/fileDown",method = RequestMethod.GET)
	public void fileDownloadGET(@RequestParam("fileName") String fileName,
			HttpServletResponse response)throws Exception{

		logger.debug(" fileDownloadGET() 호출 ");

		// 전달정보 저장
		logger.debug(" fileName : "+fileName);

		// 응답정보를 통한 출력스트림 객체 준비
		OutputStream out = response.getOutputStream();

		// 업로드 폴더에서 다운로드 파일의 정보를 가져오기
		File downFile = new File("C:\\upload\\notice"+"\\"+fileName);

		// 모든파일의 형태가 다운로드창으로 수행
		// 전달되는 파일명이 한글일때 -> 인코딩처리 
		fileName = URLEncoder.encode(fileName,"UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);

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

	}//fileDownloadGET
	
	// /imgDown?fileName=파일명
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
	
	// http://localhost:8088/notice/modify?bno=6
	// 글 정보 수정(GET)
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void updateBoardGET(Model model, @RequestParam("notice_id") int notice_id ) throws Exception{
		logger.debug(" updateBoardGET() 호출 ");
		// 전달정보 저장(bno)
		logger.debug(" notice_id : "+notice_id);

		// Model 저장해서 연결된 뷰페이지로 전달
		model.addAttribute("vo", service.getBoard(notice_id) ); 
		//  /notice/modifiy.jsp (read.jsp 참조)
	}

	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String updateBoardPOST(NoticeVO nvo, MultipartHttpServletRequest multi) throws Exception {
		logger.debug(" modifyPOST() 호출 ! ");
		logger.debug("vo " + nvo);
		
		// 한글처리(필터) + 페이지 전달된 데이터(파라메터) 저장
		logger.debug("vo : {}",nvo); //err 레벨에서 사용권장
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
		List fileList = fileProcess(multi, nvo);
		map.put("fileList", fileList);

		logger.debug("map :	"+map);

		
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