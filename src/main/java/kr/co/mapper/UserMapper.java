package kr.co.mapper;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> getList();
	
	//로그인 정보
	public UserVO getUser(int user_number);
	
	public void insert(UserVO user);
	
//	public void insertSelectKey(UserVO user);
	
//	public UserVO read(Map<String, String> user);
	public UserVO read(UserVO user);
	
	public int update(UserVO user);
	
	public int delete(int user_number);
	
	public Long idcheck(String user_id);
	
//	public Long pwcheck(String user_pw);

}
