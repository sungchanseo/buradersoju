package com.itwillbs.inventory;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.service.InventoryService;
import com.itwillbs.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml"
		)
public class InventoryDAOTest {

//	@Inject
//	private InventoryService iService;
    @Inject
    private OrderService oService;
    
	private static final Logger logger = LoggerFactory.getLogger(InventoryDAOTest.class);
	
//    @Test
    public void 조회하기() throws Exception{
    	logger.info("***************TEST : 조횝합니다~~~~");
    	logger.info("**************TEST : {}",oService.getOrderList());
    }
    
	@Test
	public void 등록하기() throws Exception{
//		MaterialVO mvo = new MaterialVO();
//		mvo.setMa_name("정하윤");
//		mvo.setMa_qty(100);
//		mvo.setMa_id("MA002");
//		mvo.setWhs_num("에이열");
//		mvo.setShelt_position("123");
//		System.out.println("mvo : "+mvo);
//		iService.modifyInventory(mvo);
		OrderVO vo = new OrderVO();
		vo.setMa_id("ee");
		oService.orderInsert(vo);
	}
	
	
	
}
