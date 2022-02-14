package com.totti.yongstargram.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.totti.yongstargram.comment.dao.CommentDAO;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userNickName, String content, String imagePath) {
		return commentDAO.insertComment(postId, userId, userNickName, content, imagePath);
				
	}
}
