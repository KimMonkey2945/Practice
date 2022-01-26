package com.totti.yongstargram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.totti.yongstargram.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;

//	@PostMapping("/signUp")
//	public Map<String, String> signUp(@RequestParam("loginId") String loginId
//									,@RequestParam("password") String password
//									,@RequestParam("name") String name
//									,@RequestParam("nickName") String nickName
//									,@RequestParam(value="introduce", required= false) String introduce){  //비 필수 파라미터 설정하는 것처럼 하기.....
//		
//	int count = userBO.addUser(loginId, password, name, nickName, introduce);
//	Map<String, String> result = new HashMap<>();
//	
//	if(count == 1) {
//		result.put("result", "success");
//	}else {
//		result.put("result", "fail");
//	}
//	
//	return result;

	@PostMapping("/signUp")
	public Map<String, String> signUp(Model model,
			@RequestParam(value = "introduce", required = false) String introduce) { // 비 필수 파라미터 설정하는 것처럼 하기.....

		int count = userBO.addUser(introduce);
		Map<String, String> result = new HashMap<>();

		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}

		return result;
	}
}
