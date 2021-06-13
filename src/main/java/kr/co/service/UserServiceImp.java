package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.UserVO;
import kr.co.mapper.UserMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImp implements UserService{
	
	final private UserMapper usermapper;

	@Override
	public List<UserVO> getList() {
		return usermapper.getList();
	}
	
	@Override
	public UserVO readUser(int user_number) {
		return usermapper.getUser(user_number);
	}
	
	

	@Override
	public void join(UserVO user) {
		usermapper.insert(user);

	}

	@Override
	public boolean idcheck(String user_id) {
		return usermapper.idcheck(user_id) == 0 ;
	}

	@Override
	public UserVO login(UserVO User) {
		return usermapper.read(User);
	}

	@Override
	public void modify(UserVO user) {
		usermapper.update(user);
	}

	@Override
	public void remove(int user_number) {
		usermapper.delete(user_number);
	}

}
