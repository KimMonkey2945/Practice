package com.totti.yongstargram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	//순서가 틀려서 한참 고민함..... 멍청이였음...
	public int insertLike(@Param("postId") int postId
						,@Param("userId") int userId
						);
	
	public int deleteLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int selectLikeCount(@Param("postId") int postId);
	
	public int selectLikeCountByUserId(@Param("postId") int postId
									,@Param("userId") int userId);
	
	
	
}
