<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/product.css" rel="stylesheet">
<meta charset="UTF-8">
<title>${product.name}상품</title>
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
<center>
	<div class="product">
		<img src="img/shirts.jpg" alt="A상품" width="300px">
		</div>
		<div class="product">
		<form action="/finalProject/OrderController?action=order&product=${product.name}" method="post">
		<table>
			<tr>
				<td>상품명</td>
				<td>${product.name}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${product.price}</td>
			</tr>
			<tr>
				<td>색상</td>
				<td>${product.color}</td>
			</tr>
			<tr>
				<td>잔여수량</td>
				<td>${product.quentity}</td>
			</tr>
			<tr>
				<td>수량선택</td>
				<td><input type="number" name="quentity"></td>
			</tr>
			<tr>
				<td colspan="2"><input value="구매하기"
				type="submit"class="btn"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>