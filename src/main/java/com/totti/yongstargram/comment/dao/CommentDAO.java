package com.totti.yongstargram.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public int insertComment(@Param("postId") int postId
							,@Param("userId") int userId
							,@Param("userNickName") String userNickName
							,@Param("content") String content
							,@Param("imagePath") String imagePath);
	
}
