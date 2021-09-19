<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/board.css" rel="stylesheet">
<meta charset="UTF-8">
<title>상품 추가</title>
</head>
<body>
<div id="header">
		<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
	</div>
	
<div class="product">
            <input type="image" name=img id="image" src="img/shirts.jpg" width=300px;>
            <form action="/finalProject/ProductController?action=add" method="post">
                상품명 : <input type="text" name="name"><br>
                가격 : <input type="text" name="price"><br>
                색상 : <input type="text"  name="color"><br>
                수량 : <input type="text"  name="quentity"><br>
                <br>
                <input type="submit" value="상품등록">
            </form>
        </div>
</body>
</html>