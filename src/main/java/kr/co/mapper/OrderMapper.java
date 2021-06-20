package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;

public interface OrderMapper {
	
	public List<CartVO> getCartList(int user_number);
	public List<BookVO> getBookList(int user_number);
	
	//주문내역 리스트
	public List<OrderVO> getList(int user_number);
	
	
	//주문 아이템 리스트
	public List<OrderItemVO> getItemList(int order_number);
	
	//책 바로 주문시 사용
	public BookVO getOneBook(int book_id);
	
	public int findOrderNumber(int user_number);
	
	// 주문하기-카드
	public void insertPayByCard(OrderVO order);
	// 주문하기-현금
	public void insertPayInCash(OrderVO order);
	
	// 내 주문목록 리스트
	public List<OrderVO> getOrderList(@Param("user_number")int user_number, @Param("order_number")int order_number);
	public List<OrderItemVO> getOrderItemList(@Param("user_number")int user_number, @Param("order_number")int order_number);
}
