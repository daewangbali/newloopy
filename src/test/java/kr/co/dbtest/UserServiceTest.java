package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.UserVO;
import kr.co.mapper.UserMapper;
import kr.co.service.UserService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserServiceTest {
	
	@Autowired
	UserService us;
	
	@Test
	public void getListTest() {
		log.info("getListTest.....................");
		List<UserVO> vo = us.getList();
		
		for(UserVO userVO : vo) {
			log.info(userVO);
		}
	}
	
	@Test
	public void joinTest() {
		log.info("joinTest................");
		UserVO vo = new UserVO();
		vo.setUser_id("admin2");
		vo.setUser_pw("12345");
		vo.setUser_name("정강정");
		vo.setUser_email("admin@loopy.com");
		vo.setUser_hp1("010");
		vo.setUser_hp2("1234");
		vo.setUser_hp3("5678");
		vo.setUser_zipcode("12345");
		vo.setUser_roadAddress("광주광역시 상무대로 1");
		vo.setUser_jibunAddress("광주광역시 서구 치평동 오션3빌딩");
		vo.setUser_namujiAddress("5층");
		vo.setUser_birthY("2020");
		vo.setUser_birthM("10");
		vo.setUser_birthD("19");
		vo.setUser_del_yn(1);

		
		us.join(vo);
		this.getListTest();
	}
	
	@Test
	public void idcheckTest() {
		log.info("idcheck...............");
		log.info(us.idcheck("afdas"));
	}
	
	@Test
	public void loginTest() {
		log.info("loginTest...............");
		UserVO vo = new UserVO();
		vo.setUser_id("admin2");
		vo.setUser_pw("12345");
		log.info(us.login(vo).getUser_pw());
	}
	
	

}