package kr.co.mapper;

import java.util.List;

import kr.co.domain.CartVO;

public interface CartMapper {
	
	public List<CartVO> getList();

	public void insert(CartVO cart);
	
	public String select(CartVO cart);
	
	public int update(CartVO cart);
	
	public int addupdate(CartVO cart);
	
}