  
package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.CartVO;
import kr.co.service.CartService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTest {
	
	@Autowired
	CartService cs;
	
	@Test
	public void getListTest(){
		log.info("getListTest............");
		List<CartVO> vo = cs.getList();
		
		for(CartVO cartVO : vo) {
			log.info(cartVO);
		}

	}
	
	@Test
	public void addcartTest() {
		log.info("addcartTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(21);
		cvo.setUser_number(1);
		cvo.setAmount(1);
		log.info(cvo);
		cs.addcart(cvo);
	}
	
	@Test
	public void selectTest() {
		log.info("selectTest..............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(1);
		cvo.setUser_number(1);
		log.info(cvo);
		
		log.info(cs.findcartbook(cvo));
	}
	
	@Test
	public void updateTest() {
		log.info("updateTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(18);
		cvo.setUser_number(41);
		cvo.setAmount(3);
		
		log.info(cvo);
		log.info(cs.modify(cvo));		
	}
	
	@Test
	public void addupdateTest() {
		log.info("addupdateTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(18);
		cvo.setUser_number(41);
		cvo.setAmount(1);
		
		log.info(cvo);
		log.info(cs.addModify(cvo));
	}
	
}

	