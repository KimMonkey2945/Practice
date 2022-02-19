package com.totti.yongstargram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.totti.yongstargram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam(value = "file", required = false) MultipartFile file
			,@RequestParam("content") String content
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String nickName = (String)session.getAttribute("userNickName");
		
		int count = postBO.addPost(userId, nickName, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
//	@PostMapping("/delete")
//	public Map<String, String> postDelete(@RequestParam("postId") int postId){
//		
//		int count = postBO.deletePost(postId);
//		Map<String, String> result = new HashMap<>();
//		
//		if(count == 1) {
//			result.put("result", "success");
//		}else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//	}
	
	@GetMapping("/delete")
	public Map<String, String> delete(@RequestParam("postId") int postId,
									HttpServletRequest request){
		
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.deletePost(postId, userId);

		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
}
