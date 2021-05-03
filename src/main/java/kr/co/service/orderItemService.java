package kr.co.service;

import java.util.List;

import kr.co.domain.OrderItemVO;

public interface OrderItemService {
	
	public List<OrderItemVO> readList(int order_number);
	
	public void regist(OrderItemVO orderItem);

}
