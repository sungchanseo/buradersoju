package com.itwillbs.persistence;

import com.itwillbs.domain.ContractVO;

public interface ContractDAO {
	
	//수주 상세보기 
	public ContractVO readContractInfo(String cont_id) throws Exception;
	
	//수주 등록하기 
	public void insertContract(ContractVO cvo) throws Exception;
	
	//수주등록 번호 자동 카운트
	public String getLastGeneratedNumber() throws Exception;
	
	//수주 수정하기 
	public Integer updateContract(ContractVO cvo) throws Exception;
	
	//수주 삭제하기 
	public Integer deleteContract(String cont_id) throws Exception;
	
	//cont_id 를 out_product 테이블에 넣기 
	public void contIdInsert(String cont_id) throws Exception;
}
