package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
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
}
