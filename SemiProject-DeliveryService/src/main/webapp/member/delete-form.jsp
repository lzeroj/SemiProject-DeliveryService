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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/register.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../assets/css/register.css">
<title>회원 탈퇴</title>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto" id="form">
				<div class="txt_field">
					<h1 class="mb-3">회원 탈퇴</h1>
				</div>
				<p class="text-center">
					회원 탈퇴를 하면 서비스를 더 이상 이용하실 수 없습니다. <br/> 회원 탈퇴를 진행하시겠습니까?
				</p>																																																															
				<form id="submitForm" method="post" >
					<label for="userId">아이디</label> <input type="text" name="userId"
						value="${sessionScope.member.userId}" readonly="readonly">
					<br>
					<div>
						<input type="password" name="password" placeholder="현재 비밀번호 입력"
							required />
					</div>
					<div>
						<button type="submit">회원 탈퇴 하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
