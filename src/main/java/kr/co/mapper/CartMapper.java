package kr.co.mapper;

import kr.co.domain.CartVO;

public interface CartMapper {

	public void insert(CartVO cart);
	
	public String select(CartVO cart);
	
}