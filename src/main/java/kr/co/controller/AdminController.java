package kr.co.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.BookVO;
import kr.co.domain.UserVO;
import kr.co.service.BookService;
import kr.co.service.Common;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/admin/*")
@RequiredArgsConstructor
public class AdminController {
	
	@Autowired
	private Common common;
	
	private final BookService bookService;
	
	@GetMapping("/book_list") 
	public void getBook_list(BookVO book,Model model) {
		log.info("getBook_list...............");
		model.addAttribute("bookList", bookService.getList("all"));
		
	}
	
	@GetMapping("/addBook") 
	public void getaddBook(BookVO book,Model model) {
		log.info("getBook_list...............");
	}
	
	@GetMapping("/book_modify") 
	public void getBook_modify(BookVO book,Model model,@RequestParam("book_id")int book_id) {
		log.info("getBook_modify...............");
		model.addAttribute("book",bookService.get(book_id));
		
	}
	
	@GetMapping("/book_remove") 
	public void getBook_remove(BookVO book,Model model) {
		log.info("getBook_remove...............");
	}
	
	@PostMapping(value = "/addBook", consumes = "multipart/form-data")
	public String addBook(BookVO book,Model model,RedirectAttributes ra, @RequestParam ("file") MultipartFile file,
			 HttpSession session) {
		log.info("addBook...............");
		
		if (file.getSize() > 0) { // 파일을 가지고 있다면
			common.upload(file, session);
			book.setFilepath("/resources/img/"+file.getOriginalFilename());
			book.setFileName("/resources/img/"+file.getOriginalFilename());
		}
		
		bookService.register(book);
		int book_id = book.getBook_id();
		
		return "redirect:/admin/book_modify?book_id="+ book_id;
		
		
	}
	
	@PostMapping("/book_modify")
	public String book_modify(BookVO book,Model model) {
		log.info("book_modify...............");
		bookService.modify(book);
		int book_id = book.getBook_id();
		
		return "redirect:/admin/book_modify?book_id="+ book_id;
		
		
	}
	
	@ResponseBody
	@PostMapping("/book_remove")
	public void book_remove(BookVO book,Model model,@RequestParam("book_id")int book_id) {
		log.info("book_modify...............");
		bookService.remove(book_id);
	}


}
