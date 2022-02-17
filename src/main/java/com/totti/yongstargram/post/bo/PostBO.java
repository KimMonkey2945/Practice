package com.totti.yongstargram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.totti.yongstargram.comment.bo.CommentBO;
import com.totti.yongstargram.comment.model.Comment;
import com.totti.yongstargram.common.FileManagerService;
import com.totti.yongstargram.like.bo.LikeBO;
import com.totti.yongstargram.post.dao.PostDAO;
import com.totti.yongstargram.post.model.Post;
import com.totti.yongstargram.post.model.PostDetail;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId,String nickName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, nickName, content, filePath);
	}
	
	public List<Post> getPostList(){
		return postDAO.selectPostList();
	}
	
	public Post getPost(int postId){
		return postDAO.selectPost(postId);
	}
	
	public int deletePost(int postId) {
		Post post = postDAO.selectPost(postId);
		FileManagerService.removeFile(post.getImagePath());
		
		return postDAO.deletePost(postId);
	}
	
	public List<PostDetail> getPostList(int userId){
		// post리스트 가져오기
		// post 대응하는 댓글 좋아요 가져오기 
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		//BO끼리는 서로 객체를 가져오는게 자연스러운 것임.
		//DAO를 바로 가져온다고 생각 할 수 있지만 구조적으로 가능하지 않고 BO를 바로 가져와야함.
		
		for(Post post:postList) {
			//해당하는 post id로 댓글 가져오기
			
		List<Comment> commentList = commentBO.getCommentList(post.getId());
		
		int likeCount = likeBO.getLikeCount(userId);
		boolean isLike = likeBO.isLike(post.getId(), userId);		
		
		//post와comment를 매칭시키기 위해 새로 만듬. entity dto
		PostDetail postDetail = new PostDetail();
		postDetail.setPost(post);
		postDetail.setCommentList(commentList);
		postDetail.setLikeCount(likeCount);
		postDetail.setLike(isLike);
		//여러개의 데이터를 저장하기위해 리스트를 만든다. 그전까지는 mybatis가 만들어주고 지금은 내가 새로 만든 것이기 때문에 새로 리스트 생성
		postDetailList.add(postDetail);
		
		}
		return postDetailList;
		
//		return postDAO.selectPostList();
	}
}
