  
package kr.co.dbtest;

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
	public void addcartTest() {
		log.info("addcartTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(21);
		cvo.setUser_number(1);
		cvo.setAmount(1);
		log.info(cvo);
		cs.addcart(cvo);
	}
}

	