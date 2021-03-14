package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.service.BookService;
import kr.co.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/book/*")
@RequiredArgsConstructor
public class BookController {
	
	private final BookService bookService;
	
	@GetMapping("/list")
	public void list(Model model,@RequestParam("book_kategorie")@ModelAttribute("book_kategorie") String book_kategorie) {
		log.info("list...............");
		model.addAttribute("list", bookService.getList(book_kategorie));

	}
	
	@GetMapping("/get")
	public void get(@RequestParam("book_id") int book_id, Model model) {
		log.info("get................");
		model.addAttribute("book",bookService.get(book_id));
		
	}

}
