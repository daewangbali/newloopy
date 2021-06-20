package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;
import kr.co.mapper.OrderMapper;

@Service
public class OrderServiceImp implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public List<CartVO> readCartList(int user_number) {
		return orderMapper.getCartList(user_number);
	}
	
	@Override
	public List<BookVO> readBookList(int user_number) {
		return orderMapper.getBookList(user_number);
	}
	
	@Override
	public List<OrderVO> readList(int user_number) {
		return orderMapper.getList(user_number);
	}

	@Override
	public BookVO readOneBook(int book_id) {
		return orderMapper.getOneBook(book_id);
	}

	@Override
	public void registerPayByCard(OrderVO order) {
		orderMapper.insertPayByCard(order);
		
	}

	@Override
	public void registerPayInCash(OrderVO order) {
		orderMapper.insertPayInCash(order);
		
	}

	@Override
	public int findOrderNumber(int user_number) {
		return orderMapper.findOrderNumber(user_number);
	}

	@Override
	public List<OrderVO> readOrderList(int user_number, int order_number) {
		return orderMapper.getOrderList(user_number, order_number);
	}

	@Override
	public List<OrderItemVO> readOrderItemList(int user_number, int order_number) {
		return orderMapper.getOrderItemList(user_number, order_number);
	}

	
}
