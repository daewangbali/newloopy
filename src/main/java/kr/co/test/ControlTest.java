package kr.co.test;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/test/*") //test라고 걸린 애들은 다 이쪽으로 넘어옴
public class ControlTest { 
	
	// 옛날방식
	@RequestMapping("")
	public void basic() {
		log.info("basic........");
	}
	
	@RequestMapping(value="/legacyGet", method = RequestMethod.GET)
	public void legacyGet() {
		log.info("legacyGet........");
	}
	
	@RequestMapping(value="/legacyPost", method = {RequestMethod.POST, RequestMethod.GET})
	public void legacyPost() {
		log.info("legacyPost........");
	}
	
	//지금
	
	@GetMapping("/testGet")
	public void testGet() {
		log.info("testGet........");
	}
	
	@PostMapping("/testPost")
	public void testPost() {
		log.info("testPost........");
	}
	
	@GetMapping("/testGetName2")
	public void testGetName2(String name) {
		log.info("testGetName2........"+name);
	}
	
	@GetMapping("/testGetName")
	public String testGetName(@ModelAttribute("name") String name) {
		log.info("testGetName........"+name);
		
		return "/test/testGetNameAge"; // 경로를 다 적어줌 string타입으로 하면 결과값을 경로로 넘길 수 있다
	}
	
	@GetMapping("/testGetNameAge2")
	public void testGetNameAge2(@RequestParam("n") String name , @RequestParam("a") int age) {
		log.info("testGetNameAge2........"+name + age);
	}
	
	@GetMapping("/testGetNameAge")
	public void testGetNameAge(@ModelAttribute("name") String name ,@ModelAttribute("age") int age) {
		log.info("testGetNameAge........"+name + age);
	}
	
	@GetMapping({"/testGetDTO","/testGetDTO2"}) //경로 복수개 가능
	public void testGetDTO(TestDTO dto) {
		log.info("testGetDTO........"+dto);
	}
	
	@GetMapping("/testGetArray")
	public void testGetArray(@RequestParam("name") ArrayList<String> name) {
		log.info("testGetArray........"+name);
	}
	
	@GetMapping("/testGetArrayDTO")
	public void testGetArrayDTO(TestDTOList dto) {
		log.info("testGetArrayDTO........"+dto);
	}
	
	@GetMapping("/re1")
	public String re1() {
		log.info("re1..........");
		return "redirect:/test/re2";
		
	}
	
	@GetMapping("/re2")
	public void re2() {
		log.info("re2..........");
		
	}
	
}
