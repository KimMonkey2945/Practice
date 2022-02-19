<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl코어 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

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


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Lobster&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<title>회원가입</title>
</head>

<body>

	<div id="signUpView">
		<div class="content">
			<h1 class="MokeysTitle text-center">MonKeys</h1>
				<hr>
			
				<div class="d-flex justify-content-center">
					<div>
						<div class="">
							<input class="form-control" type="text" id="loginIdInput" placeholder="휴대폰 번호 또는 이메일 주소" />
							<div class="duplicateIdNo text-danger">중복 아이디입니다</div>
							<div class="duplicateIdOk text-primary">사용 가능한 아이디입니다</div>
							<input class="mt-2 form-control btn btn-warning" type="button" id="loginIdCheck" value="아이디확인"/>
						</div>
						<input class="form-control my-3"type="text" id="nameInput" placeholder="성명" />
						<input class="form-control my-3" type="text" id="nickNameInput" placeholder="사용자 이름" />
						<input class="form-control my-3" type="password" id="passwordInput" placeholder="비밀번호" />
						<textarea class="form-control my-3" id="introduceInput" placeholder="자기소개"></textarea>
						<button class="form-control btn btn-block btn-warning" id="joinBtn" type="button">가입</button>
					</div>
				</div>
		
		
		</div>
		<div class="mt-3 d-flex content2 align-items-center justify-content-center">
			 Monkeys 회원이신가요??<a class="ml-3" href="/user/signin_view">로그인</a>
		</div>
	</div>
		<footer class=" mt-3 d-flex justify-content-center">
			<div class="small text-secondary">© 2022 Monkeys from KimMonkey</div>
		</footer>

	<script>
		$(document).ready(function(){
			$(".duplicateIdNo").hide();
			$(".duplicateIdOk").hide();
			
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
			
			$("#loginIdCheck").on("click", function(){
				
				let loginId = $("#loginIdInput").val();
				
				if(loginId == ""){
					alert("휴대폰 또는 이메일 주소를 입력하세요!!");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/checkId",
					data:{"loginId":loginId},
					success:function(data){
						if(data.result == "success"){
							$(".duplicateIdOk").show();
							$(".duplicateIdNo").hide();	
						}else{
							$(".duplicateIdNo").show();
							$(".duplicateIdOk").hide();
						}
					},
					error:function(){
						alert("에러발생!!!");
					}
				});
				
				
			});
			
			
		});
	
	
	
	</script>




</body>



</html>