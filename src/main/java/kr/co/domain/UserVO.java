package kr.co.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	
	private int user_number,user_del_yn;
	private String user_id, user_pw, user_name,user_hp1,user_hp2,user_hp3, user_email, user_zipcode, user_roadAddress, user_jibunAddress, user_namujiAddress, 
			user_birthY, user_birthM, user_birthD;
	private Date user_joinDate;
}

