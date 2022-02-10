package com.totti.yongstargram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.totti.yongstargram.common.FileManagerService;
import com.totti.yongstargram.post.dao.PostDAO;
import com.totti.yongstargram.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, filePath);
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
}
