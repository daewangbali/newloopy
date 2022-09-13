package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.OrderItemVO;

public interface OrderItemService {
	
	public List<OrderItemVO> readList(int order_number);
	
	public List<OrderItemVO> getOrderItemList(int user_number);
	
	public void regist(OrderItemVO orderItem);
	
	public List<BookVO> getOrderItemBookList(int user_number);

}
