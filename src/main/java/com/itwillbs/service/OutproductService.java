package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.OutProductVO;

@Service
public interface OutproductService {

	// 출고목록 보기
	public List<OutProductVO> getOutproductList();
}
