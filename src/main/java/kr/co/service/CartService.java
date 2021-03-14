package kr.co.service;

import kr.co.domain.CartVO;

public interface CartService {

	public void addcart(CartVO cart);
	
	public String findcartbook(CartVO cart);
}