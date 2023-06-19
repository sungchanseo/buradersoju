package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.OutProductVO;
import com.itwillbs.persistence.OutproductDAO;

@Service
public class OutproductServiceImpl implements OutproductService{

	@Inject
	private OutproductDAO pdao;
	
	// 출고목록 보기
	@Override
	public List<OutProductVO> getOutproductList() {

		return pdao.getOutproductList();
	}

	
}
