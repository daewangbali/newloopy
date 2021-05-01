package kr.co.mapper;

import java.util.List;

import kr.co.domain.OrderItemVO;

public interface OrderItemMapper {
	
	public List<OrderItemVO> getList(int order_number);
	
	public void insert(OrderItemVO orderItem);

}
