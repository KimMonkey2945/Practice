<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gamja+Flower&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<title></title>
</head>
<body>


	<div>
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<hr class="createHr">
		<section class="detatilWrap">
			
			<div class="d-flex justify-content-center align-items-center">
				<div>
					<img class="postImage" alt="게시판이미지" src="${post.imagePath }">
				</div>
				<div class="ml-5">
					<div>
						<c:choose>
							<c:when test="${not empty userId}">	
								<div class="mr-4 mb-4 text-center">
									<a href="">${userNickName}</a>님 오늘도 좋은하루 보내세요.
								</div>
							</c:when>
						</c:choose>
					</div>
					<textarea class="detailTextarea" readonly>${post.content }</textarea>
					<div>
						<textarea class="reply">reply....</textarea>
					</div>
					<div class="d-flex justify-content-end">
						<input class="btn btn-sm" type="button" value="댓글남기기"/>
					</div>
				</div>
			</div>
			
			<c:choose>
				<c:when test="${not empty userId && userId eq post.userId}">
					<div class="my-5 d-flex justify-content-around">
						<input class="btn btn-secondary" type="button" value="수정"/>
						<input id="deleteBtn" data-post-id="${post.id }" class="btn btn-danger" type="button" value="삭제"/>
					</div>
				</c:when>
			</c:choose>
			
		</section>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script>
		
		$(document).ready(function(){
			$("#deleteBtn").on("click", function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"post",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							location.href="/post/listView"
						}else{
							alert("삭제실패")
						}
					},
					error:function(){
						alert("에러발생!!!")
					}
						
				})
			});
			
		});
		
	
	
	
	</script>



</body>
</html>