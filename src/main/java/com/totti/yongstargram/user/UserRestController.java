package com.totti.yongstargram.user;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@PostMapping("/signUp")
	public Map<String, String> signUp(@RequestParam("loginId") String loginId
									,@RequestParam("password") String password
									,@RequestParam("name") String name
									,@RequestParam("nickName") String nickName
									,@RequestParam(value="introduce", required= false) String introduce){  //비 필수 파라미터 설정하는 것처럼 하기.....
		
	}
	
}
