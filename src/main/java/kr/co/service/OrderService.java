package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderVO;

public interface OrderService {
	
	public List<CartVO> readCartList(int user_number);
	public List<BookVO> readBookList(int user_number);
	
	public List<OrderVO> readList(int user_number);
	
	public BookVO readOneBook(int book_id);
	
	public void registerPayByCard(OrderVO order);
	public void registerPayInCash(OrderVO order);
	
	public int findOrderNumber(int user_number);

}
