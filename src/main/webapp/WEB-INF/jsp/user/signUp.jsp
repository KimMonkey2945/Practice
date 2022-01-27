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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<title>회원가입</title>
</head>

<body>

	<div id="signUpView">
		<div class="content">
			<h1 class="yongstarLogo text-center">Yongstargram</h1>
			<div class="information text-center display-5 text-secondary">
				친구들의 사진과 동영상을 보려면<br>가입하세요
			</div>
			<div class="d-flex justify-content-center">
					<button class="facebookSigninBtn btn btn-primary text-light">
						<img class="mr-2 facebookLogo" src="/static/images/facebookLogo.png" alt="페이스북로고" />
						<a href="/user/facebookSignIn_View" class="facebookSigninBtn text-center text-light">Facebook으로 로그인</a>
					</button>
			</div>
			<div class="d-flex">
				<hr>
				또는
				<hr>
			</div>
			
				<div class="d-flex justify-content-center">
					<div>
						<input class="form-control" type="text" id="loginIdInput" placeholder="휴대폰 번호 또는 이메일 주소" />
						<input class="form-control my-2"type="text" id="nameInput" placeholder="성명" />
						<input class="form-control my-2" type="text" id="nickNameInput" placeholder="사용자 이름" />
						<input class="form-control my-2" type="password" id="passwordInput" placeholder="비밀번호" />
						<textarea class="form-control my-2" id="introduceInput" placeholder="자기소개"></textarea>
						<button class="form-control btn btn-block btn-primary" id="joinBtn" type="button">가입</button>
					</div>
				</div>
		
		
		</div>
		<div class="mt-3 d-flex content2 align-items-center justify-content-center">
			계정이 있으신가요?<a class="ml-3" href="/user/signin_view">로그인</a>
		</div>
		
		<div class="text-center">앱을 다운로드하세요.</div>
		<div class="mt-4 d-flex align-items-center justify-content-center">			 
			<a href="https://apps.apple.com/app/instagram/id389801252?vt=lo"><img alt="애플스토어이미지" src="/static/images/applestore.png"></a> 
			<a href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb&utm_campaign=loginPage&ig_mid=67D3F259-AE2C-46A5-81EA-19E7F2054EF7&utm_content=lo&utm_medium=badge"><img class="ml-2" alt="구글플레이스토어이미지" src="/static/images/googlestore.png"></a>
		</div>
		<footer class=" mt-3 d-flex justify-content-center">
			<div class="small text-secondary">© 2022 Instagram from Meta</div>
		</footer>

	</div>

	<script>
		$(document).ready(function(){
			
			$("#joinBtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();	
				var name = $("#nameInput").val();
				var nickName = $("#nickNameInput").val();
				var introduce = $("#introduceInput").val();
				
				
				if(loginId == ""){
					alert("휴대폰 또는 이메일 주소를 입력하세요!!");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요!!");
					return;
				}
				if(name == ""){
					alert("이름 입력하세요!!");
					return;
				}
				if(nickName == ""){
					alert("별명을 입력하세요!!");
					return;
				}
				
				
				$.ajax({
					type:"post",
					url:"/user/signUp",
					data:{"loginId":loginId, "password":password, "name":name, "nickName":nickName, "introduce":introduce},
					success:function(data){
						if(data.result == "success"){
							location.href="/user/signin_view";
						}else{
							alert("회원가입 실패!!");
						}
					},
					error:function(){
						alert("에러발생!!");
						}
					
				});	
				
				
				
				
				
				
			});
		});
	
	
	
	</script>




</body>



</html>