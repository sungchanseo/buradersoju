package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.service.CustomerService;

@Controller
@RequestMapping(value = "/customer/*")
public class CustomerController {

	// 로그기록을 위한 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	// Service 객체 사용을 위한 의존성 주입
	@Inject
	private CustomerService custService;

	// http://localhost:8088/test/customer/list
	// http://localhost:8088/customer/list

	// 거래처목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void customerListGET(Model model, HttpServletRequest request) {
		logger.debug("@@@@@@@@@Controller : 거래처 리스트 조회!");

		//////////////////////////////////////////////////////////
		// 페이징처리1/
		
		//전체 리스트를 먼저 불러온다. 
		int allCount = custService.getCustomerList();
		logger.debug("@@@@@@@@@@@Serivce : 전체 리스트 : " + allCount);
		
		
		//페이징처리를 위한 페이지 사이즈를 설정한다. 
		//페이징 도메인 인스턴스 생성
		PagingVO pvo = new PagingVO();
		int pageSize = pvo.getPageSize();
		int pageBlcok;

		//페이지 번호를 불러온다. 
		//만약 페이지 번호가 없으면 1번으로 고정하고, 있다면 그것을 가져다 쓴다. 
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		
		//현재 페이지, 시작페이지 및 끝페이지를 계산한다. 
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// 페이징처리2/

		// 페이지 번호 계산하기
		int pageCount;
		int pageBlock;
		int startPage;
		int endPage;

		if (allCount != 0) {
			pageCount = allCount / pageSize + (allCount % pageSize == 0 ? 0 : 1);
			pageBlock = 5;

			startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

		}
		
		//만약 cust_status가 1이면 출력하지 않도록 처리한다. 
		
		//////////////////////////////////////////////////////////
		
		
		
		pvo.setPageSize(pageSize);
		pvo.setStartRow(startRow);
		
		logger.debug("@@@@@@@@@@@@@@@페이징PageSize : "+pageSize);
		logger.debug("@@@@@@@@@@@@@@@페이징startRow : "+startRow);
		// serivce 객체 호출
		List<CustomerVO> customerListPaging = custService.getCustomerList(pvo);

		// 변수를 가지고 뷰 페이지로 보내기
		model.addAttribute("customerListPaging", customerListPaging);
	}

	// 거래처 상세보기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void customerInfoGET(CustomerVO vo, Model model) {
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
	public void insertCustomerGET(CustomerVO vo) {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 등록GET하기!!!!");
//		return "customer/insert";
	}

	// 거래처 등록 디비처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertCustomerPOST(CustomerVO vo) {
		logger.debug("@@@@@@@@@@@@Controller : 거래처 등록POST하기!!!!");
		logger.debug("@@@@@@@입력된 정보 : " + vo);

		custService.insertCustomer(vo);

		return "redirect:/customer/list";
	}

	// 거래처 수정 입력하기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyCustomerGET(CustomerVO vo, Model model) {
		logger.debug("@@@@@@@@@@Contorller : 거래처 수정 GET하기 !!!");
		CustomerVO customerInfo = custService.getCustomerInfo(vo.getCust_id());

		model.addAttribute(customerInfo);
	}

	// 거래처 수정 디비처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyCustomerPOST(CustomerVO mvo) {
		logger.debug("@@@@@@@@@@Contorller : 거래처 수정 POST하기 !!!");
		logger.debug("@@@@@@@@@controller : 수정한 거래처정보 : " + mvo);

		custService.modifyCustomer(mvo);
		return "redirect:/customer/list";

	}

	// 거래처 삭제 디비처리
	@GetMapping(value = "/remove")
	public String removeCustomerPOST(CustomerVO vo) {
		logger.debug("@@@@@@@@@@@Controller : 거래처 삭제POST하기 !!!!!");

		String cust_id = vo.getCust_id();

		custService.removeCustomer(cust_id);

		return "redirect:/customer/list";
	}
}