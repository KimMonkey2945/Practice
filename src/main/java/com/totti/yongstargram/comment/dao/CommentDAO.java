package com.totti.yongstargram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.totti.yongstargram.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(@Param("postId") int postId
							,@Param("userId") int userId
							,@Param("userNickName") String userNickName
							,@Param("content") String content
							,@Param("imagePath") String imagePath);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	public int deletComment(@Param("postId") int postId);
	
}
