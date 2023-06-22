<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>My page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
</head>		
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 
	회원정보수정
	주문내역보기
	1:1 문의
	내가 쓴 리뷰 보기
	찜한 가게
-->
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().leng	th < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;			
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>
<body>
	<div class="container">
		<h2>나의 정보</h2>
		<!--  <p>Basic horizontal menu:</p> -->
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="page-title">회원정보수정</a></li>
			<li class="nav-item"><a class="nav-link" href="/mypage/myOrderList">주문내역보기</a></li>
			<li class="nav-item"><a class="nav-link" href="#">1:1 문의</a></li>
			<li class="nav-item"><a class="nav-link" href="#">내가 쓴 리뷰 보기</a></li>
			<li class="nav-item"><a class="nav-link" href="#">찜한 가게</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
	</div>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>ID</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="email" value="${ member.email }" required>
					</p>
					<p class="w3-center">
						<button type="submit"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
							변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="../member/update_pw.do" method="post">
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>Password</label> <input class="w3-input" id="old_pw"
							name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="pw"
							name="pw" type="password" required>
					</p>
					<p>
						<label>Confirm</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호
							변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>