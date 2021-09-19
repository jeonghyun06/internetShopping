<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style/main.css" rel="stylesheet">
<link href="style/board.css" rel="stylesheet">
<title>주문내역</title>
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
	<div class="board">
		<h2>주문내역</h2>
		<table>
			<thead>
				<tr>
					<th>고객명</th>
					<th>상품명</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${order}" var="order">
				<c:if test="${order.customer eq sessionId}">
					<tr>
						<td><c:out value="${order.customer}" /></td>
						<td><c:out value="${order.product}" /></td>
						<td><c:out value="${order.quentity}" /></td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		</div>
</body>
</html>