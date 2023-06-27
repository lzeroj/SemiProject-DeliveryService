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
	<title>상세보기</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style type="text/css">
	.store_detail_css{
		font-size: 20px;
	}
</style>

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
						<p>Category</p>
						<h1>${storeInfo.storeCategory}</h1>
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
						<img src="assets/img/store/${storeInfo.storePicturePath}" alt="">
					</div>
				</div>
				<div class="col-md-7">
					<div class="single-product-content">
						<h2>
							${storeInfo.storeName}
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
							<c:choose>
								<c:when test="${heartchk}">
									<span class="chkajax" id="ajaktrue" data-bool="true"><i class="bi bi-heart-fill fa-1x" style="color : red"></i></span>
								</c:when>
								<c:otherwise>
									<span class="chkajax" id="ajakfalse" data-bool="false"><i class="bi bi-heart fa-1x"></i></span>
								</c:otherwise>
							</c:choose>
							<script type="text/javascript">
								$(function() {
									$(".chkajax").on("click", function() {
										let storeNumber = "${storeInfo.storeNumber}";
										let userid = "${member.userId}";
										console.log(storeNumber);
										console.log(userid);
										$.ajax({
											type:"get",
											url:"FaoFavoritesInsertYN.do",
											data:{
												storeNumber: storeNumber,
												userid : userid
											},//서버에 넘기는 데이터
											success:function(result){ //result(변수명은 어떤것이든 상관없음)
												//success funtion 매개변수로 서버가 응답한 데이터가 전달
												if($(".chkajax").data("bool")=="true"){
													if(result === "true"){
											            $(this).empty();
											            $(this).append('<i class="bi bi-heart-fill fa-1x"></i>');
													}else{
											            $(this).empty();	
											            $(this).append('<i class="bi bi-heart fa-1x"></i>');	
													}
												}else{ //$(".chkajax").data("bool")=="false"
													if(result === "true"){
											            $(this).empty();
											            $(this).append('<i class="bi bi-heart-fill fa-1x"></i>');
													}else{
											            $(this).empty();	
											            $(this).append('<i class="bi bi-heart fa-1x"></i>');	
													}
												}
											}.bind(this)
										}); //ajax
									});
									
									let heartchk = "${heartchk}";
									if(heartchk === "true"){
										$("#ajakfalse").hide();
										$("#ajaktrue").show();
									}else{
										$("#ajaktrue").hide();
										$("#ajakfalse").show();
									}
								});
							</script>
						</h2>
						<br>
						<span class="store_detail_css"><strong>최소주문금액</strong> : ${storeInfo.storeMinimumOrderAmount}</span><br>
						<span class="store_detail_css">
						<c:choose>
							<c:when test="${distance > 4}">
								<strong>배달거리</strong> : ${distance} Km - 2000원
							</c:when>
							<c:when test="${distance > 2 && distance < 4}">
								<strong>배달거리</strong> : ${distance} Km - 1000원
							</c:when>
							<c:when test="${distance < 2  && distance > 0}">
								<strong>배달거리</strong> : ${distance} Km - 무료
							</c:when>
						</c:choose>
						</span><br><br>
						<textarea class="form-control" id="store-detail" rows="6" readonly="readonly">
${storeInfo.storeInfo}
						</textarea>
						<br><br>
						
						<%-- 리뷰 보기 기능 --%>
						<form action="ReviewListByStoreNumber.do" method="get">
						<button type="submit" class="btn btn-outline-success">리뷰 보기</button>
						<input type="hidden" name="storeNumber" value="${storeInfo.storeNumber}">
						<input type="hidden" name="storeName" value="${storeInfo.storeName}">
						</form>
						<%-- 리뷰 END --%>
						
						<div class="single-product-form">
<!-- 							<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a> -->
<!-- 							<br><p><strong>카테고리: </strong>한식</p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end single product -->

	<!-- more products -->
	<div class="more-products mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">메뉴</span> 보기</h3>
						<p>상품 선택후, 주문 해주세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${foodInfo}" var="foodInfo">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="StoFindFoodDetailByFoodName.do?foodname=${foodInfo.foodName}"><img src="assets/img/food/${foodInfo.foodPicturePath}" alt="" style="width: 300px" height="300px"></a>
						</div>
						<h3>${foodInfo.foodName}</h3>
						<p class="product-price"><span>가격</span> ${foodInfo.foodPrice}원 </p>
						<a href="StoFindFoodDetailByFoodName.do?foodname=${foodInfo.foodName}" class="cart-btn"><i class="fas fa-shopping-cart"></i> 주문하기</a>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- end more products -->

	<!-- logo carousel -->
	<div class="logo-carousel-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">
							<img src="assets/img/company-logos/1.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/2.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/3.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/4.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/5.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end logo carousel -->

	<%-- 하단 메뉴 공통 부분 --%>
	<c:import url="webpagefooter.jsp"></c:import>
	
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