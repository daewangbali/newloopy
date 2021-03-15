package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.CartVO;
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
	/* 메인 카트 추가
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute("cartvo")CartVO cartvo, Model model) {
		log.info("addCart......................");
		String isAlready = cartService.findcartbook(cartvo);

		if(isAlready.equals("true")) {
			log.info("true!!!!!!");
			cartService.addModify(cartvo);
			return "/cart/cart_already";
		}else { 
			log.info("false!!!!");
			cartService.addcart(cartvo);
			return "/cart/cart_add";
		}
		
	}
	*/
	
	//모달창 이용해서 만들어봄 
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute("cartvo")CartVO cartvo, Model model) {
		log.info("addCart......................");
		String isAlready = cartService.findcartbook(cartvo);

		if(isAlready.equals("true")) {
			log.info("장바구니에 이미 존재하는 상품");
			cartService.addModify(cartvo);
//			model.addAttribute("addMessage", "장바구니에 추가되었습니다.");
//			model.addAttribute("already", cartvo);
//			model.addAttribute("already", cartvo.getBook_id());
//			model.addAttribute("already", cartvo.getUser_number());
//			model.addAttribute("already", cartvo.getAmount());
			return "redirect:/book/get?book_id="+cartvo.getBook_id();
		}else { 
			log.info("장바구니에 상품 추가");
			cartService.addcart(cartvo);
//			model.addAttribute("addMessage", "장바구니에 추가되었습니다.");
//			model.addAttribute("addSuccess", cartvo);
//			model.addAttribute("addSuccess", cartvo.getBook_id());
//			model.addAttribute("addSuccess", cartvo.getUser_number());
//			model.addAttribute("addSuccess", cartvo.getAmount());
			return "redirect:/book/get?book_id="+cartvo.getBook_id();
		}
		
		
	}
	
	
	/*
	 * 
	 * 
	@PostMapping("/addCart")
	public String addCart(@RequestParam("alreadyAmount")int alreadyAmount,@ModelAttribute("cartvo")CartVO cartvo, Model model, HttpSession session) {
		log.info("addCart......................");
		String isAlready = cartService.findcartbook(cartvo);

		if(isAlready.equals("true")) {
			log.info("true!!!!!!");
			int totalAmount = alreadyAmount + cartvo.getAmount();
			model.addAttribute("totalAmount", totalAmount);
			return "/cart/cart_already";
		}else { 
			log.info("false!!!!");
			cartService.addcart(cartvo);
			session.setAttribute("alreadyAmount", cartvo.getAmount());
			return "/cart/cart_add";
		}
		
	}
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
	
	
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute("cartvo")CartVO cartvo, Model model) {
		log.info("addCart......................");
		String isAlready = cartService.findcartbook(cartvo);
		System.out.println("isAlready = " + isAlready);
		if(isAlready.equals("true")) {
			log.info("true!!!!!!");
			return "/cart/cart_already";
		}else { 
			log.info("false!!!!");
			cartService.addcart(cartvo);
			model.addAttribute("cart", cartvo.getClass());
			
			
		}
		return "/cart/cart_add";
		
		
	}
	

	@PostMapping("/addCart")
	public String addCart(@RequestParam(value = "book_id", required = false) int book_id,
			  @RequestParam(value = "user_number", required = false) int user_number,
			  @RequestParam(value = "amount", required = false) int amount) {
		log.info("addCart................");
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
	*/
	
}