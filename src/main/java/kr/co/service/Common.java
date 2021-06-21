package kr.co.service;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface Common {
	void upload(MultipartFile file, HttpSession session);
	
	//0309 추가
	File download(String filepath, String filename, HttpSession session, HttpServletResponse response);

}
