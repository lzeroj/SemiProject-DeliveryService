<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>회원 탈퇴</title>
</head>
<body>


	<div>
		<p>
			회원 탈퇴를 하면 서비스를 더 이상 이용하실 수 없습니다. <br /> 회원 탈퇴를 진행하시겠습니까?
		</p>

		<form id="submitForm" method="post">
			<div>
				<input type="password" name="password" placeholder="현재 비밀번호 입력"
					required />
			</div>
			<div>
				<button type="submit">회원 탈퇴 하기</button>
			</div>
		</form>
	</div>
</body>
</html>
