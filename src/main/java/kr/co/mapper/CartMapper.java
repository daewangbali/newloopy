package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;

public interface CartMapper {
	
	public List<CartVO> getList();
	
	//장바구니 추가
	public void insert(CartVO cart);
	
	//장바구니에 존재하는지 yes or no?
	public String select(CartVO cart);
	
	//장바구니 리스트에서 수량 변경
	public int update(CartVO cart);
	
	//장바구니에 이미 존재하는 책 추가
	public int addupdate(CartVO cart);
	
	//장바구니 수량 변경
	public int amountUpdate(CartVO cart);
	
	//장바구니에서 삭제
	public int delete(int book_id);

	//장바구니 리스트 불러오기
	public List<CartVO> getCartList(int user_number);
	public List<BookVO> getBookList(int user_number);
	
}