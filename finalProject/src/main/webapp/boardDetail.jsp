<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/board.css" rel="stylesheet">
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
	<div id="login">
		<c:choose>
			<c:when test="${empty sessionId}">
				<a href="<c:url value="login.jsp"/>">로그인/회원가입 </a>
			</c:when>
			<c:otherwise>
				[${sessionId}님]
				<a href="<c:url value="/finalProject/UserController?action=logout"/>">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="board">
		<a href="/finalProject/BoardController?action=BoardList">게시판</a>
	</div>
	<c:if test="${!empty sessionId}">
		<div id="update">
			<a href="/finalProject/UserController?action=update">회원정보수정</a>
		</div>
	</c:if>
	<center>
	<div id="bo">
		<form action="/finalProject/BoardController?action=addBoard"
			method="post">
			제목 : <input type="text" size=200 name="title" class="title"><br> 내용 :
			<input type="textarea" name="content" id="textarea"><br> <input
				type="submit" value="글 올리기"> <input type="button"
				onclick="location.href='/finalProject/BoardController?action=BoardList'"
				value="등록 취소">
		</form>
	</div>
</body>
</html>