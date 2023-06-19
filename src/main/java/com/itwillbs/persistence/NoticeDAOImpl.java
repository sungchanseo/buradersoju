package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	// 디비연결정보,mapper접근 => SqlSession 객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger 
    = LoggerFactory.getLogger(NoticeDAOImpl.class);
	
	// mapper의 namespace 정보
	private static final String NAMESPACE
					="com.itwillbs.mappers.noticeMapper";
	
	@Override
	public void createBoard(NoticeVO vo) throws Exception {
		logger.debug(" sqlSession 객체-Mybatis-mapper 접근-DB접근 ");
		int result = sqlSession.insert(NAMESPACE + ".create", vo);
		
		if(result != 0)
			logger.debug("글쓰기 완료!");
	}
	
	@Override
	public List<NoticeVO> readBoardListAll() throws Exception {
		logger.debug(" readBoardListAll() 호출 ");
		
		return sqlSession.selectList(NAMESPACE +".listAll");
	}

	@Override
	public void updateViewcnt(Integer notice_id) throws Exception {
		logger.debug(" updateViewcnt(Integer notice_id) 호출 ");
		sqlSession.update(NAMESPACE + ".upViewcnt", notice_id);
	}

	@Override
	public NoticeVO readBoard(Integer notice_id) throws Exception {
		logger.debug(" readBoard(Integer bno) 호출 ");
		
		// 정보(+수정) 전달
		//	BoardVO vo = sqlSession.selectOne(NAMESPACE + ".getBoard", bno);
		//  vo.setXXXX(수정가능);
		//	return vo;
		
		// 정보 전달
		return sqlSession.selectOne(NAMESPACE + ".getBoard", notice_id);
	}
	
	@Override
	public Integer updateBoard(NoticeVO nvo) {
		logger.debug(" 공지 수정 수행! ");
		// 수정할 정보를 가져옴(vo)
		logger.debug("DAO -> mapper 호출 -> SQL 실행");
		
		Integer result = sqlSession.update(NAMESPACE + ".update",nvo);
		
		logger.debug(" SQL 실행결과를 리턴 ");
		
		return result;
	}

	@Override
	public Integer deleteBoard(Integer notice_id) {
		logger.debug(" 공지 삭제 수행! ");
		return sqlSession.delete(NAMESPACE + ".delete", notice_id);
	}
}
