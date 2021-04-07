package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface OrderMapper {
	
	public List<CartVO> getCartList(int user_number);
	public List<BookVO> getBookList(int user_number);

}
