<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>
</head>
<body>
	<div class="center">
		<h1>Login</h1>
		<form method="post" action="Login.do">
			<%--form action으로  loginController에다 보내야함  --%>
			<div class="txt_field">
				<input type="text" name="user_id" required> <span></span> <label>아이디</label>
			</div>
			<div class="txt_field">
				<input type="password" name="password" required> <span></span>
				<label>비밀번호</label>
			</div>
			<button class="login-button" type="submit">Login</button>
			<div class="signup_link">
				회원이 아니신가요?  <a href="register.jsp">회원가입</a><br>
				<a href="index.jsp">HOME</a>
			</div>
		</form>
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>