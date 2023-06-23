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
	<title>Shop</title>

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=87599c2f74b02fcf28a9638597678071&libraries=services"></script>

</head>
<body>
<script type="text/javascript">
	$(function() {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const value = "."+urlParams.get('category');
        console.log("value:"+value);
        $(".product-lists").isotope({
                filter: value,
        });
	});
</script>
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
						<p>Fresh and Organic</p>
						<h1>Shop</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- products -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
                <div class="col-md-12">
                    <div class="product-filters">
                        <ul>
                            <li data-filter="*">All</li>
                            <li class="active" data-filter=".한식">한식</li>
                            <li data-filter=".중식">중식</li>
                            <li data-filter=".일식">일식</li>
                            <li data-filter=".양식">양식</li>
                            <li data-filter=".berry">피자</li>
                            <li data-filter=".lemon">치킨</li>
                            <li data-filter=".strawberry">패스트푸드</li>
                            <li data-filter=".berry">카페</li>
                        </ul>
                    </div>
                </div>
            </div>

			<div class="row product-lists">
				<c:forEach items="${stolist}" var="stolist">
        		<div class="col-lg-3 col-md-6 text-center ${stolist.storeCategory}">
					<div class="single-product-item" data-chk="${stolist.storeCategory}">
						<div class="product-image">
							<a href="StoFindStoreAndFoodListDetailByStoreName.do?storenumber=${stolist.storeNumber}"><img src="assets/img/store/${stolist.storePicturePath}" alt=""></a>
						</div>
					    <script>
        					console.log("${stolist.storeLocation}");
    					</script>
						<h3>${stolist.storeName}</h3>
						<input type="hidden" id="location" value="${stolist.storeLocation}"/>
						<p id="result-${stolist.storeNumber}"></p>
						<a href="StoFindStoreAndFoodListDetailByStoreName.do?storenumber=${stolist.storeNumber}" class="cart-btn"><i class="fas fa-shopping-cart"></i> 주문하러가기</a>
					</div>
				</div>
				</c:forEach>
<script type="text/javascript">
    $(function() {
        $(".product-lists .single-product-item").each(function(index) {
            var startaddress = "<c:out value='${address}' />";
            var arriveaddress = $(this).find("input#location").val();
            console.log("arriveaddress: "+arriveaddress);
        	var resultId = "result-" + $(this).index();

            // JavaScript 함수 실행
            getCoordinates(startaddress, arriveaddress, resultId, index);
        });
    });

    function getCoordinates(startaddress, arriveaddress, resultId, index) {

        var geocoder = new kakao.maps.services.Geocoder();

        var polyline = null;
        var startlatitude = null;
        var startlongitude = null;
        var arrivelatitude = null;
        var arrivelongitude = null;

        geocoder.addressSearch(startaddress, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                startlatitude = result[0].y;
                startlongitude = result[0].x;
                console.log("출발위도:"+startlatitude);
                console.log("출발경도:"+startlongitude);

                if (startlatitude && startlongitude && arrivelatitude && arrivelongitude) {
                    calculateDistance(resultId, index);
                }
            } else {
                alert("출발 주소를 찾을 수 없습니다.");
            }
        });

        geocoder.addressSearch(arriveaddress, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                arrivelatitude = result[0].y;
                arrivelongitude = result[0].x;
                console.log("도착위도:"+arrivelatitude);
                console.log("도착경도:"+arrivelongitude);

                if (startlatitude && startlongitude && arrivelatitude && arrivelongitude) {
                    calculateDistance(resultId, index);
                }
            } else {
                alert("도착 주소를 찾을 수 없습니다.");
            }
        });

        function calculateDistance(resultId, index) {
            polyline = new daum.maps.Polyline({
                path: [
                    new daum.maps.LatLng(startlatitude, startlongitude),
                    new daum.maps.LatLng(arrivelatitude, arrivelongitude)
                ],
            });

            var distance = polyline.getLength();
            console.log("distance:"+distance);
            resultId = "result-" + index;
            $("#" + resultId).html(distance / 1000);
            
            
            nextFunction(index);
        }
        
        function nextFunction(index) {
            console.log("다음 함수 실행. Index: " + index);
            // 결과를 웹 페이지에 표시할 HTML 요소를 선택합니다.
            resultId = "result-" + index;
            console.log("nextFunction-resultId:"+resultId)
            var resultElement = document.getElementById(resultId);

            // 거리를 표시할 HTML 요소를 생성하거나 업데이트합니다.
            if (resultElement) {
              resultElement.innerHTML = distance / 1000; // 거리를 킬로미터로 표시하도록 조정할 수 있습니다.
              console.log(distance / 1000);
            }
        }

    }
    
</script>
			</div>

			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="pagination-wrap">
						<ul>
							<li><a href="#">Prev</a></li>
							<li><a href="#">1</a></li>
							<li><a class="active" href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end products -->


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