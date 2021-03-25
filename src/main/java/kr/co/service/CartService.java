package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface CartService {
	
	public List<CartVO> cartList();
	
	public List<CartVO> readCartList(int user_number);
	
	public List<BookVO> readBookList(int user_number);

	public void addcart(CartVO cart);
	
	public String findcartbook(CartVO cart);
	
	public int modify(CartVO cart);
	
	public int addModify(CartVO cart);
}