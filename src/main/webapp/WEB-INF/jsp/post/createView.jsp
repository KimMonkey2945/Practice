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
<title>글 추가하기</title>
</head>
<body>

	<div>
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<hr class="createHr">
		
		<section class="d-flex justify-content-center">
				<div class="createPost">
				
					<div class="createHeader d-flex justify-content-around align-items-center">
						<a href="#"><img class="backArrow" alt="뒤로가기화살표" src="/static/images/arrow.png"/></a>
						<h2>새 게시물 만들기</h2>
						<h3>공유하기</h3>			
					</div>
					
					<hr class="createHr">
					
					<div class="d-flex">
					
					<div>
						<img class="fileImg" alt="파일추가아이콘" src="/static/images/file.png"/>
						<h2 class="text-center">사진 동영상 내파일에서<br>가져오기</h2>
					</div>
					
					<div>
						<div class="mb-5">
							여기에 로그인사람 아이디랑 사진이들어갑니다.
						</div>
						<textarea id="textBox" class="postText" maxlength="300" placeholder="내용을 입력하세요."></textarea>
					<div class="d-flex justify-content-end">
						<p class="textCount">0</p> 
						<p class="textTotal">/300</p>
					</div>
					</div>
					
					</div>
					
					<div class="d-flex justify-content-end mr-4">
						<button class="btn" type="button">저장</button>
					</div>
					
				</div>
	
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script>
	
		$(document).ready(function(){
			$("#textBox").keyup(function(e){
				let content = $(this).val();
				
				if(content.length == 0 || content == ""){
					$(".textCount");
				}else{
					$(".textCount").text(content.length);
				}
				
				if(content.length > 300){
					$(this).val($(this).val().substring(0,300));
				}
			});
		});
	
	
	</script>

</body>
</html>