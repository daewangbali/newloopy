package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.mapper.BookMapper;
import kr.co.mapper.CartMapper;
import kr.co.mapper.UserMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTest {

	@Autowired
	CartMapper cartMapper;
	
	@Test
	public void getListTest(){
		log.info("getListTest............");
		List<CartVO> vo = cartMapper.getList();
		
		for(CartVO cartVO : vo) {
			log.info(cartVO);
		}

	}
	
	@Test
	public void insertTest() {
		log.info("insertTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(1);
		cvo.setUser_number(1);
		cvo.setAmount(1);
		log.info(cvo);
		cartMapper.insert(cvo);
	}
	
	@Test
	public void selectTest() {
		log.info("selectTest..............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(1);
		cvo.setUser_number(1);
		log.info(cvo);
		
		log.info(cartMapper.select(cvo));
	}
	
	@Test
	public void updateTest() {
		log.info("updateTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(18);
		cvo.setUser_number(41);
		cvo.setAmount(3);
		
		log.info(cvo);
		log.info(cartMapper.update(cvo));		
	}
	
	@Test
	public void addupdateTest() {
		log.info("addupdateTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(18);
		cvo.setUser_number(41);
		cvo.setAmount(2);
		
		log.info(cvo);
		log.info(cartMapper.addupdate(cvo));
	}
	
	@Test
	public void readCartListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<CartVO> list = cartMapper.getCartList(cartvo.getUser_number());

		for (CartVO cartVO : list) {
			log.info(cartVO);
		}
	}
	
	@Test
	public void readBookListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<BookVO> list = cartMapper.getBookList(cartvo.getUser_number());

		for (BookVO bookVO : list) {
			log.info(bookVO);
		}
	}
	
	@Test
	public void deleteTest() {
		log.info("deleteTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(15);
		
		log.info(cvo);
		log.info(cartMapper.delete(cvo.getBook_id()));
	}
	
	@Test
	public void cartAmountUpdateTest() {
		log.info("cartAmountUpdateTest...............");
		CartVO cvo = new CartVO();
		cvo.setBook_id(5);
		
		cvo.setUser_number(41);
		cvo.setAmount(5);
		log.info(cvo);
		log.info(cartMapper.amountUpdate(cvo));
	}
}
	
