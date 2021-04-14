package kr.co.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CartVO implements Serializable{

	private int amount;
	private int user_number;
	private int book_id;
}