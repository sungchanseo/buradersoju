package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.ProductionVO;

@Repository
public class ContractDAOImpl implements ContractDAO {
	
	//로그출력을 위한 로거객체 생성
	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);
	
	//sql문 사용을 위한 세숀 주입
	@Autowired
	private SqlSession sqlSession;
	
	//mapper연결을 위한 NAMESPACE 리터럴 선언
	private static final String NAMESPACE = "com.itwillbs.mappers.contractMapper";
	
	//수주 상세보기
	@Override
	public ContractVO readContractInfo(String cont_id) throws Exception{
		logger.debug("##########ContractDAO : readContractInfo 메소드 호출!");
		return sqlSession.selectOne(NAMESPACE+".readContractInfo", cont_id);
	}
	
	//수주 등록하기
	@Override
	public void insertContract(ContractVO cvo) throws Exception{
		logger.debug("##########ContractDAO : insertContract 메소드 호출!");
		sqlSession.insert(NAMESPACE+".insertContract", cvo);
	}
	
	//수주등록 번호 자동 카운트
	@Override
	public String getLastGeneratedNumber() throws Exception {
		logger.debug("##########ContractDAO : getLastGeneratedNumber 메소드 호출!");
		return sqlSession.selectOne(NAMESPACE+".getLastGeneratedNumber");
	}

	//수주 수정하기
	@Override
	public Integer updateContract(ContractVO cvo) throws Exception{
		logger.debug("##########ContractDAO : updateContract 메소드 호출!");
		return sqlSession.update(NAMESPACE+".updateContract", cvo);
	}

	//수주 삭제하기
	@Override
	public Integer deleteContract(String cont_id) throws Exception{
		logger.debug("##########ContractDAO : deleteContract 메소드 호출!");
		return sqlSession.update(NAMESPACE+".deleteContract", cont_id);
	}


	//cont_id 를 out_product 테이블에 넣기 
	@Override
	public void contIdInsert(String cont_id) throws Exception {
		logger.debug("##########ContractDAO : contIdInsert 메소드 호출!");
		sqlSession.insert(NAMESPACE+".contIdInsert", cont_id);
	}

	
	//product_id로 상품정보 조회하기 
	@Override
	public ProductionVO readProductInfo(String product_id) throws Exception {
		logger.debug("##########ContractDAO : readProductInfo 메소드 호출!");
		return sqlSession.selectOne(NAMESPACE+".getProductInfo", product_id);
	}

	//상품목록 가져오기
	@Override
	public List<ProductionVO> getProductList() throws Exception {
		logger.debug("##########ContractDAO : getProductList 메소드 호출!");
		return sqlSession.selectList(NAMESPACE+".getProductList");
	}

	

}
