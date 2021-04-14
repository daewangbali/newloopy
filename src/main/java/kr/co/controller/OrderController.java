package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/selectlist")
	public void getselectlist() {
		log.info("selectlist get................");
	}
	
	@PostMapping("/selectlist" )
	@ResponseBody
	public String selectList(CartVO cart, BookVO book,Model model,HttpSession session,
			@RequestParam List<Integer> indexArray) {
		log.info("selectList....................");
		int user_number = (int)session.getAttribute("user_number");
		log.info(indexArray);
		log.info(indexArray.size());
		//새로 담을 리스트 
		List<CartVO> newCartList = new ArrayList<CartVO>();
		List<BookVO> newBookList = new ArrayList<BookVO>();
		
		
		//받아온 index 확인
		for(int i=0;i<indexArray.size();i++) {
			
			if(indexArray.get(i) != null) {
				log.info(i);
				newCartList.add(orderService.readCartList(user_number).get(i));
				newBookList.add(orderService.readBookList(user_number).get(i));
			}
			log.info(i);
		}
		
		log.info(newCartList);
		log.info(newBookList);
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartList", newCartList);
		model.addAttribute("bookList", newBookList);
		session.setAttribute("cartList", newCartList);
		session.setAttribute("bookList", newBookList);
		
		return "/order/selectlist";
	}
	
	
	/*
	@GetMapping("/selectlist" )
	@ResponseBody
	public String selectList(CartVO cart, BookVO book,Model model,HttpSession session,
			@RequestParam List<Integer> indexArray) {
		log.info("selectList....................");
		int user_number = (int)session.getAttribute("user_number");
		log.info(indexArray);
		log.info(indexArray.size());
		//새로 담을 리스트 
		List<CartVO> newCartList = new ArrayList<CartVO>();
		List<BookVO> newBookList = new ArrayList<BookVO>();
		
		
		//받아온 index 확인
		for(int i=0;i<indexArray.size();i++) {
			
			if(indexArray.get(i) != -1) {
				log.info(i);
				newCartList.add(orderService.readCartList(user_number).get(i));
				newBookList.add(orderService.readBookList(user_number).get(i));
			}
			log.info(i);
		}
		
		log.info(newCartList);
		log.info(newBookList);
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartList", newCartList);
		model.addAttribute("bookList", newBookList);
		session.setAttribute("cartList", newCartList);
		session.setAttribute("bookList", newBookList);
		
		return "/order/selectlist";
	}
	
	
	
	@GetMapping("/selectList")
	@ResponseBody
	public String selectList(CartVO cart, BookVO book,Model model,HttpSession session,
			HttpServletRequest request) {
		log.info("selectList....................");
		int user_number = (int)session.getAttribute("user_number");
		String[] indexArray = request.getParameterValues("indexArray");
		log.info(indexArray);
		log.info(indexArray.length);
		//새로 담을 리스트 
		List<CartVO> newCartList = new ArrayList<CartVO>();
		List<BookVO> newBookList = new ArrayList<BookVO>();
		
		log.info(orderService.readCartList(user_number).get(1));
		
		log.info(newCartList);
		
		//받아온 index 확인
		for(int i=0;i<indexArray.length;i++) {
			if(!indexArray[i].equals("-1")) {
				newCartList.add(orderService.readCartList(user_number).get(i));
				newBookList.add(orderService.readBookList(user_number).get(i));
			}
		}
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartList", newCartList);
		model.addAttribute("bookList", newBookList);
		session.setAttribute("cartList", newCartList);
		session.setAttribute("bookList", newBookList);
		
		return "/order/selectList";
	}
	*/
	
	
	
	
	
	
}
