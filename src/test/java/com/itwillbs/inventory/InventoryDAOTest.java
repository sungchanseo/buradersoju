package com.itwillbs.inventory;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.MaterialVO;
import com.itwillbs.service.InventoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml"
		)
public class InventoryDAOTest {

	@Inject
	private InventoryService iService;
	
	@Test
	public void 재고수정() throws Exception{
		MaterialVO mvo = new MaterialVO();
		mvo.setMa_name("정하윤");
		mvo.setMa_qty(100);
		mvo.setMa_id("MA002");
		mvo.setWhs_num("에이열");
		mvo.setShelt_position("123");
		System.out.println("mvo : "+mvo);
		iService.modifyInventory(mvo);
		
	}
	
	
	
}
