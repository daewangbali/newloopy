package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;
import kr.co.mapper.OrderMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTest {
	
	@Autowired
	OrderMapper ordermapper;
	
	@Test
	public void getListTest() {
		log.info("getListTest()................");
		OrderVO order = new OrderVO();
		order.setUser_number(41);
		List<OrderVO> list = ordermapper.getList(order.getUser_number());

		for (OrderVO ordervo : list) {
			log.info(ordervo);
		}
	}
	
	@Test
	public void readCartListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<CartVO> list = ordermapper.getCartList(cartvo.getUser_number());

		for (CartVO cartVO : list) {
			log.info(cartVO);
		}
	}
	
	@Test
	public void readBookListTest() {
		log.info("readListTest()................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(41);
		List<BookVO> list = ordermapper.getBookList(cartvo.getUser_number());

		for (BookVO bookVO : list) {
			log.info(bookVO);
		}
	}
	

	@Test
	public void insertPayByCard() {
		log.info("insertPayByCard Test()................");
		OrderVO order = new OrderVO();
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
		
		ordermapper.insertPayByCard(order);
		log.info(order);
	}
	
	@Test
	public void insertPayInCash() {
		log.info("insertPayInCash Test()................");
		OrderVO order = new OrderVO();
		
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
		
		ordermapper.insertPayInCash(order);
		log.info(order);
	}
	
	@Test
	public void findOrderNumberTest() {
		log.info("findOrderNumberTest()................");
		
		int number = ordermapper.findOrderNumber(41);
		log.info(number);
		
	}
	
	@Test
	public void getOrderListTest() {
		log.info("getOrderListTest()................");
		OrderVO order = new OrderVO();
		order.setUser_number(41);
		order.setOrder_number(142);
		List<OrderVO> list = ordermapper.getOrderList(order.getUser_number(), order.getOrder_number());

		for (OrderVO ordervo : list) {
			log.info(ordervo);
		}
	}
	
	@Test
	public void getOrderItemListTest() {
		log.info("getOrderListTest()................");
		OrderItemVO order = new OrderItemVO();
		int user_number = 41;
		
		order.setOrder_number(142);
		List<OrderItemVO> list = ordermapper.getOrderItemList(user_number, order.getOrder_number());
		for (OrderItemVO ordervo : list) {
			log.info(ordervo);
		}
	}
	
	

}
