<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl코어 라이브러리 -->
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
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
<title>회원가입</title>
</head>

<body>

	<div id="wrap" class="bg-warning">
		<div class="content">
			<h1 class="yongstarLogo">Yongstargram</h1>
			<div class="information display-5 text-secondary">친구들의 사진과 동영상을 보려면<br>가입하세요</div>
			<a>
				<button class="facebookSigninBtn btn">
					<img class="facebookLogo" src="/img/facebookLogo.png" alt="페이스북로고"/>Facebook으로 로그인
				</button>
			</a>
			<div class="d-flex">
				<hr>또는<hr>
			</div>
			<input class="form-control" type="text" placeholder="휴대폰 번호 또는 이메일 주소"/>
			<input class="form-control" type="text" placeholder="성명"/>
			<input class="form-control" type="text" placeholder="사용자 이름"/>
			<input class="form-control" type="password" placeholder="비밀번호"/>
			<textarea class="form-control" placeholder="자기소개"></textarea>
			<button class="form-control btn" type="button">가입</button>
		</div>
		<div class="mt-3 d-flex content2 align-items-center justify-content-center">
			계정이 있으신가요?<a href="#">로그인</a>
		</div>
		<div class="mt-3 d-flex align-items-center justify-content-center">
			앱을 다운로드하세요.
			<img alt="" src="">
			<img alt="" src="">
		</div>
	</div>





</body>



</html>