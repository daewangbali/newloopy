package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.mapper.BookMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookMapperTest {
	
	@Autowired
	BookMapper bm;
	
	@Test
	public void getListTest() {
		log.info("getListTest.....................");
		List<BookVO> vo = bm.getList("all");
		
		for(BookVO bookVO : vo) {
			log.info(bookVO);
		}
	}
	
	
	
	@Test
	public void insertTest() {
		BookVO vo = new BookVO();
		vo.setBook_title("면접을 위한 CS 전공지식 노트");
		vo.setBook_writer("주홍철");
		vo.setBook_publisher("길벗");
		vo.setBook_price(24000);
		vo.setBook_kategorie("IT/컴퓨터");
		vo.setBook_intro("디자인 패턴, 네트워크, 운영체제, 데이터베이스, 자료 구조 등 면접에 필요한 CS 전공지식을 모두 담고 있다. 200여 개의 그림과 코드로 이론을 자세히 설명하고, 실제 라이브러리에서 사용된 디자인 패턴 등으로 실무 활용법을 함께 다뤄 이론과 실무를 놓치지 않고 학습할 수 있도록 구성했다.");
		vo.setFileName("/resources/img/면접을위한CS전공지식노트.jpg");
		log.info(vo);
		
		bm.insert(vo);
		this.getListTest();
	}
	
	@Test
	public void readTest() {
		log.info("readTest......................");
		log.info(bm.read(4));
	}
	
	@Test
	public void updateTest() {
		log.info("updateTest......................");
		
		BookVO vo = new BookVO();
		vo.setBook_title("벨 자");
		vo.setBook_price(13000);
		vo.setFileName("/resources/img/벨자.jpg");
		vo.setBook_writer("실비아 플라스");
		vo.setBook_kategorie("소설");
		vo.setBook_intro("존재만으로 \"문학에서의 한 사건\"이자 \"대중적인 현상\"이라 일컬어지는 실비아 플라스. <실비아 플라스 시 전집>으로 사후에 출간된 시집 가운데 유일하게 퓰리처 상을 수상한 그가 유일하게 남긴 소설 <벨 자>가 개정판으로 거듭났다.\r\n"
				+ "1950년대의 미국 사회에서 줄곧 모범생으로 살아온 열아홉 살 에스더 그린우드를 내레이터이자 주인공으로 하고 있다. 실비아 플라스는, 러시아의 비평가 슈클로프스키가 '낯설게 하기'라 부른 사실주의의 주요한 문학 기법을 써서 에스더의 과거와 현재를 오간다.");
		vo.setBook_publisher("마음산책");
		log.info(vo);
		vo.setBook_id(8);
		log.info(bm.update(vo));
		this.getListTest();
	}
	
	@Test
	public void deleteTest() {
		log.info("deleteTest......................");
		log.info(bm.delete(101));
		
		//this.getListTest();
	}
	

}