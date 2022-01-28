<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl코어 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
<title>페이스북 회원가입</title>
</head>
<body>

	<div class="facebookSignUp">
		
		<h1 class="text-primary">facebook</h1>
		
		<div class="d-flex">
			<img class="instarSignUpLogo" src="/static/images/instarLogo.png" alt="인스타그램로고">
			<div>
				<h3>가입하기</h3>
				<div>빠르고 쉽습니다.</div>
			</div>
		</div>
		
		<hr class="instarHr">
		
		<div>
			<input class="form-control" type="text" value="성姓" id="lastNameInput">
			<input class="form-control" type="text" value="이름(성은 제외)" id="nameInput">
			<input class="form-control" type="text" value="휴대폰번호 또는 이메일" id="loginId">
			<input class="form-control" type="text" value="새 비밀번호" id="passwordInput">
			
			<div>생일</div>
			<div class="d-flex justify-cotnen-between">
				<select class="form-control" id="yearInput"></select> 
				<select class="form-control"  id="monthInput"></select> 
				<select class="form-control" id="dayInput"></select>
			</div>
			
			<div>성별</div>
			<div class="">
				<label>여성<input class="form-control" name="sex" type="radio"></label>
				<label>남성<input class="form-control" name="sex" type="radio"></label>
				<label>직접지정<input class="form-control" name="sex" type="radio"></label>
			</div>
			
		</div>
		
		

	</div>


	<script>
	
	$(document).ready(function(){ 
		
		var now = new Date();
		var year = now.getFullYear(); 
		var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
		var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());
		
		//년도 selectbox만들기 
		for(var i = 1900 ; i <= year ; i++) { $('#yearInput').append('<option value="' + i + '">' + i + '</option>'); } 
		// 월별 selectbox 만들기 
		for(var i=1; i <= 12; i++) { var mm = i > 9 ? i : "0"+i ; $('#monthInput').append('<option value="' + mm + '">' + mm + '월</option>'); } 
		// 일별 selectbox 만들기 
		for(var i=1; i <= 31; i++) { var dd = i > 9 ? i : "0"+i ; 
		$('#dayInput').append('<option value="' + dd + '">' + dd+ '</option>'); } 
		$("#yearInput > option[value="+year+"]").attr("selected", "true"); 
		$("#monthInput > option[value="+mon+"]").attr("selected", "true"); 
		$("#dayInput > option[value="+day+"]").attr("selected", "true"); 
		
		
		
		
		
		
		
		
		
		
		
	});

	
	
	</script>
	
	

</body>
</html>