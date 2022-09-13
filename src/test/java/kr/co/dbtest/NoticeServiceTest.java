package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.NoticeVO;
import kr.co.service.NoticeService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTest {
	
	@Autowired
	NoticeService ns;
	
	@Test
	public void getListTest() {
		log.info("getListTest.....................");
		List<NoticeVO> vo = ns.getList();
		
		for(NoticeVO noticeVO : vo) {
			log.info(noticeVO);
		}
	}
	
	@Test
	public void registerTest() {
		log.info("registerTest......................");
		NoticeVO vo = new NoticeVO();
		vo.setTitle("새글제목 registerTest 10");
		vo.setContent("새글제목 registerTest 10");
		vo.setWriter("작성자 registerTest 10");
		log.info(vo);
		
		ns.register(vo);
		this.getListTest();
	}
	
	@Test
	public void registerSelectKeyTest() {
		log.info("registerSelectKeyTest......................");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle("새글 registerSelectKeyTest 20");
		vo.setContent("새글 registerSelectKeyTest 20");
		vo.setWriter("작성자 registerSelectKeyTest 20");
		log.info(vo);
		
		long bno = ns.registerSelectKey(vo);
		log.info(bno);
		this.getListTest();
	}
	
	@Test
	public void getTest() {
		log.info("getTest......................");
		log.info(ns.get(1L));
	}
	
	@Test
	public void modifyTest() {
		log.info("modifyTest......................");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle("수정제목 updateTest 10");
		vo.setContent("수정내용 updateTest 10");
		vo.setBno(2L);
		log.info(vo);
		
		log.info(ns.modify(vo));
		
		this.getListTest();
	}
	
	@Test
	public void removeTest() {
		log.info("removeTest......................");
		log.info(ns.remove(6L));
		
		this.getListTest();
	}
	

}