package com.itwillbs.persistence;

import com.itwillbs.domain.ContractVO;

public interface ContractDAO {
	
	//수주 상세보기 
	public ContractVO readContractInfo(String cont_id) throws Exception;
	
	//수주 등록하기 
	public void insertContract(ContractVO cvo) throws Exception;
	
	//수주 수정하기 
	public Integer updateContract(ContractVO cvo) throws Exception;
	
	//수주 삭제하기 
	public Integer deleteContract(String cont_id) throws Exception;
}
