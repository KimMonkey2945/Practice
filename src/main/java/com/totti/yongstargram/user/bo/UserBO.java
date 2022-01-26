package com.totti.yongstargram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.totti.yongstargram.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	public int addUser(String introduce) {
	return userDAO.insertUser(introduce);
	}
	
}
