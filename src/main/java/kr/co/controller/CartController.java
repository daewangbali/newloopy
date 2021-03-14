package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.UserVO;
import kr.co.service.CartService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/cart/*")

public class CartController {
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/list")
	public void list(CartVO cart) {
		log.info("list....................");
	}
	
	/*
	@PostMapping("/addcart")
	public String addCart(@RequestParam("book_id") int book_id,
						  @RequestParam("user_number") int user_number,
						  @RequestParam("amount") int amount,
						  HttpSession session,
						  HttpServletRequest request, HttpServletResponse resonse) {
		log.info("addCart........................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(user_number);
		cartvo.setBook_id(book_id);
		cartvo.setAmount(amount);
		String isAready = cartService.findcartbook(cartvo);
		System.out.println("isAread = " + isAready);
		
		if(isAready.equals("true")) {
			log.info("true!!!!!!");
			return "/cart/cart_already";
		}else { 
			cartService.addcart(cartvo);
			log.info("false!!!!");
			return "/cart/cart_add";
		}
	}
	*/
	
	@PostMapping("/addcart")
	public String addcart(@RequestParam("book_id") int book_id,
			  @RequestParam("user_number") int user_number,
			  @RequestParam("amount") int amount) {
		log.info("addCart........................");
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(user_number);
		cartvo.setBook_id(book_id);
		cartvo.setAmount(amount);
		String isAready = cartService.findcartbook(cartvo);
		System.out.println("isAread = " + isAready);
		
		if(isAready.equals("true")) {
			log.info("true!!!!!!");
			return "/cart/cart_already";
		}else { 
			cartService.addcart(cartvo);
			log.info("false!!!!");
		}
		return "/cart/cart_add";
		
	}
	
	
	

}