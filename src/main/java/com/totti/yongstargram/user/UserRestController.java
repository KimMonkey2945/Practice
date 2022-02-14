package com.totti.yongstargram.user;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.totti.yongstargram.user.bo.UserBO;
import com.totti.yongstargram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;

	@PostMapping("/signUp")
	public Map<String, String> signUp(@RequestParam("loginId") String loginId
									,@RequestParam("password") String password
									,@RequestParam("name") String name
									,@RequestParam("nickName") String nickName
									,@RequestParam(value="introduce", required=false) String introduce){  //비 필수 파라미터 설정하는 것처럼 하기.....
		
	int count = userBO.addUser(loginId, password, name, nickName, introduce);
	Map<String, String> result = new HashMap<>();
	
	if(count == 1) {
		result.put("result", "success");
	}else {
		result.put("result", "fail");
	}
	
	return result;

	}
	
	@PostMapping("/signIn")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpServletRequest request){
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userNickName", user.getNickName());
			session.setAttribute("userIntroduce", user.getIntroduce());
			session.setAttribute("userCreatedAt", user.getCreatedAt());
			session.setAttribute("imagePath", user.getImagePath());
			session.setAttribute("loginId", user.getLoginId());
			
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	@PostMapping("/update")
	public Map<String, String> updateUser(
			@RequestParam(value="NickName", required=false) String nickName
			,@RequestParam(value="introduce", required=false) String introduce
			,@RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.updateUser(userId, nickName, introduce, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}