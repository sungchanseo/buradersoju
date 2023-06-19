package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.NoticeVO;

public interface NoticeDAO {
	// Board관련된 DB동작 선언/호출
	
	// 글쓰기 - C
	public void createBoard(NoticeVO vo) throws Exception;
	
	// 글 목록 조회 - R
	public List<NoticeVO> readBoardListAll() throws Exception;
	
	// 글 조회수 1증가  - U
	public void updateViewcnt(Integer notice_id) throws Exception;
	
	// 특정 글정보 조회 - R
	public NoticeVO readBoard(Integer notice_id) throws Exception;
	
	//  U - 공지 수정
	public Integer updateBoard(NoticeVO nvo);
	
	//  D - 공지 삭제
	public Integer deleteBoard(Integer notice_id);
}
