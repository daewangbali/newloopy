package kr.co.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BookVO {
	private int book_id ,book_price ;
	private String fileName, book_title ,book_writer,book_publisher, 
			book_kategorie,book_intro;
	private Date credate;

}