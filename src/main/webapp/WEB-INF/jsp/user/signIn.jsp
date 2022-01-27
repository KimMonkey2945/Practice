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

<title>로그인</title>
</head>
<body>


	<div id="loginView">
		<div class="d-flex justify-content-center mt-3">
		
			<div>
				<img class="loginImage" id="loginImg" src="/static/images/loginBanner1.png" alt="인스타그램이미지"/>		
			</div>
		
		<div class="ml-5">
			<div class="login">
				<h1 class="yongstarLogo text-center">Yongstargram</h1>
				<div class="d-flex justify-content-center">
					<div>
						<div>
							<form id="loginForm">
								<input class="form-control my-4" type="text" id="loginIdInput" placeholder="휴대폰 번호 또는 이메일 주소" />
								<input class="form-control my-4" type="password" id="passwordInput" placeholder="비밀번호" />
								<button class="form-control my-4 btn btn-block btn-primary" type="submit">로그인</button>
							</form>
						</div>
						
						<div class="d-flex">
							<hr>또는<hr>
						</div>
						<div class="d-flex justify-content-center">
							<img class="facebookLogo" src="/static/images/facebookLogo.png" alt="페이스북로고" />
							<a href="/user/facebookSignIn_View" class="facebookSigninBtn text-center text-primary">Facebook으로 로그인</a>
						</div>
							<div class="text-center">비밀번호를 잊으셨나요??</div>				
					</div>
				</div>
			</div>
					<div class="mt-3 d-flex content2 align-items-center justify-content-center">
					계정이 없으신가요? <a class="ml-2" href="/user/signup_view">가입하기</a>
					</div>
				
			
			<div class="text-center">앱을 다운로드하세요.</div>
			<div class="mt-4 d-flex align-items-center justify-content-center">			 
				<a href="https://apps.apple.com/app/instagram/id389801252?vt=lo"><img alt="애플스토어이미지" src="/static/images/applestore.png"></a> 
				<a href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb&utm_campaign=loginPage&ig_mid=67D3F259-AE2C-46A5-81EA-19E7F2054EF7&utm_content=lo&utm_medium=badge"><img class="ml-2" alt="구글플레이스토어이미지" src="/static/images/googlestore.png"></a>
			</div>
			
			
			</div>
		</div>	
	</div>

			<c:import url="/WEB-INF/jsp/include/footer.jsp"/>


	<script>
	
		$(document).ready(function(){
			$("#loginForm").on("submit",function(e){
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == ""){
					alert("휴대폰번호 또는 이메일주소를 입력하세요!");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요!");
					return;
				}
				
			$.ajax({
				type:"post",
				url:"/user/signIn",
				data:{"loginId":loginId, "password":password},
				success:function(data){
					if(data.result == "success"){
						location.href="/post/listView";
					}else{
						alert("아이디/비밀번호를 확인하세요!!!");	
					}
				},
				error:function(){
					alert("에러발생!!!!!")
				}
				
				
			});
				
				
			});
			
			var loginBannerList = ["/static/images/loginBanner1.png", "/static/images/loginBanner2.png", "/static/images/loginBanner3.png"]
			var currentImageIndex = 0;
			
			setInterval(function(){
				$("#loginImg").attr("src", loginBannerList[currentImageIndex]);
				currentImageIndex++;
				if(currentImageIndex == loginBannerList.length){
					currentImageIndex = 0;
				}
			}, 3000);
			
			
		});
	
	</script>

















</body>
</html>