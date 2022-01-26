package com.totti.yongstargram.user.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/listView")
	public String listView() {
		return "post/listView";
	}
	
	
}
