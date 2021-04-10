package kr.co.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.service.OrderService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/list")
	public void list(CartVO cart, BookVO book,Model model,HttpSession session) {
		log.info("list....................");
		int user_number = (int)session.getAttribute("user_number");
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartList", orderService.readCartList(user_number));
		model.addAttribute("bookList", orderService.readBookList(user_number));
		session.setAttribute("cartList", orderService.readCartList(user_number));
		session.setAttribute("bookList", orderService.readBookList(user_number));
	}

}
