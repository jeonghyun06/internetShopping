<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="style/main.css" rel="stylesheet">
<link href="style/signUp.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<center>
		<div id="header">
			<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
		</div>
		<div id="signUp">
			<h2>회원가입</h2>
			<form action="/finalProject/UserController?action=addUser"
				method=post>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type=text name=id id="id" size=30></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type=password id="pw" name=pw></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type=password id="pw_confirm" name=pw_confirm></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type=text id="name" name=name></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type=email id="email" name=email></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type=submit
							value="회원가입" id="submit"></td>
					</tr>
				</table>

			</form>
		</div>
</body>
</html>