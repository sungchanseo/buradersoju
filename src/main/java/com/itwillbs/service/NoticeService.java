package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.NoticeVO;

public interface NoticeService {
	// Board에서 수행하는 동작 선언
	
		// 글쓰기 - Create
		public void insertBoard(NoticeVO vo) throws Exception;
		
		// 글 목록 조회 - Read
		public List<NoticeVO> getListAll() throws Exception;
		
		// 글 조회수 1증가 - Update
		public void upViewcnt(Integer notice_id) throws Exception;
		
		// 특정 글정보 조회 - Read
		public NoticeVO getBoard(Integer notice_id) throws Exception;
		
		// 공지 수정
		public Integer boardModify(NoticeVO nvo)throws Exception;
		
		// 공지 삭제
		public Integer boardDelete(Integer notice_id) throws Exception;
}
