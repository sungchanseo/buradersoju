package com.itwillbs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ChartVO;
import com.itwillbs.persistence.ChartDAO;

@Service
public class ChartServiceImpl implements ChartService{
	
	private static Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);
	
	@Autowired
	private ChartDAO cdao;
	
	@Override
	public List<ChartVO> mainContractChart() throws Exception {
		logger.debug("S : 메인 차트 mainContractChart() 호출");
		logger.debug("S : 수주왕 차트리스트=" + cdao.getMainContract());
		
		return cdao.getMainContract();
	}
	
	
}
