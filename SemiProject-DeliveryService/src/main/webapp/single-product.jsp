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
	<!-- icon style -->
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
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Tempora, earum.</p>
						<div class="single-product-form">
							<form action="index.html">
								<input type="number" placeholder="0">
							</form>
							
							
							<%--  임영준 장바구니 추가 기능  --%>
							<button class="btn btn-warning" type="button" onclick="insertCart()"><i class="fas fa-shopping-cart"></i>
							장바구니 추가
							</button>								
							<script type="text/javascript">
								function insertCart(foodName) {
									if(confirm("장바구니에 추가하시겠습니까?")){
										xhr = new XMLHttpRequest();
										xhr.onreadystatechange = function() {
											if(xhr.readyState==4&&xhr.status==200){
												let check = xhr.responseText;
												console.log(check);
												if(check==="ok"){
													alert("장바구니에 추가되었습니다.");						
												}
												
 												/*else if(check==="fail"){
													alert("이미 장바구니에 등록되어 있습니다.");
												} */
												
												else{ <%--check==="nullSession" --%>
													alert("세션이 끊겼습니다. 다시 로그인 하세요");
													location.href="index.jsp";
												}
											}
										}
										xhr.open("post","CartAjaxInsertCart.do");
										xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
										let data = "foodname=" + '${foodinfo.foodName}';
										xhr.send(data);
									}							
								}
							</script>								
							<%-- 장바구니 추가 기능 End --%>
							
							<button class="btn btn-warning"><i class="fas fa-shopping-cart"></i> 주문하기</button>
								<!-- <br><p><strong>카테고리: </strong>한식</p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end single product -->

	<!-- more products -->
<!-- 	<div class="more-products mb-150"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-8 offset-lg-2 text-center"> -->
<!-- 					<div class="section-title">	 -->
<!-- 						<h3><span class="orange-text">Related</span> Products</h3> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae optio.</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-4 col-md-6 text-center"> -->
<!-- 					<div class="single-product-item"> -->
<!-- 						<div class="product-image"> -->
<!-- 							<a href="single-product.html"><img src="assets/img/products/product-img-1.jpg" alt=""></a> -->
<!-- 						</div> -->
<!-- 						<h3>Strawberry</h3> -->
<!-- 						<p class="product-price"><span>Per Kg</span> 85$ </p> -->
<!-- 						<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-4 col-md-6 text-center"> -->
<!-- 					<div class="single-product-item"> -->
<!-- 						<div class="product-image"> -->
<!-- 							<a href="single-product.html"><img src="assets/img/products/product-img-2.jpg" alt=""></a> -->
<!-- 						</div> -->
<!-- 						<h3>Berry</h3> -->
<!-- 						<p class="product-price"><span>Per Kg</span> 70$ </p> -->
<!-- 						<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-4 col-md-6 offset-lg-0 offset-md-3 text-center"> -->
<!-- 					<div class="single-product-item"> -->
<!-- 						<div class="product-image"> -->
<!-- 							<a href="single-product.html"><img src="assets/img/products/product-img-3.jpg" alt=""></a> -->
<!-- 						</div> -->
<!-- 						<h3>Lemon</h3> -->
<!-- 						<p class="product-price"><span>Per Kg</span> 35$ </p> -->
<!-- 						<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- end more products -->

	<!-- logo carousel -->
<!-- 	<div class="logo-carousel-section"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-12"> -->
<!-- 					<div class="logo-carousel-inner"> -->
<!-- 						<div class="single-logo-item"> -->
<!-- 							<img src="assets/img/company-logos/1.png" alt=""> -->
<!-- 						</div> -->
<!-- 						<div class="single-logo-item"> -->
<!-- 							<img src="assets/img/company-logos/2.png" alt=""> -->
<!-- 						</div> -->
<!-- 						<div class="single-logo-item"> -->
<!-- 							<img src="assets/img/company-logos/3.png" alt=""> -->
<!-- 						</div> -->
<!-- 						<div class="single-logo-item"> -->
<!-- 							<img src="assets/img/company-logos/4.png" alt=""> -->
<!-- 						</div> -->
<!-- 						<div class="single-logo-item"> -->
<!-- 							<img src="assets/img/company-logos/5.png" alt=""> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- end logo carousel -->

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