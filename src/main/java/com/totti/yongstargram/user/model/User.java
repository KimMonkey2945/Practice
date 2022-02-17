package com.totti.yongstargram.user.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User {

	private int id;
	private String loginId;
	private String password;
	private String name;
	private String nickName;
	private String introduce;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	private Date join;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	public Date getJoin() {
		return join;
	}
	
	public void setJoin(Date join) {
		
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD");
		format.format(now);
		format.format(getCreatedAt());
		
		
		
		
		this.join = join;
	}
	
	
	
	
	
	
}
