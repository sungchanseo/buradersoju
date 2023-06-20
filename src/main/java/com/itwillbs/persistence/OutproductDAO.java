package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OutProductVO;

@Repository
public interface OutproductDAO {
    
	// 출고목록 보기
 	public List<OutProductVO> getOutproductList();
}
