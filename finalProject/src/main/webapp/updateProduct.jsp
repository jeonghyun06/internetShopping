<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/product.css" rel="stylesheet">
<meta charset="UTF-8">
<title>상품 추가</title>
</head>
<body>

<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
<center>
<div class="product">
<h2>상품 수정</h2>
            <form action="/finalProject/ProductController?action=updateProduct" method="post">
            <table>
            	<tr>
            		<td>상품명</td>
            		<td><input type="text" value="<c:out value='${product.name}'/>" name="name" readonly="readonly"></td>
            	</tr>
            	<tr>
            		<td>가격</td>
            		<td><input type="text" value="<c:out value='${product.price}'/>" name="price"></td>
            	</tr>
            	<tr>
            		<td>색상</td>
            		<td><input type="text" value="<c:out value='${product.color}'/>" name="color"></td>
            	</tr>
            	<tr>
            		<td>수량</td>
            		<td><input type="text" value="<c:out value='${product.quentity}'/>" name="quentity"></td>
            	</tr>
            </table>
                <input type="submit" value="상품수정">
            </form>
        </div>
</body>
</html>