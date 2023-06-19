package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChartVO;

@Repository
public class ChartDAOImpl implements ChartDAO {
	@Autowired
	private SqlSession sqlsession;
	
	//로그출력을 위한 로거 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);
	
	//mapper연결을 위한 NAMESPACE 리터럴 선언
	private static final String NAMESPACE = "com.itwillbs.mappers.chartMapper";

	@Override
	public List<ChartVO> getMainContract() {
		logger.debug("ChartDAO getMainContract() 호출");
		return sqlsession.selectList(NAMESPACE+".mainchart");
	}
	
}