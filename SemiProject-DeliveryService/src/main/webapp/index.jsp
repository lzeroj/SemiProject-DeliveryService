<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>oh, 2km?!</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/favicon-duck2_32.png">
<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
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
<script src="https://kit.fontawesome.com/72ab60a7d8.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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

	<!-- hero area -->
	<div class="hero-area hero-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-2 text-center">
					<div class="hero-text">
						<div class="hero-text-tablecell">
							<p class="subtitle">무료 배달 서비스</p>
							<h1>오, 2키로?</h1>
							<div class="hero-btns">
								<input type="text" placeholder="주소" size="60" id="address" name="address"
									onclick="findAddress()" value="" readonly><a href="shop.jsp"
									class="boxed-btn">검색</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end hero area -->

	<!-- product section -->
	<div class="product-section mt-80 mb-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3>
							<span class="orange-text">음식</span> 카테고리
						</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="single-category-item" data-type="한식">
						<div class="product-image" >
							<a href="#"><img
								src="assets/img/음식카테고리/한식.png" alt=""></a>
						</div>
						<h3>한식</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="single-category-item" data-type="중식">
						<div class="product-image">
							<a href="#" data-type="중식"><img
								src="assets/img/음식카테고리/중식.png" alt=""></a>
						</div>
						<h3>중식</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-category-item" data-type="일식">
						<div class="product-image">
							<a href="#"><img
								src="assets/img/음식카테고리/일식.png" alt=""></a>
						</div>
						<h3>일식</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-category-item" data-type="양식">
						<div class="product-image">
							<a href="#"><img
								src="assets/img/음식카테고리/양식.png" alt=""></a>
						</div>
						<h3>양식</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="shop.jsp"><img
								src="assets/img/음식카테고리/치킨.png" alt=""></a>
						</div>
						<h3>치킨</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="shop.jsp"><img
								src="assets/img/음식카테고리/피자.png" alt=""></a>
						</div>
						<h3>피자</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="shop.jsp"><img
								src="assets/img/음식카테고리/패스트푸드.png" alt=""></a>
						</div>
						<h3>패스트푸드</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="shop.jsp"><img
								src="assets/img/음식카테고리/카페.png" alt=""></a>
						</div>
						<h3>카페</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end product section -->

	<%-- 하단 메뉴 공통 부분 --%>
	<c:import url="webpagefooter.jsp"></c:import>

	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<p>
						Copyrights &copy; 2019 - <a href="https://imransdesign.com/">Imran
							Hossain</a>, All Rights Reserved.<br> Distributed By - <a
							href="https://themewagon.com/">Themewagon</a>
					</p>
				</div>
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-linkedin"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyright -->

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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function findAddress() {
			addressPopupWindow = new daum.Postcode({
				oncomplete : function(data) {
					let address = data.roadAddress; // 주소 검색 API에서 가져온 도로명 주소 값
					let input = document.getElementById('address'); //input value 값을 버
					input.value = address; // 버튼의 value 속성에 동적으로 주소 값을 설정
				}
			}).open();
		}
		$(function() {
			let address = '${sessionScope.address}';
			let member = '${sessionScope.member}';
			console.log(member);
			if(member != ""){
				if(address != ""){
					$("#address").val(address);
				}
			}
		});
	</script>
</body>
</html>