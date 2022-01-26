package com.totti.yongstargram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.totti.yongstargram.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(@Param("loginId") String loginId
					,@Param("password") String password
					,@Param("name") String name
					,@Param("nickName") String nickName
					,@Param("introduce") String introduce);

	public User selectUser(@Param("loginId") String loginId
							,@Param("password") String password);
}
