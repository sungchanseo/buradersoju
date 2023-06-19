package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.NoticeVO;
import com.itwillbs.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	// DAO 객체 필요 => 객체 주입
		@Autowired
		private NoticeDAO ndao;
		
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

		
		
}
