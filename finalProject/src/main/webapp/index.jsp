<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link href="style/main.css" rel="stylesheet">
<link href="style/index.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
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
				<a href="<c:url value="/UserController?action=logout"/>">로그아웃</a>
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
	<c:choose>
		<c:when test="${!empty manager}">
			<center>
				<div class="manager" id="addp">
					<a href="<c:url value="addProduct.jsp"/>">상품추가</a>
				</div>
				<div class="manager" id="prol">
					<a href="<c:url value="/ProductController?action=showProduct"/>">상품
						관리</a>
				</div>
				<br> <br>
				<div class="manager" id="bo">
					<a href="<c:url value="/BoardController?action=BoardList"/>">게시판
						관리</a>
				</div>
				<div class="manager" id="custom">
					<a href="<c:url value="/UserController?action=showUsers"/>">회원
						관리</a>
				</div>
			</center>
		</c:when>
		<c:otherwise>
			<div id="product">
				<ul>
					<c:forEach items="${product}" var="product">
						<li><a
							href="ProductController?action=page&product=${product.name}"><figure>
									<img src="img/shirts.jpg"></a>
							<figcaption>${product.name}상품</figcaption>
							</figure></li>
					</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>