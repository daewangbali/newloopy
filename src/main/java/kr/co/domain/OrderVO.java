package kr.co.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int order_number, user_number, book_id, order_amount, order_price;
	private String orderer_name, orderer_hp1, orderer_hp2, orderer_hp3, order_name, order_hp1, order_hp2, order_hp3,
			order_zipcode, order_roadAddress, order_jibunAddress, order_namujiAddress, order_message, payment_method,
			card_name, card_installment, deposit_name, delivery_status;
	private Date order_credate;

}
