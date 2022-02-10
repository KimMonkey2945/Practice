package com.totti.yongstargram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.totti.yongstargram.post.bo.PostBO;
import com.totti.yongstargram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired 
	private PostBO postBO;
	
	@GetMapping("/listView")
	public String listView(Model model) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		
		return "post/listView";

	}

	@GetMapping("/createView")
	public String createView() {
		return "post/createView";
	}
	
	@GetMapping("/detailView")
	public String detailView(@RequestParam("postId") int postId, Model model) {
		
		Post post = postBO.getPost(postId);
		model.addAttribute("post", post);
		
		return "post/detailView";
	}
	
	
}