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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.BookVO;
import kr.co.domain.CartVO;
import kr.co.domain.OrderVO;
import kr.co.domain.UserVO;
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
	
	@GetMapping("/oneBookOrder")
	public void getoneBookOrder() {
		log.info("oneBookOrder get................");
	}
	
	@PostMapping("/selectlist" )
	@ResponseBody
	public String selectList(CartVO cart, BookVO book,Model model,HttpSession session,
			@RequestParam List<Integer> indexArray) {
		log.info("selectList....................");
		int user_number = (int)session.getAttribute("user_number");
		
		//새로 담을 리스트 
		List<CartVO> newCartList = new ArrayList<CartVO>();
		List<BookVO> newBookList = new ArrayList<BookVO>();
		
		//받아온 index 확인
		for(int i=0;i<indexArray.size();i++) {
			
			if(indexArray.get(i) != null) {
				newCartList.add(orderService.readCartList(user_number).get(i));
				newBookList.add(orderService.readBookList(user_number).get(i));
			}
		}
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("newCartList", newCartList);
		model.addAttribute("newBookList", newBookList);
		session.setAttribute("newCartList", newCartList);
		session.setAttribute("newBookList", newBookList);
		
		return "/order/selectlist";
	}
	
	@ResponseBody
	@PostMapping("/oneBookOrder" )
	public void oneBookOrder(Model model,HttpSession session,
			@RequestParam("cartAmount")int cartAmount,@RequestParam("book_id")int book_id) {
		log.info("oneItemOrder....................");
		int user_number = (int)session.getAttribute("user_number");

		log.info("book_id : " + book_id);
		log.info("cartAmount : " + cartAmount);
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartAmount", cartAmount);
		model.addAttribute("bookVO", orderService.readOneBook(book_id));
		session.setAttribute("cartAmount", cartAmount);
		session.setAttribute("bookVO", orderService.readOneBook(book_id));
	}
	
	@PostMapping("/orderCompleted" )
	public String orderCompleted(Model model,HttpSession session,
			@RequestParam("book_id")List<Integer> book_id_list, @ModelAttribute("order") OrderVO order) {
		log.info("orderCompleted....................");
		int user_number = (int)session.getAttribute("user_number");
		order.setDelivery_status("주문완료");
		order.setOrder_amount(book_id_list.size());
		order.setOrder_number(order.getOrder_number()+1);
		order.setUser_number(user_number);
		
		for(int i=0;i<book_id_list.size();i++) {
			int book_id = book_id_list.get(i);
			order.setBook_id(book_id);
			if(order.getPayment_method().equals("카드")) {
				orderService.registerPayByCard(order);
			}else if(order.getPayment_method().equals("무통장입금")) {
				orderService.registerPayInCash(order);
			}
		}
		
		
		return "/order/orderCompleted";
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
