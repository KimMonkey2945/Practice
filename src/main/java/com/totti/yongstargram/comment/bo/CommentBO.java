package com.totti.yongstargram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.totti.yongstargram.comment.dao.CommentDAO;
import com.totti.yongstargram.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;

	public int addComment(int postId, int userId, String userNickName, String content, String imagePath) {
		return commentDAO.insertComment(postId, userId, userNickName, content, imagePath);
	}

	// postId로 댓글 리스트 가져오기
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
	}

	public int deleteComment(int postId) {
		return commentDAO.deletComment(postId);
	}
}
