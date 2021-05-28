package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface CartService {
	
	public List<CartVO> cartList();
	
	//장바구니 리스트 불러오기
	public List<CartVO> readCartList(int user_number);
	public List<BookVO> readBookList(int user_number);

	//장바구니에 추가
	public void addcart(CartVO cart);
	
	public String findcartbook(CartVO cart);
	
	public int modify(CartVO cart);
	
	public int addModify(CartVO cart);
	
	public int amountModify(CartVO cart);
	
	//장바구니 목록에서 삭제
	public int remove(CartVO cart);
	
	//주문후 장바구니 비우기
	public int allRemove(int user_number);
	
	
}