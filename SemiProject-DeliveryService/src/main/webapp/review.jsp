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
<title>리뷰게시판</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/favicon-duck2_32.png">
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<h1>${storeName} 리뷰 게시판</h1>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- latest news -->
	<div class="latest-news mt-150 mb-150">
		<div class="container">
			<div class="row">
			<c:forEach items="${reviewList}" var="reviewList">
				<div class="col-lg-3 col-md-3">
					<div class="single-latest-news">
						<div class="news-text-box">													
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i>${reviewList.memberVO.userId}</span> 
								<span class="date"><i class="fas fa-calendar"></i> ${reviewList.reviewInsertDate}</span>
							</p>
							<p class="excerpt">${reviewList.reviewContent}</p><br><br>
							<c:if test="${sessionScope.member.userId == reviewList.memberVO.userId }">				
							<form id="updateWritePostForm"action="ReviewUpdatePostForm.do" method="post">
							<input type="hidden" name="reviewNo" value="${reviewList.reviewNo}">
								<input type="hidden" name="storeNumber" value="${storeNumber}">
								<input type="hidden" id="storeName" name="storeName" value="${storeName}">
							<button class="btn btn-link" type="submit" onclick="updatePost()">수정</button>
							</form>
							<form id="reviewDeleteForm" action="ReviewDelete.do" method="post">
								<input type="hidden" name="reviewNo" value="${reviewList.reviewNo}">
								<input type="hidden" name="storeNumber" value="${storeNumber}">
								<input type="hidden" id="storeName" name="storeName" value="${storeName}">
								<button class="btn btn-link" type="button" onclick="deleteReview()">삭제</button>	
							</form>
							</c:if>									
						</div>					
					</div>
				</div>
			</c:forEach>		
			</div>
			<script type="text/javascript">
	/* 		let storeName = '${storeName}';
				
				$(function() {
					$("#storeName").val(storeName);
				}); */
					
				function deleteReview() {
					if(confirm("삭제하시겠습니까?")){
						document.getElementById("reviewDeleteForm").submit();
					}
				}
				function updatePost() {
					if(confirm("수정하시겠습니까")){
						document.getElementById("updateWritePostForm").submit();
					}
				}
			</script>
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-center">
							<div class="pagination-wrap">
								<ul>
									<c:if test="${pagination.previousPageGroup}">				
									<li><a href=" ReviewListByStoreNumber.do?storeName=${storeName}&storeNumber=${storeNumber}&pageNo=${pagination.startPageOfPageGroup-1}">Previous</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPageOfPageGroup}" end="${pagination.endPageOfPageGroup}" var="page">
									<c:choose>
									<c:when test="${pagination.nowPage==page}">
									<li><a class="active" href="ReviewListByStoreNumber.do?storeName=${storeName}&storeNumber=${storeNumber}&pageNo=${page}">${page}</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="ReviewListByStoreNumber.do?storeName=${storeName}&storeNumber=${storeNumber}&pageNo=${page}">${page}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${pagination.nextPageGroup}">
									<li><a href="ReviewListByStoreNumber.do?storeName=${storeName}&storeNumber=${storeNumber}&pageNo=${pagination.endPageOfPageGroup+1}">Next</a></li>
									</c:if>
									<li class="col-lg-12 text-right">
									<form action="ReviewWritePostForm.do" method="post">
									<input type="hidden" name="storeNumber" value="${storeNumber}">
									<input type="hidden" name="storeName" value="${storeName}">
									<button class="btn btn-primary" type="submit">리뷰 작성</button></form>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end latest news -->

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