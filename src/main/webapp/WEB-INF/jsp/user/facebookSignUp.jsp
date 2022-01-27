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
		
		<h1>facebook</h1>
		
		<div class="d-flex">
			<img class="instarSignUpLogo" src="/static/images/instarLogo.png" alt="인스타그램로고">
			<div>
				<h3>가입하기</h3>
				<div>빠르고 쉽습니다.</div>
			</div>
		</div>
		
		<hr>
		
		<div>
			<input class="form-control" type="text" value="성姓">
			<input class="form-control" type="text" value="이름(성은 제외)">
			<input class="form-control" type="text" value="휴대폰번호 또는 이메일">
			<input class="form-control" type="text" value="새 비밀번호">
		</div>
		
		

	</div>


</body>
</html>