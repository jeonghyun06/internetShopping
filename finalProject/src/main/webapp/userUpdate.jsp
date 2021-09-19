<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style/main.css" rel="stylesheet">
<link href="style/signUp.css" rel="stylesheet">
<title>회원정보 수정</title>
</head>
<body>
<center>
		<div id="header">
			<a href="ProductController?action=main"><h1>쇼핑몰 로고</h1></a>
		</div>
		<div id="signUp">
			<h2>회원 정보 수정</h2>
			<form action="/finalProject/UserController?action=updateUser" method=post>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type=text name=id id="id" size=30 value='<c:out value="${user.id}"/>' disabled="disabled"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type=password id="pw" name=pw value='<c:out value="${user.pw}"/>'></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type=password id="pw_confirm" name=pw_confirm ></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type=text id="name" name=name value='<c:out value="${user.name}"/>'></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type=email id="email" name=email value='<c:out value="${user.email}"/>'></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type=submit
							value="정보 수정" class="submit"><input type=button
							value="탈퇴" class="submit" onclick="location.href='/finalProject/UserController?action=deleteUser'">
						</td>
					</tr>
				</table>

			</form>
		</div>
</body>
</html>