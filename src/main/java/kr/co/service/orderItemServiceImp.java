package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.OrderItemVO;
import kr.co.mapper.OrderItemMapper;

@Service
public class OrderItemServiceImp implements OrderItemService {
	
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
