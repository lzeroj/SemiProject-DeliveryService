<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>마이페이지</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png"
	href="assets/img/favicon-duck2_32.png">
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
<!-- main style -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- responsive -->
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/asset/css/font.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/common.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/ol.css"> -->
<!--메인에는 sub.css 호출하지않음-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/sub.css">
<!--//메인에는 sub.css 호출하지않음  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!--PreLoader-->
	<div class="loader">
		<div class="loader-inner">
			<div class="circle"></div>
		</div>
	</div>
	<%-- 상단 메뉴 공통 부분 --%>
	<c:import url="header.jsp"></c:import>
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<h1>마이페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-8 offset-sm-2">
			<%--이 부분을 써야함  --%>
			<section id="content">
				<div class="sub-type mypage">
					<div class="inner-box">
						<div class="page-title-wrap">
							<c:choose>
								<c:when test="${sessionScope.member!=null}">
									<h2 class="page-title">${member.userName}님환영합니다😊!!</h2>
								</c:when>
							</c:choose>
						</div>
						<article class="mypage-wrap mypage-grade">
							<div class="menu-nav-wrap">
								<div class="menu-nav">
									<ul class="nav nav-tabs" role="tablist"
										style="background: none">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#" style="margin-top: 15px">주문내역보기</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="myOrderList" onclick="updateMember()">회원정보수정</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="myOrderList" onclick="deleteMember()">회원탈퇴</a></li>
									</ul>
								</div>
							</div>
							<div class="tab-type6">
								<div class="cart-table-wrap">
									<c:choose>
										<c:when test="${empty list}">
											<div class="no-data">주문내역이 없습니다.</div>
										</c:when>
										<c:otherwise>
											<table class="cart-table">
												<thead class="cart-table-head">
													<tr class="table-head-row">
														<th class="product-image">주문번호</th>
														<th class="product-image">가게명</th>
														<th class="product-name">주문위치</th>
														<th class="product-price">금액</th>
														<th class="product-name">주문시간</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${list}" var="list" varStatus="status" begin="1" end="${count}" step="1">
													<tr class="table-body-row">
														<td id="no">${status.count}</td>
														<td><a href="StoFindStoreAndFoodListDetailByStoreName.do?storename=${list.storeVO.storeName}" data-storename="${list.storeVO.storeName}">${list.storeVO.storeName}</a></td>
														<td>${list.orderLocation}</td>
														<td>${list.totalPrice}원</td>
														<td>${list.orderDate}</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="order-list">
								<div class="cart-section mt-150 mb-150">
									<div class="container">
										<div class="row">
											<div class="col-lg-8 col-md-12"></div>
										</div>
									</div>
								</div>
								<div class="btn-wrap">
									<a href="${pageContext.request.contextPath}/index.jsp"
										class="btn-type v3" style="border-radius: 5%">지금 주문하러 가기</a> <a
										href="CartFindListByCartNo.do" class="btn-type v4"
										style="border-radius: 5%">장바구니 보러가기</a>
								</div>
							</div>
						</article>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%-- 하단 메뉴 공통 부분 --%>
	<c:import url="webpagefooter.jsp"></c:import>
	<script type="text/javascript">
		function updateMember() {
			var contextPath = "${pageContext.request.contextPath}";
			var updateMemberURL = contextPath + "/UpdateMemberForm.do";
			window.location.href = updateMemberURL;
		}
// 		$(function() {
// 			let count = '${count}';
// 			for(let i=0;i<count;i++){
// 				$("#no").text(i);
// 			}
// 		});
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