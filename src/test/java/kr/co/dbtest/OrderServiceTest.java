package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.mapper.OrderMapper;
import kr.co.service.OrderService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderServiceTest {
	
	@Autowired
	OrderService os;
	
	@Test
	public void readCartListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<CartVO> list = os.readCartList(cartvo.getUser_number());

		for (CartVO cartVO : list) {
			log.info(cartVO);
		}
	}
	
	@Test
	public void readBookListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<BookVO> list = os.readBookList(cartvo.getUser_number());

		for (BookVO bookVO : list) {
			log.info(bookVO);
		}
	}
	
	@Test
	public void readOneBookTest() {
		log.info("readOneBookTest()................");
		BookVO bookVO = new BookVO();
		;
		log.info(os.readOneBook(1));
		log.info(bookVO);
	}


}
