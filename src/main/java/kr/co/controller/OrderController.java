package kr.co.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import kr.co.domain.OrderItemVO;
import kr.co.domain.OrderVO;
import kr.co.domain.UserVO;
import kr.co.service.CartService;
import kr.co.service.OrderItemService;
import kr.co.service.OrderService;
import kr.co.service.UserService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/order/*")
public class OrderController {
	
	List<BookVO> orderlist = new ArrayList<BookVO>();
	List<CartVO> orderAmountlist = new ArrayList<CartVO>();
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderItemService orderItemService;
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/selectlist")
	public void getselectlist() {
		log.info("selectlist get................");
	}
	
	@GetMapping("/oneBookOrder")
	public void getoneBookOrder() {
		log.info("oneBookOrder get................");
	}
	
	@GetMapping("/orderCompleted")
	public void orderCompleted() {
		log.info("orderCompleted get................");
	}

	@GetMapping("/oneOrderCompleted")
	public void oneOrderCompleted() {
		log.info("oneOrderCompleted get................");
	}
	
	@GetMapping("/order_list")
	public String order_list(Model model,HttpSession session) {
		log.info("order_list get................");
		
		int user_number = (int)session.getAttribute("user_number");
		
		List<OrderVO> list = orderService.readList(user_number);
		
		@SuppressWarnings("unchecked")
		List<OrderItemVO> orderItemList = (List<OrderItemVO>) orderItemService.getOrderItemList(user_number);
		
		List<BookVO> orderBookList = orderItemService.getOrderItemBookList(user_number);
		
		model.addAttribute("orderList",list);
		model.addAttribute("orderItemList",orderItemList);
		model.addAttribute("orderBookList",orderBookList);
		/*
		 * List<Integer> list2 = new ArrayList<Integer>(); for(int i=
		 * 0;i<list.size();i++) { list2.add(list.get(i).getOrder_number()); }
		 * 
		 * List<OrderVO> orderList = new ArrayList<OrderVO>(); for(int i=
		 * 0;i<list2.size();i++) { List<OrderVO> orderlist =
		 * orderService.readOrderList(user_number,list2.get(i)); orderList.add((OrderVO)
		 * orderlist); }
		 */
		
		
	
//		model.addAttribute("orderList",orderList);
//		model.addAttribute("orderItemList",orderItemList);
//		model.addAttribute("orderList",orderService.readList(user_number));
//		model.addAttribute("orderItemList",orderService.readList(user_number));
//		model.addAttribute("orderItemList",orderItemService.readList(order_number));
		
		return "/order/order_list";
	}
	
	@PostMapping("/selectlist" )
	@ResponseBody
	public String selectList(CartVO cart, BookVO book,Model model,HttpSession session,
			@RequestParam List<Integer> indexArray) {
		log.info("selectList....................");
		int user_number = (int)session.getAttribute("user_number");
		
		UserVO user = userService.readUser(user_number);
		
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
		
		orderlist = newBookList;
		orderAmountlist = newCartList;
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("newCartList", newCartList);
		model.addAttribute("newBookList", newBookList);
		model.addAttribute("user", user);
		session.setAttribute("newCartList", newCartList);
		session.setAttribute("newBookList", newBookList);
		session.setAttribute("user", user);
		return "/order/selectlist";
	}
	
	@ResponseBody
	@PostMapping("/oneBookOrder" )
	public String oneBookOrder(Model model,HttpSession session,
			@RequestParam("amount")int amount,@RequestParam("book_id")int book_id) {
		log.info("oneItemOrder....................");
		int user_number = (int)session.getAttribute("user_number");

		log.info("book_id : " + book_id);
		log.info("cartAmount : " + amount);
		
		model.addAttribute("user_numer", user_number);
		model.addAttribute("cartAmount", amount);
		model.addAttribute("bookVO", orderService.readOneBook(book_id));
		session.setAttribute("cartAmount", amount);
		session.setAttribute("bookVO", orderService.readOneBook(book_id));
		
		return "/order/oneBookOrder";
	}
	
	@PostMapping("/orderCompleted" )
	public String orderCompleted(Model model,HttpSession session,@RequestParam("directOrder") String directOrder, @ModelAttribute("order") OrderVO order,
			@RequestParam("paymentMethod") int paymentMethod) {
		log.info("orderCompleted....................");
		log.info("paymentMethod.........? : "+paymentMethod);
		int user_number = (int)session.getAttribute("user_number");
		
		order.setUser_number(user_number);
		
		// 카드 or 무통장 입금?
		if(paymentMethod==1) {
			log.info("카드 .................");
			order.setPayment_method("카드");
			orderService.registerPayByCard(order);
		}else {
			log.info("무통장입금 .................");
			order.setPayment_method("무통장입금");
			orderService.registerPayInCash(order);
		}
		
		// 주문번호 
		int order_number = orderService.findOrderNumber(user_number);
		// 주문번호 set 한뒤 주문한 책 db에 넣기
		if(!directOrder.equals("directOrder")) {
		
			for(int i=0;i<orderlist.size();i++) {
				OrderItemVO orderItemVO = new OrderItemVO();
				orderItemVO.setBook_id(orderlist.get(i).getBook_id());
				orderItemVO.setBook_price(orderlist.get(i).getBook_price());
				orderItemVO.setAmount(orderAmountlist.get(i).getAmount());
				orderItemVO.setOrder_number(order_number);
				orderItemService.regist(orderItemVO);
				
			}
			cartService.allRemove(user_number);
		}
		
		//주문 후 카트 삭제
		
		
		return "redirect:/order/orderCompleted";
		
	}
	
	@RequestMapping("/oneOrderCompleted" )
	public String oneOrderCompleted(Model model,HttpSession session,@ModelAttribute("order") OrderVO order,
			@RequestParam("paymentMethod") int paymentMethod, @RequestParam("totalPrice") int totalPrice , @RequestParam("book_id") int book_id
			, @RequestParam("book_price") int book_price) {
		log.info("oneOrderCompleted....................");
		log.info("paymentMethod.........? : "+paymentMethod);
		int user_number = (int)session.getAttribute("user_number");
		
		order.setUser_number(user_number);
		
		// 카드 or 무통장 입금?
		if(paymentMethod==1) {
			log.info("카드 .................");
			order.setPayment_method("카드");
			orderService.registerPayByCard(order);
		}else {
			log.info("무통장입금 .................");
			order.setPayment_method("무통장입금");
			orderService.registerPayInCash(order);
		}
		
		// 주문번호 
		int order_number = orderService.findOrderNumber(user_number);
		
		OrderItemVO orderItemVO = new OrderItemVO();
		orderItemVO.setBook_id(book_id);
		orderItemVO.setBook_price(book_price);
		orderItemVO.setOrder_number(order_number);
		orderItemService.regist(orderItemVO);
		
		//주문 후 카트 삭제
		
		
		return "redirect:/order/orderCompleted";
		
	}
	
	
	/*
	
	//주문내역 불러오기
	@PostMapping("/order_list" )
	public String orderList(Model model,HttpSession session) {
		log.info("orderList....................");
		
		int user_number = (int)session.getAttribute("user_number");
//		int order_number = orderService.readList(user_number).get(1).getOrder_number();
			
		model.addAttribute("orderList",orderService.readList(user_number));
//		model.addAttribute("orderItemList",orderItemService.readList(order_number));
			
		return "/order/order_list";
			
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
