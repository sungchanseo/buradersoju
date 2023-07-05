package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository
public class WorkOrderDAOImpl implements WorkOrderDAO {
	
	// 디비연결정보, mapper접근 => sqlSession 객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderDAOImpl.class);
	
	// mapper의 namespace 정보
	private static final String NAMESPACE = "com.itwillbs.mappers.workOrderMapper";
	
	// 작업지시 목록
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception {
		logger.debug(" getWorkOrderList() 호출 ");
		return sqlSession.selectList(NAMESPACE+".getWorkOrderList");
	}
	
	// 작업지시 등록(수주번호 조회)
	@Override
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception {
		logger.debug(" getWoInsertSearch() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".woInsertSearch", cont_id);
	}

	// 작업지시 등록(자재 재고 조회)
	@Override
	public List<ProductionVO> getMaterialList(String product_id) throws Exception {
		logger.debug(" getMaterialList() 호출 ");
		logger.debug("@@@@DAOImpl에서 product_id : "+product_id);
		return sqlSession.selectList(NAMESPACE+".getMaterialList", product_id);
	}
	
	//수주등록 번호 자동 카운트
	@Override
	public String getLastGeneratedNumber() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getLastGeneratedNumber");
	}
		
	// 작업지시 등록(DB저장)
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		logger.debug(" insertWorkOrder() 호출 ");
		
		int result = sqlSession.insert(NAMESPACE + ".insertWorkOrder", vo);
		
//		if(result == 0) {
//			sqlSession.insert(NAMESPACE + ".insertWorkOrder", vo);
//		}
		if(result != 0) {
		logger.debug(" 작업지시 등록 DB저장 완료 ");
		}
	}
	
	// 작업지시 등록(자재수량 update)
	@Override
	public void maQtyUpdate(@Param("ma_nameList") List<String> ma_nameList, @Param("ma_qtyList") List<String> ma_qtyList) throws Exception {
		logger.debug(" maQtyUpdate()-DAO 호출 ");
		ProductionVO vo = new ProductionVO();
		int result = 0;
		for (int i = 0; i < ma_qtyList.size(); i++) {
//			float ma_qty = Float.parseFloat(ma_qtyList.get(i));
			vo.setMa_qty(Float.parseFloat(ma_qtyList.get(i)));
			vo.setMa_name(ma_nameList.get(i));
			
			result = sqlSession.update(NAMESPACE + ".maQtyUpdate", vo);
		}
		if(result != 0) {
			logger.debug(" 작업지시 등록 DB저장 자재까지 완료 ");
		}
	}
//		Map<String, Object> maList = new HashMap<String, Object>();
//		ArrayList<List<String>> maList = new ArrayList<List<String>>();
		 
//		 maList.put("ma_nameList",ma_nameList);
//		 maList.put("ma_qtyList",ma_qtyList);
//		 maList.put(ma_qtyList);
		 
//		 logger.debug("maList: "+maList);
		 
//		  for (int i = 0; i < ma_nameList.length; i++) {
//		    String[] item = new String[2];
//		    item[0] = ma_nameList[i];
//		    item[1] = ma_qtyList[i];
//		    maList.add(item);
//		  }
		
//		int result = sqlSession.update(NAMESPACE + ".maQtyUpdate", maList);
		
//		if(result != 0) {
//		logger.debug(" 작업지시 등록 DB저장 완료 ");
//		}
//	}
	
	// 작업지시 상세
	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception {
		logger.debug(" detailWorkOrder() 호출 ");
		
		return sqlSession.selectOne(NAMESPACE+".workOrder", production_id);
	}

//	@Override
//	public ProductionVO contSearch(String production_id) {
//		logger.debug(" getWoInsertSearch() 호출 ");
//		return sqlSession.selectOne(NAMESPACE+".woInsertSearch", cont_id);
//	}

	
	
	
	
}
