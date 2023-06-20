package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ChartVO;

public interface ChartDAO {
	
	//메인 차트
	List<ChartVO> getMainContract();
}
