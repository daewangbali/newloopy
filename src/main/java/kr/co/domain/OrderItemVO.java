package kr.co.domain;

import lombok.Data;

@Data
public class OrderItemVO {
	
	private int order_number, book_id, book_price, amount,order_price;
	private String fileName,book_title;

}
