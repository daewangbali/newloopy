package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderVO;
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
	public void getListTest() {
		log.info("getListTest()................");
		OrderVO order = new OrderVO();
		order.setUser_number(41);
		List<OrderVO> list = os.readList(order.getUser_number());

		for (OrderVO ordervo : list) {
			log.info(ordervo);
		}
	}
	
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
	
	@Test
	public void registerPayByCard() {
		log.info("registerPayByCard Test()................");
		OrderVO order = new OrderVO();
		
		order.setOrder_number(1);
		order.setUser_number(1);
		
		order.setOrder_price(15000);
		
		order.setOrder_name("루피친구");
		order.setOrder_hp1("010");
		order.setOrder_hp2("1111");
		order.setOrder_hp3("5555");
		order.setOrder_zipcode("11100");
		order.setOrder_roadAddress("임방울대로");
		order.setOrder_jibunAddress("운남동");
		order.setOrder_namujiAddress("2층");
		order.setOrder_message("빠른배송");
		order.setPayment_method("카드");
		order.setCard_name("신한카드");
		order.setCard_installment("3개월");
		order.setDelivery_status("주문완료");
		
		os.registerPayByCard(order);
		log.info(order);
	}
	
	@Test
	public void registerPayInCash() {
		log.info("registerPayInCash Test()................");
		OrderVO order = new OrderVO();
		
		order.setOrder_number(1);
		order.setUser_number(1);
		order.setOrder_price(15000);
		
		order.setOrder_name("루피친구");
		order.setOrder_hp1("010");
		order.setOrder_hp2("1111");
		order.setOrder_hp3("5555");
		order.setOrder_zipcode("11100");
		order.setOrder_roadAddress("임방울대로");
		order.setOrder_jibunAddress("운남동");
		order.setOrder_namujiAddress("2층");
		order.setOrder_message("빠른배송");
		order.setDeposit_name("루피");
		order.setPayment_method("계좌이체");
		order.setDelivery_status("주문완료");
		
		os.registerPayInCash(order);
		log.info(order);
	}


}
