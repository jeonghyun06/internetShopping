<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style/main.css" rel="stylesheet">
<link href="style/board.css" rel="stylesheet">
<title>상품목록</title>
</head>
<body>
<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
	<center>
	<div class="productL">
		<h2>상품 추가</h2>
		<input type="button" onclick="location.href='addProduct.jsp'"
			value="상품 추가">
		<table>
			<thead>
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>색상</th>
					<th>가격</th>
					<th>상품 삭제</th>
					<th>상품 수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${product}" var="product">
					<tr>
						<td id=title><c:out value="${product.name}" /></td>
						<td><c:out value="${product.quentity}" /></td>
						<td><c:out value="${product.color}" /></td>
						<td><c:out value="${product.price}원" /></td>
						<c:if test="${!empty manager}">
						<td><a href="ProductController?action=deleteProduct&name=${product.name}">상품 삭제</a></td>
						<td><a href="ProductController?action=update&name=${product.name}">상품 수정</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>