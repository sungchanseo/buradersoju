package com.itwillbs.service;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;
import com.itwillbs.persistence.ProductionDAO;
import com.itwillbs.persistence.QualityDAO;

@Service
public class QualityServiceImpl implements QualityService {

	private static final Logger logger = LoggerFactory.getLogger(QualityServiceImpl.class);
	
	// DAO 객체 접근
	@Inject
	private QualityDAO qdao;
	@Inject
	private PagingService pageService;
	
	@Override
	public List<ProductionVO> getQualityList() throws Exception{
		return qdao.getQualityList();
	}
	
	@Override
	public PagingVO setPageInfoForQuality(PagingVO pvo) throws Exception{
		logger.debug("@@@@@@QualityService : setPageInfoForQuality호출!");
		
		//quality서비스에 필요한 변수를 저장. 
		pvo.setTable("production a, product b, qc q, defective d, employee e");
		pvo.setId("q.qc_num");
		pvo.setPageSize(10);
		pvo.setStartRow(1);
		pvo.setStatus_name("a.product_id = b.product_id and a.production_id = q.production_id and q.qc_num = d.qc_num and e.emp_id = q.qc_emp and q.del_qcStatus");
		pvo.setStatus_value("0");
//		pvo.setSelector(selector);
//		pvo.setSearch(search);
		logger.debug("@@@@@@QualityService : {}",pvo);

		//페이지 계산을 위해서 pageingSerivce의 메소드 호출 
		pvo = pageService.pagingAction(pvo);
		logger.debug("@@@@@@QualityService : {}",pvo);
		return pvo;
	}

	@Override
	public ProductionVO getQualityInfo(String qc_num) {
		// TODO Auto-generated method stub
		return qdao.getQualityInfo(qc_num);
	}

	@Override
	public void insertQuality(ProductionVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public ProductionVO getInsertSearch(String production_id) {
		// TODO Auto-generated method stub
		return qdao.getInsertSearch(production_id);
	}


	@Override
	public void qualityInsertDB(ProductionVO vo, List<String> def_codeList, List<String> def_qtyList) throws Exception {
		///////////qc_num 조합하기 시작!///////////
		//먼저 디비 데이터의 가장 최신 자료를 불러온다. 
		String lastId = qdao.getLastGeneratedNumber();
		logger.debug("@@@@@@QualityService : {}", lastId);
		
		// qc_num 접두사
		String prefix = "QC";
		
		// 현재 날짜를 계산한다. 
		LocalDate currentDate = LocalDate.now();
		String datePart = currentDate.toString().replace("-", "").substring(2, 8); // 년월일 6글자
	
		// 1부터 시작하는 카운트를 생성한다. 
		String countPart = String.format("%03d", 1);// 001부터 시작
		logger.debug("@@@@@@QualityService : countPart={}", countPart);

		String result = null;
		if(lastId == null) {
			//수주목록에 아무것도 없을 때
			logger.debug("@@@@@@QualityService : 수주목록이 없읍니다.");

			//접두사+현재날짜+001을 그냥 더한다.
			result = prefix + datePart + countPart;
			logger.debug("@@@@@@QualityService : result={}", result);

		}else {
			//수주목록이 있을 때 
			logger.debug("@@@@@@QualityService : 수주목록이 있읍니다..");

			//가운데 날짜 8자리를 추출한다. 
			String datePartUp = lastId.substring(2,8);
			logger.debug("@@@@@@QualityService : datePartUp={}", datePartUp);

			//데이타베이의 날짜부분과 오늘날짜 추출한 부분이 같으면 카운트에 1을 더한다. 
			if(datePart.equals(datePartUp)) {
				//카운트 부분을 추려낸다. 
				Integer countPartUp = Integer.parseInt(lastId.substring(9,11));
				logger.debug("@@@@@@QualityService : countPartUp={}", countPartUp);

				//날짜부분이 같고 끝번호가 1이상일 때는 1을 더해서 카운트한다.  
				if(countPartUp >= 1) {
					countPartUp +=1;
					countPart = String.format("%03d", countPartUp);
					// 접두사+날짜+카운트를 조합한다.
					result = prefix + datePart + countPart;
					logger.debug("@@@@@@QualityService : result={}", result);
				}
			}
		}
		result = prefix + datePart + countPart;
		logger.debug("@@@@@@QualityService : {}", result);

		vo.setQc_num(result);
		///////////qc_num 조합하기 끝!///////////
		
		qdao.qualityInsertDB(vo, def_codeList, def_qtyList);
		
	}

	@Override
	public Integer updateQuality(ProductionVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ProductionVO> getBottleList() throws Exception {
		// TODO Auto-generated method stub
		return qdao.getBottleList();
	}

	@Override
	public void btInsert(ProductionVO vo) throws Exception{
		qdao.btInsert(vo);
		
	}

	@Override
	public void btUpdate(ProductionVO vo) throws Exception {
		logger.debug("bt_defQty : "+vo.getBt_defQty());
			qdao.btUpdate(vo);
	}



	
	

	
}
