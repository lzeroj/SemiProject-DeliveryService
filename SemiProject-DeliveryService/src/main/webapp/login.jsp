<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="assets/img/favicon-duck2_32.png">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title> 
</head>
<body>
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo" id="ducklogo" style="margin-top: -30px">
							 <img src="assets/img/oh2km.png"
								alt="오리사진">
						</div>
						<!-- logo -->
						<!-- menu start -->
						<nav class="main-menu" style="display: block;">
							<ul>
								<li>
									<div class="header-icons">
									</div>
								</li>
							</ul>
						</nav>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
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
				회원이 아니신가요? <a href="register.jsp">회원가입</a><br> <a
					href="index.jsp">HOME</a>
					<input type="hidden" name="userbirth" value="${sessionScope.member.userBirth}">
			</div>
		</form>
	</div>
</body>
</html>