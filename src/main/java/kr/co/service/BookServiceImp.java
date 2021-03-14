package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.BookVO;
import kr.co.mapper.BookMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImp implements BookService{
	
	final private BookMapper bookMapper;
	
	@Override
	public List<BookVO> getList(String book_kategorie) {
		return bookMapper.getList(book_kategorie);
	}

	@Override
	public void register(BookVO book) {
		bookMapper.insert(book);
		
	}

	@Override
	public BookVO get(int book_id) {
		return bookMapper.read(book_id);
	}

	@Override
	public int modify(BookVO book) {
		return bookMapper.update(book);
	}

	@Override
	public int remove(int book_id) {
		return bookMapper.delete(book_id);
	}

	

}
