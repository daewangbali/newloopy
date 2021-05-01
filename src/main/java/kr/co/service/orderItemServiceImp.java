package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.domain.OrderItemVO;
import kr.co.mapper.OrderItemMapper;

public class orderItemServiceImp implements orderItemService {
	
	@Autowired
	private OrderItemMapper orderItemMapper ;

	@Override
	public List<OrderItemVO> readList(int order_number) {
		return orderItemMapper.getList(order_number);
	}

	@Override
	public void regist(OrderItemVO orderItem) {
		orderItemMapper.insert(orderItem);
	}

}
