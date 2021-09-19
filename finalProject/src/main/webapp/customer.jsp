<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/board.css" rel="stylesheet">
<meta charset="UTF-8">
<title>고객 목록</title>
</head>
<body>
	<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
<center>
	<table class="board">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${user}" var="user">
				<tr>
					<td><c:out value="${user.name}" /></td>
					<td><c:out value="${user.id}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><a
						href="/finalProject/UserController?action=delete&delete=${user.id}">회원
							삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>