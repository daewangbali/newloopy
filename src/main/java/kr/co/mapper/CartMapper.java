package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface CartMapper {
	
	public List<CartVO> getList();

	public void insert(CartVO cart);
	
	public String select(CartVO cart);
	
	public int update(CartVO cart);
	
	public int addupdate(CartVO cart);


	public List<CartVO> getCartList(int user_number);
	
	public List<BookVO> getBookList(int user_number);
	
}