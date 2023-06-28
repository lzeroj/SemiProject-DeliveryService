<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>장바구니</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/favicon-duck2_32.png">
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
						<p>무료 배달 서비스</p>
						<h1>장바구니</h1>
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
										<td class="product-remove">${list.foodVO.storeVO.storeName}</td>
										<td class="product-image">
										<img src="assets/img/food/${list.foodVO.foodPicturePath}" alt="Food Image">
										</td>
										<td class="product-name">${list.foodVO.foodName}</td>
										<td class="product-price" id="foodPrice${list.cartNo}">
											<%-- id구분을 위해 앞에 foodPrice 추가  --%> 
											<fmt:formatNumber value="${list.foodVO.foodPrice}" pattern="#,###"></fmt:formatNumber>
										</td>
										<td>
											<%-- 마이너스 버튼 폼 --%> <%-- id구분을 위해 앞에 decreaseButton 추가 --%>
											<button id="decreaseButton${list.cartNo}"
												class="btn btn-secondary" type="button"
												onclick="quantityMinus('${list.cartNo}')"
												<c:if test="${list.quantity == 1}">disabled="disabled"</c:if> <%-- ${list.quantity == 1 ? 'disabled' : ''}> 이거랑 같음 --%>
												>-</button>
												 <%-- ajax 통신 및 forEach 문 구분을 위해 id 부여 --%> 
											 <strong><span id="${list.cartNo}">${list.quantity}</span></strong> <%-- 플러스 버튼 폼 --%>
											<button id="increaseButton" class="btn btn-secondary" type="button" onclick="quantityPlus('${list.cartNo}')">+</button> 
										</td>
										
										<td class="product-total"
											id="eachFoodTotalPrice${list.cartNo}"><fmt:formatNumber
												value="${list.foodVO.foodPrice * list.quantity}"
												pattern="#,###"></fmt:formatNumber></td>

										<%-- 삭제하시겠습니까? 알림띄우기 --%>
										<td class="product-total">
											<form id="deleteForm" method="post"
												action="CartDeleteFoodMenuByCartNo.do">
												<button class="btn btn-link" type="submit"
													onclick="return confirmDelete();">삭제</button>
												<input type="hidden" name="cartNo" value="${list.cartNo}">
											</form> <script type="text/javascript">
												// 삭제 확인 메시지 표시 함수
												function confirmDelete() {
													return confirm("정말로 삭제하시겠습니까?");
												}
											</script>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="total-section">
						<form action="OrderFood.do" method="post" name="orderFoodForm" id="orderFoodForm">
							<table class="total-table">
								<thead class="total-table-head">
									<tr class="table-total-row">
										<th>합계</th>
									</tr>
								</thead>
								<tbody>
									<tr class="total-data">
										<%-- 총금액 계산 --%>
										<c:forEach items="${cartList}" var="list">
											<c:set var="totalSum"
												value="${totalSum+list.foodVO.foodPrice * list.quantity}"></c:set>
										</c:forEach>
										<td>
											<%-- id구분을 위해 앞에 cartTotalPrice 추가  --%> 
											<strong><span id="cartTotalPrice"> 
												<fmt:formatNumber value="${totalSum}" pattern="#,###"></fmt:formatNumber>
											</span>원</strong>
										</td>
									</tr>
									<tr>
										<td>
										<input type="hidden" id="totalSum" name="totalSum" value=""/>
										<button class="btn btn-warning" name="order"
												type="button" id="order">주문하기</button></td>
									</tr>
								</tbody>
							</table>
							<%-- 주문하기 ( order_food 테이블 저장 ) --%>
							<script type="text/javascript">
								$(function() {
									$("#order").click(function(){
										let totalprice = $("#cartTotalPrice").text().trim();
										totalprice = totalprice.replace(",","")
										$("#totalSum").val(totalprice); 
										if(confirm("주문 하시겠습니까?")){
											$("#orderFoodForm").submit();
										}
									})
								});
							</script>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end cart -->
	<%-- ${list.cartNo} --%>
	<script type="text/javascript">
		function quantityPlus(cartNo) {
			//console.log(userId);
			//console.log(foodName);
			let quantityElement = document.getElementById(cartNo);
			let price = document.getElementById("foodPrice" + cartNo);
			let eachFoodTotalPrice = document.getElementById("eachFoodTotalPrice" + cartNo);
			let cartTotalPrice = document.getElementById("cartTotalPrice");
			let button = document.getElementById("decreaseButton" + cartNo);
			//console.log(quantityElement)									
			//console.log(price);																
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					let quantity = xhr.responseText;
					// console.log(xhr.responseText);
					quantityElement.innerHTML = quantity;

					if (quantity > 1) {
						button.disabled = false;
					}

					let foodPrice = parseInt(price.innerText.replace(/,/g, "")); // 숫자 text 8,000 같은 콤마 삭제 및 int 변환
					//console.log(foodPrice);
					let eachPrice = parseInt(quantity) * foodPrice;
					// console.log(eachPrice);											
					eachFoodTotalPrice.innerHTML = eachPrice.toLocaleString(); // int 값을 string으로 변환
					let totalPrice = parseInt(cartTotalPrice.innerText.replace(/,/g, "")); // 숫자 text 8,000 같은 콤마 삭제 및 int 변환
					totalPrice += foodPrice;
					cartTotalPrice.innerHTML = totalPrice.toLocaleString(); // int 를 다시 string으로 변환
				}
			}
			xhr.open("post", "CartAjaxFoodMenuUpdatePlus.do");
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			// AJAX 요청 전송
			let data = "cartNo=" + cartNo;
			xhr.send(data);
		}

		function quantityMinus(cartNo) {
			//console.log(userId);
			//console.log(foodName);
			let quantityElement = document.getElementById(cartNo);
			let price = document.getElementById("foodPrice" + cartNo);
			let eachFoodTotalPrice = document.getElementById("eachFoodTotalPrice" + cartNo);
			let cartTotalPrice = document.getElementById("cartTotalPrice");
			let button = document.getElementById("decreaseButton" + cartNo);
			//console.log(quantityElement)									
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				//console.log(xhr.readyState);
				//console.log(xhr.status);											
				if (xhr.readyState == 4 && xhr.status == 200) {
					let quantity = xhr.responseText;
					// console.log(xhr.responseText);
					quantityElement.innerHTML = quantity;
					if (quantity == 1) {
						button.disabled = true;
					}
					let foodPrice = parseInt(price.innerText.replace(/,/g, ""));
					//console.log(foodPrice);
					let eachPrice = parseInt(quantity) * foodPrice;
					//console.log(eachPrice);
					eachFoodTotalPrice.innerHTML = eachPrice.toLocaleString();
					let totalPrice = parseInt(cartTotalPrice.innerText.replace(/,/g, ""));
					totalPrice -= foodPrice;
					cartTotalPrice.innerHTML = totalPrice.toLocaleString();
				}
			}
			xhr.open("post", "CartAjaxFoodMenuUpdateMinus.do");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			// AJAX 요청 전송
			let data = "cartNo=" + cartNo;
			xhr.send(data);
		}
	</script>

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

</body>
</html>