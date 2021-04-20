package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderVO;

public interface OrderMapper {
	
	public List<CartVO> getCartList(int user_number);
	public List<BookVO> getBookList(int user_number);
	
	public List<OrderVO> getList(int user_number);
	
	//책 바로 주문시 사용
	public BookVO getOneBook(int book_id);
	
	// 주문하기-카드
	public void insertPayByCard(OrderVO order);
	// 주문하기-현금
	public void insertPayInCash(OrderVO order);

}
