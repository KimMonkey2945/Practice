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

<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gamja+Flower&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">


<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<title>회원정보 수정</title>
</head>
<body>
	<div class="myInfoUpdateWrap">
		<c:choose>
				<c:when test="${not empty userId}">
					<div>
						<c:import url="/WEB-INF/jsp/include/header.jsp" />
						<hr class="createHr">
						
						<section>
							<div class="d-flex justify-content-center">
								<div>
									<div class="text-center">대표 이미지를 바꾸시겠어요?</div>
									<img class="infoImage" alt="" src="/static/images/banana.png">
									<input class="d-none" type="file" value="올리기" id="infoImageFile"/>
								</div>
								<div class="ml-5">
									<div>
										<label>별명을 바꾸시겠어요?</label>
										<input class="updateNickName form-control mb-2" id="updateNickName" type="text" placeholder="${userNickName}"/>
									</div>
								
									<div>
										<label>자기소개를 바꾸시겠어요?</label>
										<textarea class="form-control updateIntroduce" id="updateUserIntroduce" maxlength="300" placeholder="${userIntroduce}"></textarea>
										<div class="d-flex justify-content-end">
											<p class="textCount">0</p>
											<p class="textTotal">/300</p>
										</div>
									</div>
									<div class="d-flex justify-content-end mt-3">
										<input id="updateMyInfo" class="btn" type="button" value="수정"/>
									</div>
								</div>
							</div>
						</section>
						
						<c:import url="/WEB-INF/jsp/include/footer.jsp" />
					</div>
				</c:when>
			</c:choose>
		</div>	
			<script>
				$(document).ready(function(){
					$(".infoImage").on("click", function(){
						$("#infoImageFile").click();
					});
					
					$("#updateUserIntroduce").keyup(function(e) {
						
						let content = $(this).val();

						if (content.length == 0 || content == "") {
							$(".textCount");
						} else {
							$(".textCount").text(content.length);
						}

						if (content.length > 300) {
							$(this).val($(this).val().substring(0, 300));
						}
					});
					
					
					$("#updateMyInfo").on("click", function(){
					
						let nickName = $("#updateNickName").val();
						let introduce = $("#updateUserIntroduce").val().trim();
						let file = $("#infoImageFile").val();
						
						var formData = new FormData();
						formData.append("file", $("#infoImageFile")[0].files[0]);
						formData.append("nickName", nickName);
						formDate.append("introduce", introduce);
						
						$.ajax({
							type:"post",
							url:"/user/update",
							data: formData,
							enctype : "multipart/form-data",
							processData : false,
							contentType : false,
							success : function(data) {
								if (data.result == "success") {
									location.href = "/user/myInfow";
								} else {
									alert("등록 실패!!!")
								}
							},
							error : function() {
								alert("에러발생!!!")
							}
								
						});
					});
					
				});
			</script>


</body>
</html>