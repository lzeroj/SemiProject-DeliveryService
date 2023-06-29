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
	<title>메뉴 상세</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon-duck2_32.png">
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
	<!-- icon style -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>See more Details</p>
						<h1>메뉴 상세</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- single product -->
	<div class="single-product mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="single-product-img">
						<img src="assets/img/food/${foodinfo.foodPicturePath}" alt="">
					</div>
				</div>
				<div class="col-md-7">
					<div class="single-product-content">
						<h2><strong>${foodinfo.foodName}</strong></h2><br><br>
						<p class="single-product-pricing"> ${foodinfo.foodPrice}원</p>
						<p>${foodinfo.foodInfo}</p>
						<div class="single-product-form">
							<form>
								<input id="quantity" name="quantity" type="number" placeholder="0">
							</form>
							
							<%--  임영준 장바구니 추가 기능  --%>
							<button class="btn btn-warning" type="button" id="insertCart"><i class="fas fa-shopping-cart"></i>
							장바구니 추가
							</button>								
							<script type="text/javascript">
								$(function() {
									$("#insertCart").click(function() {
										var quantity = $("#quantity").val();
										let foodname = '${foodinfo.foodName}';
										console.log(quantity);
										console.log(foodname);
										var data = {
												foodname : foodname,
												quantity : quantity
										};

										if($("#quantity").val()==""){
											alert("수량을 입력해주세요");
											return;
										}
										if(confirm("장바구니에 추가하시겠습니까?")){
											$.ajax({
												type:"post",
												url:"CartAjaxInsertCart.do",
												data:data,
												success:function(result){
													let check = result;
													if(check==="ok"){
														alert("장바구니에 추가되었습니다.");						
													}else{ <%--check==="nullSession" --%>
														alert("세션이 끊겼습니다. 다시 로그인 하세요");
														location.href="index.jsp";
													}
												}
											});
										}
									});
								});
							
// 								function insertCart() {
// 									let quantity1 = $("#quantity").val();
// 									let foodname = '${foodinfo.foodName}';
// 									console.log(quantity1);
// 									console.log(foodname);
// 									var data1 = {
// 											foodname : foodname,
// 											quantity : quantity1
// 									};

// 									if(confirm("장바구니에 추가하시겠습니까?")){
// 										xhr = new XMLHttpRequest();
// 										xhr.onreadystatechange = function() {
// 											if(xhr.readyState==4&&xhr.status==200){
// 												let check = xhr.responseText;
// 												console.log(check);
// 												if(check==="ok"){
// 													alert("장바구니에 추가되었습니다.");						
//												}else{ check==="nullSession"
// 													alert("세션이 끊겼습니다. 다시 로그인 하세요");
// 													location.href="index.jsp";
// 												}
// 											}
// 										}
// 										xhr.open("post","CartAjaxInsertCart.do");
// 										xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// // 										let data = data1;
// 										xhr.send(data1);
// 									}							
// 								}
							</script>								
							<%-- 장바구니 추가 기능 End --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end single product -->

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