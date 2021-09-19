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
<title>게시판</title>
<style type="text/css">
</style>
</head>
<body>
<center>
	<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
	<div class="board">
		<h2>게시판</h2>
		<input type="button" onclick="location.href='boardDetail.jsp'"
			value="글 추가">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="board">
					<tr>
						<td><c:out value="${board.id}"/></td>
						<td id=title><a href="/finalProject/BoardController?action=detail&title=${board.id}"><c:out value="${board.title}" /></a></td>
						<td><c:out value="${board.author}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.date}" /></td>
						<c:if test="${!empty manager}">
						<td><a href="/finalProject/BoardController?action=deleteBoard&delete=${board.id}">글 삭제</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>