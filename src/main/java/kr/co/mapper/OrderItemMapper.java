package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.OrderItemVO;

public interface OrderItemMapper {
	
	public List<OrderItemVO> getList(int order_number);
	
	public List<OrderItemVO> getOrderItemList(int user_number);
	
	public void insert(OrderItemVO orderItem);
	
	public List<BookVO> getOrderItemBookList(int user_number);

}
