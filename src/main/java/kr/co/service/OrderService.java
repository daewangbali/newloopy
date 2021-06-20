package kr.co.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;

public interface OrderService {
	
	public List<CartVO> readCartList(int user_number);
	public List<BookVO> readBookList(int user_number);
	
	public List<OrderVO> readList(int user_number);
	
	public BookVO readOneBook(int book_id);
	
	public void registerPayByCard(OrderVO order);
	public void registerPayInCash(OrderVO order);
	
	public int findOrderNumber(int user_number);
	
	// 내 주문목록 리스트
	public List<OrderVO> readOrderList(@Param("user_number")int user_number, @Param("order_number")int order_number);
	public List<OrderItemVO> readOrderItemList(@Param("user_number")int user_number, @Param("order_number")int order_number);

}
