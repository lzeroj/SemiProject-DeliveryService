<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/register.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>회원 수정</title>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto" id="form">
				<div class="txt_field">
					<h1 class="mb-3">회원 수정</h1>
				</div>
				<form class="validation-form" method="post"
					action="RegisterMember.do">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">아이디</label> <input class="form-control"
								type="text" name="user_id" placeholder="ori123"
								required="required">
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" name="password" placeholder="" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">전화번호</label> <input type="text"
								class="form-control" name="user_phone"
								placeholder="010-xxxx-xxxx" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">생년월일</label> <input type="text"
								class="form-control" name="user_birth" placeholder="1997-04-05"
								required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="email">이름</label> <input type="text"
								class="form-control" name="user_name" placeholder="이름을 적으세요"
								required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" name="email" placeholder="you@example.com"
								required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="root">고객 유형</label> <select
								class="custom-select d-block w-100" name="user_type">
								<option value="1">일반고객</option>
								<option value="2">점주</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" id="address1">
							<label for="address">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" name="address"
									id="address" placeholder="주소를 입력해주세요" required>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										onclick="findAddress()" id="addressSearchButton">주소검색</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 " id="address2">
							<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
									)</span></label> <input type="text" class="form-control" name="add_detail"
								placeholder="상세주소를 입력해주세요.">
						</div>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="btn-submit">수정완료</button>
				</form>
				<c:import url="footer.jsp"></c:import>
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
	</script>
</body>
</html>