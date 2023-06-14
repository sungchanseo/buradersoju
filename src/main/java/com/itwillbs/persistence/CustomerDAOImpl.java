package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerVO;
import com.itwillbs.domain.PagingVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAOImpl.class);
	
	//DB연결을 위한 xml객체 주입(의존성주입)
	@Inject
	private SqlSession sqlSession;

	//mapper식별을 위한 namespace
	private static final String NAMESPACE = "com.itwillbs.mappers.customerMapper";
	
	//거래처 목록보기 
	@Override
	public int getCustomerList() {
		logger.debug("#########DAO : 거래처 목록 갯수조회  합니다. ");
		return sqlSession.selectOne(NAMESPACE+".getCustomerList");
	}
	//거래처 목록 페이징처리 
	@Override
	public List<CustomerVO> getCustomerList(PagingVO pvo) {
		logger.debug("########DAO : 거래처 목록 페이징처리 출력합니다");
		
		return sqlSession.selectList(NAMESPACE+".getCustomerListPaging", pvo);
	}

	//거래처 상세보기 
	@Override
	public CustomerVO getCustomerInfo(String cust_id) {
		logger.debug("##########DAO : 거래처를 상세보기합니다!");
		return sqlSession.selectOne(NAMESPACE+".getCustomerInfo", cust_id);
	}
	
	//거래처 등록 
	@Override
	public void insertCustomer(CustomerVO vo) {
		logger.debug("#########DAO : 거래처 생성합니다~~~~");
		sqlSession.insert(NAMESPACE+".insertCustomer", vo);
	}
	
	//거래처 수정
	@Override
	public Integer modifyCustomer(CustomerVO mvo) {
		logger.debug("##########DAO : 거래처 정보 수정합니다~~~~~");
		return sqlSession.update(NAMESPACE+".modifyCustomer", mvo);
	}

	//거래처 삭제 
	//거래처는 삭제되지 않고 cust_status를 1로 변경한다. 
	//기본값은 0이며, 1이 되면 출력하지 않을 뿐 디비에는 남는다. 
	@Override
	public Integer removeCustomer(String cust_id) {
		logger.debug("############DAO : 거래처 정보를 삭제합니다!");
		return sqlSession.update(NAMESPACE+".removeCustomer", cust_id);
	}

}