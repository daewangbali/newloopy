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
		vo.setBook_title("다락원 일본어 독해");
		vo.setBook_writer("코가 마키코");
		vo.setBook_publisher("다락원");
		vo.setBook_price(12000);
		vo.setBook_kategorie("외국어");
		vo.setBook_intro("다락원 일본어 시리즈의 독해 버전 개념으로 새롭게 출간되는 독해 일본어 시리즈. 게임이나 패션 등 우리 생활에 가까운 주제부터, 일본의 옛날이야기나 위인전, 동물보호와 같은 사회문제까지 폭넓게 다루고 있다.");
		vo.setFileName("/resources/img/다락원독해.jpg");
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
		log.info(bm.delete(61));
		
		this.getListTest();
	}
	

}