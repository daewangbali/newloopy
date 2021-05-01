package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;
import kr.co.mapper.OrderItemMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderItemMapperTest {
	
	@Autowired
	OrderItemMapper orderItemMapper;
	
	@Test
	public void getListTest() {
		log.info("getListTest()................");
		
		List<OrderItemVO> list = orderItemMapper.getList(1);

		for (OrderItemVO orderItemvo : list) {
			log.info(orderItemvo);
		}
	}
	
	@Test
	public void insertTest() {
		log.info("insertTest()................");
		OrderItemVO orderItem = new OrderItemVO();
		BookVO book = new BookVO();
		
		orderItem.setOrder_number(1);
		orderItem.setBook_id(3);
		orderItem.setAmount(1);
		book.setBook_id(3);
		int price = book.getBook_price();
		orderItem.setBook_price(price);
		orderItemMapper.insert(orderItem);
		log.info(orderItem);
		
	}
	

}
