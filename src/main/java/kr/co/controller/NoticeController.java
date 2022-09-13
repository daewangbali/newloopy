package kr.co.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.NoticeVO;
import kr.co.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/notice/*")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list...............");
		model.addAttribute("list", noticeService.getList());
	}
	
	@GetMapping("/registerNoticeForm")
	public String registerNoticeForm() {
		log.info("registerNoticeForm get................");
		return "notice/registerNoticeForm";
	}
	
	@PostMapping("/registerNotice")
	public String registerNotice(@RequestParam("title") String title,@RequestParam("content") String content, RedirectAttributes ra ,HttpSession session,Model model) {
		log.info("registerNotice post.............");
		NoticeVO notice = new NoticeVO();
		String user_id = (String)session.getAttribute("user_id");
		notice.setWriter(user_id);
		notice.setTitle(title);
		notice.setContent(content);
		long bno = noticeService.registerSelectKey(notice);
		System.out.println("bno : "+bno);
		ra.addAttribute("bno",bno);
		ra.addFlashAttribute("bno",bno);
		model.addAttribute("noticeVO", noticeService.get(bno));
		return "redirect:/notice/get";	
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("register get................");
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("get................");
		model.addAttribute("noticeVO",noticeService.get(bno));
	}
	
	@GetMapping({"/modifyForm"})
	public void modifyForm(@RequestParam("bno") Long bno, Model model) {
		log.info("modifyForm get................");
		model.addAttribute("noticeVO",noticeService.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice, RedirectAttributes ra) {
		log.info("modify................");
		noticeService.modify(notice);
		ra.addAttribute("bno",notice.getBno());
		return "redirect:/notice/get";
	}
	
	@GetMapping("/remove")
	public void remove() {
		log.info("remove get................");
	}
	
	@ResponseBody
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes ra) {
		log.info("remove..............");
		
		int count = noticeService.remove(bno);
		
		if(count==1) {
			ra.addFlashAttribute("result","success");
		}
		
		return "redirect:/notice/list";
		
	}
}
