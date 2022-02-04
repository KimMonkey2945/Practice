package com.totti.yongstargram.post;

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
	
	@GetMapping("/createView")
	public String createView() {
		return "post/createView";
		}
	
	
	}
	
	
