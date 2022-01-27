package com.totti.yongstargram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup_view")
	public String signUpView() {
		return "user/signUp";
	}
	
	@GetMapping("/signin_view")
	public String signin_view() {
		return "user/signIn";
	}
	
	@GetMapping("/signOut")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userNickName");
		
		return "redirect:/user/signin_view";		
	}
	
	@GetMapping("/facebookSignIn_View")
	public String facebookSignIn() {
		return "user/facebookSignIn";
	}
	
	@GetMapping("/facebookSignUp_View")
	public String facebookSignUp() {
		return "user/facebookSignUp";
	}
	
}
