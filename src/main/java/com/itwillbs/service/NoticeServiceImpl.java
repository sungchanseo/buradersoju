package com.itwillbs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.NoticeVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	// DAO 객체 필요 => 객체 주입
		@Autowired
		private NoticeDAO ndao;
		@Autowired
		private PagingService pageService;
		
		@Override
		public void insertBoard(NoticeVO vo) throws Exception {
			// DAO - 글정보 저장 기능 호출		
			ndao.createBoard(vo);
		}

		@Override
		public List<NoticeVO> getListAll() throws Exception {
			// DAO-글목록 가져오는 동작
			return ndao.readBoardListAll();
		}

		@Override
		public void upViewcnt(Integer notice_id) throws Exception {
			ndao.updateViewcnt(notice_id);
		}

		@Override
		public NoticeVO getBoard(Integer notice_id) throws Exception {
			return ndao.readBoard(notice_id);
		}

		@Override
		public Integer boardModify(NoticeVO vo) {
			// TODO Auto-generated method stub
			return ndao.updateBoard(vo);
		}

		@Override
		public Integer boardDelete(Integer notice_id) throws Exception {
			return ndao.deleteBoard(notice_id);
		}

		//페이징처리 변수저장을 위한 서비스 구현
		@Override
		public PagingVO setPageInfoForNotice(PagingVO pvo) throws Exception {
			logger.debug("NoticeService : 공지목록 페이징처리를 위한 변수 초기화 실행합니다.");
			
			//notice 서비스에 필요한 변수를 저장. 
			pvo.setTable("notice");
			pvo.setId("notice_id");
			pvo.setPageSize(10);
			pvo.setStartRow(1);
			pvo.setStatus_name("notice_status");
			pvo.setStatus_value("0");
			logger.debug("@@@@@@NoticeService : {}",pvo);
			
			//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
			pvo = pageService.pagingAction(pvo);
			logger.debug("@@@@@@NoticeService : {}",pvo);
			return pvo;
		}
		
}
