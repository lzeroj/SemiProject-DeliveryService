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
<style type="text/css">
#btn-submit:hover {
background: #ff6e00 ;
border-color: #ff6e00;
}
</style>
</head>
<body>
	<div class="container">
		<form class="validation-form" method="post" action="../DeleteMember.do">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto" id="form">
					<div class="txt_field">
						<h1 class="mb-3">회원 비밀번호 확인</h1>
					</div>
					<p class="text-center">
						<strong><span style="color: blue;"> 탈퇴 후에는 서비스를 더 이상 이용할 수 없습니다. </span></strong>
						<br /> 회원 탈퇴를 계속 진행하시겠습니까?
					</p>
					<div class="col-md-6 mb-3">
						<label for="userId">아이디</label> <input type="text"
							class="form-control" name="userId"
							value="${sessionScope.member.userId}" readonly="readonly">
					</div>
					<div class="col-md-6 mb-3">
						<label for="userPassword">비밀번호</label> <input type="password"
							class="form-control" name="userPassword" placeholder="현재 비밀번호 입력"
							required>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="col text-center"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="btn-submit">탈퇴하기</button>
				</div>
			</div>
		</form>
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>
