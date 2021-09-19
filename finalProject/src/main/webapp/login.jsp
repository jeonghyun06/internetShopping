<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/login.css" rel="stylesheet">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<script type="text/javascript">
	function fn_login(){
		
	}
</script>
	<center>
		<div id="header">
			<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
		</div>
		<div id="loginPa">
			<h2>로그인</h2>
			<form action="/finalProject/UserController?action=login" method=post>
				<table>
					<tr>
						<td>ID</td>
						<td><input type=text name=id id="id" size=16></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type=password id="pw" name=pw size=16></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type=submit id="loginBtn" value="로그인">
							<input type="button" value="회원가입" id="signUpBtn"
							onclick="location.href='signUp.jsp'">
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>