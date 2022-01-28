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

<title>페이스북으로 로그인</title>
</head>
<body>


	<div class="facebookLoginWrap">
		
		<header class="facebookLoginHeader d-flex align-items-center">
			<h1 class="ml-3 facebookTitle">facebook</h1>
			<button class="ml-2 btn btn-success" type="button">새 계정 만들기</button>
		</header>
		
		<div class="mt-4 d-flex justify-content-center">
			<div class="loginPart d-flex justify-content-center">
					<form id="loginForm">
						<div class="mt-2 text-center">Facebook에 로그인</div>
						<input class="form-control my-3" type="text" id="loginIdInput" placeholder="휴대폰 번호 또는 이메일 주소" />
						<input class="form-control my-3" type="password" id="passwordInput" placeholder="비밀번호" />
						<button class="facebookloginBtn form-control my-4 btn btn-block" type="submit">로그인</button>
						
						<div class="text-center my-3"><a href="">계정을 잊으셨나요??</a></div>
						
						<div class="d-flex my-3">
							<hr>또는<hr>
						</div>
							<div class="text-center"><button class="btn btn-success" type="button">새 계정 만들기</button></div>
							<div class="mt-1 text-center"><a href="/user/signin_view">나중에하기</a></div>
					</form>
			</div>
		
		</div>
	</div>
		
		<footer>
			<div class="mt-5 small text-center">Meta © 2022</div>
		</footer>






</body>
</html>