<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="../assets/img/favicon-duck2_32.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="../assets/css/register.css">
<link rel="stylesheet" href="../assets/css/main.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../assets/css/register.css">
<style type="text/css">
#btn-submit:hover {
	background: #ff6e00;
	border-color: #ff6e00;
}
#form {
margin-top:13%;
}
</style>
<title>회원 정보 수정</title>
</head>
<body>
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo" id="ducklogo" style="margin-top: -30px">
							<img src="../assets/img/oh2km.png" alt="오리사진">
						</div>
						<!-- logo -->
						<!-- menu start -->
						<nav class="main-menu" style="display: block;">
							<ul>
								<li>
									<div class="header-icons"></div>
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
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto" id="form" style="padding-top: 0px" >
				<div class="txt_field">
					<h1 class="mb-3" style="font-size: 250%">회원 정보 수정</h1>
				</div>
				<form class="validation-form" method="post"
					action="../UpdateMember.do">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="userId">아이디</label> <input type="text"
								class="form-control" name="userId"
								value="${sessionScope.member.userId}" readonly="readonly">
						</div>
						<div class="col-md-6 mb-3">
							<label for="userPassword">비밀번호</label> <input type="password"
								class="form-control" name="userPassword" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="userPhone">전화번호</label> <input type="text"
								class="form-control" name="userPhone"
								placeholder="예) 01012345678" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="userBirth">생년월일</label> <input type="text"
								class="form-control" name="userBirth" id="Birthday"
								value="${sessionScope.member.userBirth}" onchange="onchange()" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="userName">이름</label> <input type="text"
								class="form-control" name="userName"
								value="${sessionScope.member.userName}" required="required"
								readonly="readonly">
						</div>
						<div class="col-md-6 mb-3">
							<label for="userEmail">이메일</label> <input type="text"
								class="form-control" name="userEmail"
								placeholder="you@example.com" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="userType">고객 유형</label> <select
								class="custom-select d-block w-100" name="userType">
								<option value="1">일반고객</option>
								<option value="2">점주</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" id="userAddress">
							<label for="userAddress">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" name="userAddress"
									id="address" placeholder="주소를 입력해주세요" required>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										onclick="findAddress()" id="addressSearchButton">주소검색</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 " id="userAddDetail">
							<label for="userAddDetail">상세주소<span class="text-muted">&nbsp;(필수)</span></label>
							<input type="text" class="form-control" name="userAddDetail"
								placeholder="상세주소를 입력해주세요.">
						</div>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="btn-submit">수정완료</button>
				</form>
				<c:import url="../footer.jsp"></c:import>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function findAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					let address = data.roadAddress; // 주소 검색 API에서 가져온 도로명 주소 값
					let input = document.getElementById('address'); //input value 값을 버
					input.value = address; // 버튼의 value 속성에 동적으로 주소 값을 설정
				}
			}).open();
		}
		function onchange(){
			let birth = document.getElementById("Birthday").value;
			let date = birth.split(" ")[0];
			document.getElementById("Birthday").value = date;
		}
	    document.addEventListener("DOMContentLoaded", function() {
	        onchange();
	      });
	</script>
</body>
</html>