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

<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gamja+Flower&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<title></title>
</head>
<body>

	<div class="listWrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<hr class="createHr">

		<section class="d-flex justify-content-center">
			<c:choose>
				<c:when test="${not empty userId}">
					<div class="mr-3">
						<a href="/post/createView">
							<button class="createBtn btn" type="button">글쓰기</button>
						</a>
					</div>
				</c:when>
			</c:choose>
			
			<div class="">
				<c:forEach var="postDetail" items="${postList }" >
					<!--  피드  -->
					<div class="card rounded mb-4">
						<!-- 타이틀 -->
						<div class="d-flex justify-content-between p-2 border-bottom">
							<div>
								<img src="">
								${postDetail.post.nickName }
							</div>
							<div class="more-icon" >
								<a class="text-dark moreBtn" href="#" data-toggle="modal" data-target="#exampleModalCenter"> 
									<i class="bi bi-three-dots-vertical"></i> 
								</a>
							</div>
						</div>
						<!--이미지 -->
						<div>
							<img src="${postDetail.post.imagePath }" class="w-100 imageClick">
						</div>
						
						<!--  content -->
						<div class="middle-size text-center m-2">
							 ${postDetail.post.content }
						</div>
						
						<!-- 좋아요 -->
						<div class="m-2">
							<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }">
							<c:choose>
								<c:when test="${postDetail.like }">
										<i class="bi bi-heart-fill heart-icon text-danger"></i>
								</c:when>
								<c:otherwise>
										<i class="bi bi-heart heart-icon text-dark"></i>
								</c:otherwise>
							</c:choose>
							</a>
							<span class="middle-size ml-1"> 좋아요 ${postDetail.likeCount}개 </span>
						</div>
						
						
						<!--  댓글 -->
						
						<div class="mt-2">
							<div>
								<div class=" border-bottom m-1">
							</div>
								<!-- 댓글 타이틀 -->
								<div  class="middle-size ml-2">
									댓글
								</div>
							</div>
							
							<!--  댓글  -->
							<div class="middle-size m-2">
								<c:forEach var="comment" items="${postDetail.commentList }">
								<div class="mt-2">
									<b class="mr-2">${comment.nickName }</b> ${comment.content }
								</div>
								</c:forEach>
								
							</div>
							<!--  댓글  -->
							
							<!-- 댓글 입력 -->
							<div class="d-flex mt-2 border-top">
								<input type="text" class="form-control border-0 bin" id="commentInput${postDetail.post.id }">
								<button class="btn btn-info ml-2 commentBtn" data-post-id="${postDetail.post.id }">게시</button>
							</div>
							<!-- 댓글 입력 -->
						</div>
						<!--  댓글 -->
					</div>
					</c:forEach>
				</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script>
		
		$(document).ready(function() {

			$(".commentBtn").on("click", function() {
				// postId, content
				let postId = $(this).data("post-id");
				// "#commentInput5"
				let content = $("#commentInput" + postId).val();
				
				
				$.ajax({
					type:"post",
					url:"/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
						
					}, error:function() {
						alert("에러!!");
					}
					
				});
				
			});
			
			$(".likeBtn").on("click", function(e) {
				e.preventDefault();
				// 새로고침방지
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						
						location.reload();	
						
					}, error:function() {
						
						alert("좋아요 에러!!");
					}
					
				});
				
			});
			
			$(".unlikeBtn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
						
					}, error:function() {
						alert("좋아요 취소 실패!!");
					}
					
				});
			});
		});
	</script>

</body>
</html>