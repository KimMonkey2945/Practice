package com.totti.yongstargram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.totti.yongstargram.common.EncryptUtils;
import com.totti.yongstargram.user.dao.UserDAO;
import com.totti.yongstargram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String nickName, String introduce) {
		
		//암호화
		String encPassword = EncryptUtils.md5(password);
		
	return userDAO.insertUser(loginId, encPassword, name, nickName, introduce);
	}
	
	public User getUser(String loginId, String password ) {
		
		
		return	userDAO.selectUser(loginId, EncryptUtils.md5(password));
	}
	
}
