package com.itwillbs.service;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;

public interface ContractService {
	
	//페이징처리 변수저장을 위한 serivce생성
	public PagingVO setPageInfoForContract(PagingVO pvo) throws Exception;
	
	// 수주 상세보기
	public ContractVO getContractInfo(String cont_id) throws Exception;

	// 수주 등록하기
	public void registContract(ContractVO cvo) throws Exception;

	// 수주 수정하기
	public Integer modifyContract(ContractVO cvo) throws Exception;

	// 수주 삭제하기
	public Integer removeContract(String cont_id) throws Exception;
}
