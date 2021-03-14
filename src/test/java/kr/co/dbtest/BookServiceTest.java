package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.domain.NoticeVO;
import kr.co.service.BookService;
import lombok.extern.log4j.Log4j2;
@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookServiceTest {
	@Autowired
	BookService bookService;
	
	@Test
	public void getListTest() {
		log.info("getListTest.....................");
		List<BookVO> vo = bookService.getList("all");
		
		for(BookVO bookVO : vo) {
			log.info(bookVO);
		}
	}

	@Test
	public void registerTest() {
		log.info("registerTest......................");
		BookVO vo = new BookVO();
		vo.setBook_title("다락원 일본어 독해");
		vo.setBook_writer("코가 마키코");
		vo.setBook_publisher("다락원");
		vo.setBook_price(12000);
		vo.setBook_kategorie("외국어");
		vo.setBook_intro("다락원 일본어 시리즈의 독해 버전 개념으로 새롭게 출간되는 독해 일본어 시리즈. 게임이나 패션 등 우리 생활에 가까운 주제부터, 일본의 옛날이야기나 위인전, 동물보호와 같은 사회문제까지 폭넓게 다루고 있다.");
		vo.setFileName("/resources/img/다락원독해.jpg");
		log.info(vo);
		
		bookService.register(vo);
		this.getListTest();
	}
	
	@Test
	public void getTest() {
		log.info("getTest......................");
		log.info(bookService.get(30));
	}
	
	@Test
	public void modifyTest() {
		log.info("modifyTest......................");
		BookVO vo = new BookVO();
		vo.setBook_title("Test");
		vo.setBook_price(50000);
		vo.setFileName("/resources/img/오만과편견.jpg");
		vo.setBook_writer("제인 오스틴");
		vo.setBook_kategorie("소설");
		vo.setBook_intro("Test 테스트 01 ");
		vo.setBook_publisher("시공사");
		
		vo.setBook_id(62);
		log.info(vo);
		log.info(bookService.modify(vo));
		
		this.getListTest();
		
	}
	@Test
	public void removeTest() {
		log.info("removeTest......................");
		log.info(bookService.remove(62));
		
		this.getListTest();
	}
	

}