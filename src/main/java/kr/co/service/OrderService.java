package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface OrderService {
	
	public List<CartVO> readCartList(int user_number);
	public List<BookVO> readBookList(int user_number);

}
