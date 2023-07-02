package com.itwillbs.service;
import java.util.List;
import org.springframework.stereotype.Service;
import com.itwillbs.domain.OutProductVO;



@Service
public interface OutProductService {

	// 1. 출고 리스트
	public List<OutProductVO> getOutProductList() throws Exception;
	
	
	
	
	
	
	
}
