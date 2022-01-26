<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="d-flex align-items-center justify-content-between">
		<img alt="인스타그램로고" src="">
		<h1 class="yongstarLogo text-center">Yongstargram</h1>
		<div class="col-auto">
	      		<label class="sr-only" for="inlineFormInputGroup">검색</label>
	      	<div class="input-group mb-2">
		        <div class="input-group-prepend">
		          <div class="input-group-text">?</div>
		        </div>
	        	<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="검색">
	     	 </div>
     	 </div>
     	 
     	 <c:choose>
     	 	<c:when test="${not empty userId}">
     	 		<div class="mr-3">${userNickName }님<a href="/user/signOut">로그아웃</a></div>
     	 	</c:when>
     	 	<c:otherwise>
     	 		<div class="mr-3"><a href="/user/signin_view"></a></div>
     	 	</c:otherwise>
     	 </c:choose>
</header>