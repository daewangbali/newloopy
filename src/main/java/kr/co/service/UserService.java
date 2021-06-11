package kr.co.service;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserService {
	
	public List<UserVO> getList();
	
	public UserVO readUser(int user_number);
	
	public void join(UserVO user);
	
	public boolean idcheck(String user_id);
	
	//public void joinSelectKey(UserVO user);
	
	public UserVO login(UserVO User);
	//
	public void modify(UserVO user);
	//
	//public int delete(int user_number);
	
}
