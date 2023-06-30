package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAOImpl.class);
	
	//DB연결을 위한 xml객체 주입(의존성주입)
	@Inject
	private SqlSession sqlSession;

	//mapper식별을 위한 namespace
	private static final String NAMESPACE = "com.itwillbs.mappers.customerMapper";
	
	//거래처 상세보기 
	@Override
	public CustomerVO getCustomerInfo(String cust_id) throws Exception{
		logger.debug("##########DAO : 거래처를 상세보기합니다!");
		return sqlSession.selectOne(NAMESPACE+".getCustomerInfo", cust_id);
	}
	
	//거래처 등록 
	@Override
	public void insertCustomer(CustomerVO vo) throws Exception {
		logger.debug("#########DAO : 거래처 생성합니다~~~~");
		sqlSession.insert(NAMESPACE+".insertCustomer", vo);
	}
	
	//거래처 수정
	@Override
	public Integer modifyCustomer(CustomerVO mvo) throws Exception {
		logger.debug("##########DAO : 거래처 정보 수정합니다~~~~~");
		return sqlSession.update(NAMESPACE+".modifyCustomer", mvo);
	}

	//거래처 삭제 
	//거래처는 삭제되지 않고 cust_status를 1로 변경한다. 
	//기본값은 0이며, 1이 되면 출력하지 않을 뿐 디비에는 남는다. 
	@Override
	public Integer removeCustomer(String cust_id) throws Exception {
		logger.debug("############DAO : 거래처 정보를 삭제합니다!");
		return sqlSession.update(NAMESPACE+".removeCustomer", cust_id);
	}

	//거래처 사업자번호 중복체크
	@Override
	public Integer regNumCheck(String reg_num) throws Exception {
		logger.debug("############DAO : 사업자번호 중복체크 합니다.");
		logger.debug("############DAO : regNumCheck."+sqlSession.selectOne(NAMESPACE+".regNumCheck", reg_num));
		return sqlSession.selectOne(NAMESPACE+".regNumCheck", reg_num);
	}

	//거래처등록번호 자동카운트를 위해 최신 데이타를 가져오는 메소드
	@Override
	public String getLastGeneratedNumber() throws Exception {
		logger.debug("############DAO : 가장 최신 거래처정보를 가져옵니다.");
		return sqlSession.selectOne(NAMESPACE+".getLastGeneratedNumber");
	}

	
	
	
	

}