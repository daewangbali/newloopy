package kr.co.dbtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.UserVO;
import kr.co.mapper.UserMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

	@Autowired
	UserMapper um;

	@Test
	public void getListTest() {
		log.info("getListTest.....................");
		List<UserVO> vo = um.getList();

		for (UserVO userVO : vo) {
			log.info(userVO);
		}
	}
	
	@Test
	public void getUserListTest() {
		log.info("getUserListTest.....................");
		UserVO vo = um.getUser(41);

		log.info(vo);
		
	}

	@Test
	public void insertTest() {
		log.info("insertTest................");
		UserVO vo = new UserVO();
		vo.setUser_id("ddany");
		vo.setUser_pw("1234");
		vo.setUser_name("정강정2");
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

		log.info(vo);

		um.insert(vo);
		this.getListTest();
	}

	@Test
	public void idcheckTest() {
		log.info("idcheck...............");
		log.info(um.idcheck("admin3"));
	}

	@Test
	public void pwcheckTest() {
		log.info("idcheck...............");
		log.info(um.idcheck("admin"));
	}

	@Test
	public void readTest() {
		log.info("readTest...............");
		/*
		 * Map<String, String> map = new HashMap<String, String>(); map.put("user_id",
		 * "admin"); map.put("user_pw", "1234");
		 */

		UserVO vo = new UserVO();
		vo.setUser_id("admin2");
		vo.setUser_pw("1234");

//		log.info(um.read(map).getUser_id());
		log.info(um.read(vo).getUser_id());
	}

	@Test
	public void updateTest() {
		log.info("updateTest......................");
		UserVO vo = new UserVO();
		vo.setUser_id("admin33");
		vo.setUser_pw("1111");
		vo.setUser_name("정강정22");
		vo.setUser_email("admin2@loopy.com");
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

		log.info(vo);
		vo.setUser_number(3);
		log.info(um.update(vo));
		this.getListTest();
	}

	@Test
	public void deleteTest() {
		log.info("deleteTest......................");
		log.info(um.delete(3));

		this.getListTest();
	}

}