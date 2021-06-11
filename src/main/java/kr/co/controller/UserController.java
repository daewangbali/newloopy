package kr.co.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.UserVO;
import kr.co.service.BookService;
import kr.co.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user/*")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/join") 
	public void join(@ModelAttribute("user") UserVO user) {
		log.info("join...............");
//		userService.idcheck(user_id);
	}
	
	@GetMapping("/join2") 
	@ResponseBody //화면으로 정보전달
	public boolean join(@RequestBody @RequestParam("user_id") @ModelAttribute("user_id") String user_id) {
		
		log.info("join2..............."+user_id);
//		userService.idcheck(user_id);
		
		return userService.idcheck(user_id);
		
	}
	
	@GetMapping("/modify")
	public void getmodify(HttpSession session,Model model) {
		log.info("modify get................");
		
		int user_number = (int)session.getAttribute("user_number");
		UserVO user = userService.readUser(user_number);
		
		model.addAttribute("user",user);
		session.setAttribute("user", user);
	}
	
	@GetMapping("/remove") 
	public void getremove(@ModelAttribute("user") UserVO user) {
		log.info("remove get...............");
//		userService.idcheck(user_id);
	}
	
	
	/*
	@PostMapping("/join_success")
	public void joinSuccess(HttpSession session,@ModelAttribute("user") UserVO user){
		log.info("join_success...............");
		userService.join(user);
		session.setAttribute("user_id", user.getUser_id());
		session.setAttribute("user_pw", user.getUser_pw());
		}
	*/
	
	@PostMapping("/join_success")
	public void joinSuccess(@ModelAttribute("user") UserVO user) {
		log.info("join_success...............");
		userService.join(user);
	}
	
	@PostMapping("/modify")
	public String modify(HttpSession session,@ModelAttribute("user") UserVO user) {
		log.info("modify...............");
		int user_number = (int)session.getAttribute("user_number");
		user.setUser_number(user_number);
		userService.modify(user);
		
		return "/user/modify_success";
	}
	
	@GetMapping("/login") 
	public void login(@ModelAttribute("user") UserVO user, HttpServletRequest request,Model model) {
		log.info("login...............");
		String referer = request.getHeader("referer");
		model.addAttribute("referer", referer);
//		userService.idcheck(user_id);
	}
	
	/*
	@PostMapping("/login_success")
	public ModelAndView login(@ModelAttribute("user")UserVO user ,HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) {
		log.info("login_success................");
		ModelAndView mav = new ModelAndView();
		user = userService.login(user);
		if(user != null && user.getUser_id() != null) {
			session = request.getSession();
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_pw", user.getUser_pw());
		}else {
			String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
			mav.addObject("message",message);
			mav.setViewName("/user/login");
			
		}
		return mav;
	}
	*/
	@PostMapping("/login_success")
	public String login(@ModelAttribute("user")UserVO user ,HttpServletRequest request, 
			HttpServletResponse response, HttpSession session,Model model,@RequestParam("referer") @ModelAttribute("referer") String referer) {
		log.info("login_success................");
		user = userService.login(user);
		if(user != null && user.getUser_id() != null) {
			session = request.getSession();
			session.setAttribute("user_number", user.getUser_number());
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_pw", user.getUser_pw());
			log.info(referer);
			return "redirect:"+referer;
		}else {
			String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
			model.addAttribute("message",message);	
			
		}
		
		return "/user/login";
		
	}
	
	
	
	@GetMapping("/logout")
	public void logout(HttpServletRequest request) {
		log.info("logout_success................");
		request.getSession().invalidate();
	}
	
	
		
	
}
