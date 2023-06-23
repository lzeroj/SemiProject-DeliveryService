<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>장바구니</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	
	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
	<%-- 상단 메뉴 공통 부분 --%>
	<c:import url="header.jsp"></c:import>

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>무료 배달 서비스</p>
						<h1>장바구니</h1>
						<a href="${pageContext.request.contextPath}/FindCartListByIdAndFoodName.do">테스트</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- cart -->
	<div class="cart-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12">
					<div class="cart-table-wrap">
						<table class="cart-table">
							<thead class="cart-table-head">
								<tr class="table-head-row">
									<th class="product-remove">번호</th>
									<th class="product-image">가게명</th>
									<th class="product-image">메뉴사진</th>
									<th class="product-name">메뉴</th>
									<th class="product-price">금액</th>
									<th class="product-quantity">수량</th>
									<th class="product-total">합계</th>
									<th class="product-total">주문취소</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${cartList}" var="list">
							
								<tr class="table-body-row">
								
									<%-- 번호 자동부여 테스트 필요 --%>
									<td class="product-remove"><span id="number">1</span></td>
									<td class="product-remove">${list.foodVO.storeVO.storeName}</td>
									<td class="product-image" id="img-path"></td>
									<td class="product-name">${list.foodVO.foodName}</td>
									<td class="product-price">${list.foodVO.foodPrice}</td>
									<td>
									<button id="decreaseButton" class="btn btn-secondary">-</button>
									<span id="quantitu"><strong>${list.quantity}</strong></span>
									<button id="increaseButton" class="btn btn-secondary">+</button>
									</td>
								
									<%-- 합계 테스트 필요--%>
									<td class="product-total"><span id=totalPrice>${list.foodVO.foodPrice * list.quantity}</span></td>
									<td class="product-total"><button type="button" class="btn btn-link">삭제</button></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="total-section">
						<table class="total-table">
							<thead class="total-table-head">
								<tr class="table-total-row">
									<th>합계</th>
								</tr>
							</thead>
							<tbody>
								<tr class="total-data">
								<%-- 총금액 계산방법 테스트 --%>
									<td><strong><span id="totalSum">총금액</span></strong></td>
								</tr>
							</tbody>
						</table>
						<div class="cart-buttons">
							<a href="checkout.jsp" class="boxed-btn black">주문하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end cart -->
	
	<%-- 하단 메뉴 공통 부분 --%>
	<c:import url="webpagefooter.jsp"></c:import>
	
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<p>Copyrights &copy; 2019 - <a href="https://imransdesign.com/">Imran Hossain</a>,  All Rights Reserved.<br>
						Distributed By - <a href="https://themewagon.com/">Themewagon</a>
					</p>
				</div>
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyright -->
				<script type="text/javascript">
				let tdElement = document.getElementById("img-path");
				tdElement.innerHTML = "Dynamic content";
				</script>
	<!-- cart javascript 구현 -->
	<script type="text/javascript">
		$(function() {
			$("#img-path").append("테스트입니다.");
			/*
			${list.foodVO.foodPicturePath}
			*/
		});
	</script>
	
	
		
	<!-- jquery -->
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>

</body>
</html>