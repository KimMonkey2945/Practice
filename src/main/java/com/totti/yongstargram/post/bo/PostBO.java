package com.totti.yongstargram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.totti.yongstargram.common.FileManagerService;
import com.totti.yongstargram.post.dao.PostDAO;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, filePath);
	}
	
}
