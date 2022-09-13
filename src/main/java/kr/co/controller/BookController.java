package kr.co.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.domain.BookVO;
import kr.co.service.BookService;
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
		model.addAttribute("book_kategorie", book_kategorie);
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("book_id") int book_id, Model model) {
		log.info("get................");
		model.addAttribute("book",bookService.get(book_id));
	}
	
	@GetMapping("/registerBookForm")
	public String registerBookForm() {
		log.info("registerBookForm get................");
		return "book/registerBookForm";
	}
	
	@PostMapping("/registerBook")
	public String registerBook(@ModelAttribute("book") BookVO book,MultipartFile file) throws IllegalStateException, IOException {
		log.info("registerBook post................");
		String projectPath = "C:\\Users\\win8.1\\Desktop\\Study\\spring\\pjt\\loopy\\src\\main\\webapp\\resources\\img";
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + file.getOriginalFilename();
		File saveFile = new File(projectPath,fileName);
		file.transferTo(saveFile);
		book.setFileName("/resources/img/"+file.getOriginalFilename());
		book.setFilepath(book.getFileName());
		
		bookService.register(book);
		return "book/registerBook_success";
	}

}
