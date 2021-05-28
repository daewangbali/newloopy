  
package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
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
		List<CartVO> vo = cs.cartList();
		
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
	
//	@Test
//	public void cartList() {
//		log.info("cartLis...................");
//		List<BookVO> list = 
//	}
	
	@Test
	public void readListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<CartVO> list = cs.readCartList(cartvo.getUser_number());
		log.info(list.size());
		for (CartVO cartVO : list) {
			log.info(cartVO);
		}
	}
	
	@Test
	public void removeTest() {
		log.info("removeTest...............");
		CartVO cvo = new CartVO();
		cvo.setUser_number(81);
		cvo.setBook_id(23);
		
		log.info(cvo);
		log.info(cs.remove(cvo));
	}
	
}

	