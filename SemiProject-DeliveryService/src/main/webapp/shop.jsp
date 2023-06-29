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
	<title>스토어 리스트</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon-duck2_32.png">
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
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=87599c2f74b02fcf28a9638597678071&libraries=services"></script>

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
						<p>우리동네 배달 서비스</p>
						<h1>스토어 리스트</h1>
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
<!--                         single-category-item -->
                            <li data-filter="*">All</li>
                            <li data-filter=".한식">한식</li>
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
							<img src="assets/img/store/${stolist.storePicturePath}" alt="" width="175px" height="175px">
						</div>
						<h3>${stolist.storeName}</h3>
						<input type="hidden" id="location" value="${stolist.storeLocation}"/>
						<p id="result-${stolist.storeNumber - 1}"></p>
						<a href="#" onclick="handleLinkClick(event)" id="result1-${stolist.storeNumber - 1}" class="cart-btn"><i class="fas fa-shopping-cart"></i> 주문하러가기</a>
						<script type="text/javascript">
							function handleLinkClick(event) {
								event.preventDefault();
								var storeNumber = parseInt(event.target.id.split('-')[1]) + 1;
								var dynamicId = "result1-" + (storeNumber - 1);
								
								var element = document.getElementById(dynamicId);
								let distance = element.getAttribute("data-distance");
								let index = element.getAttribute("data-index");

								console.log(distance);
								console.log(index);
								console.log('${address}');

								let url = "StoFindStoreAndFoodListDetailByStoreName.do?storenumber=" + (parseInt(index) + 1) + "&distance=" + distance ;
								window.location.href = url;
							}
						</script>
					</div>
				</div>
				</c:forEach>
				<script type="text/javascript">
				async function getCoordinates(startaddress, arriveaddress, resultId, index) {
				    var geocoder = new kakao.maps.services.Geocoder();

				    var startlatitude = null;
				    var startlongitude = null;
				    var arrivelatitude = null;
				    var arrivelongitude = null;

				    await new Promise(function(resolve, reject) {
				        geocoder.addressSearch(startaddress, function(result, status) {
				            if (status === kakao.maps.services.Status.OK) {
				                startlatitude = result[0].y;
				                startlongitude = result[0].x;
				                console.log("출발위도:"+startlatitude);
				                console.log("출발경도:"+startlongitude);

				                resolve();
				            } else {
				                reject("출발 주소를 찾을 수 없습니다.");
				            }
				        });
				    });

				    await new Promise(function(resolve, reject) {
				        geocoder.addressSearch(arriveaddress, function(result, status) {
				            if (status === kakao.maps.services.Status.OK) {
				                arrivelatitude = result[0].y;
				                arrivelongitude = result[0].x;
				                console.log("도착위도:"+arrivelatitude);
				                console.log("도착경도:"+arrivelongitude);

				                resolve();
				            } else {
				                reject("도착 주소를 찾을 수 없습니다.");
				            }
				        });
				    });

				    await calculateDistance(resultId, index, startlatitude, startlongitude, arrivelatitude, arrivelongitude);
				    nextFunction(index);
				}
				
				function calculateDistance(resultId, index, startlatitude, startlongitude, arrivelatitude, arrivelongitude) {
				    var polyline = new daum.maps.Polyline({
				        path: [
				            new daum.maps.LatLng(startlatitude, startlongitude),
				            new daum.maps.LatLng(arrivelatitude, arrivelongitude)
				        ],
				    });

				    var distance = polyline.getLength();
				    console.log("distance:"+distance);
				    var chkfree = null;
				    if(distance>2000 && distance<4000){
				    	chkfree = "배달 요금 : 1000";
			    	}else if(distance>0 && distance<2000){
			    		chkfree = "배달 요금 : 무료";
			    	}else if(distance>4000){
			    		chkfree = "배달 요금 : 2000";
			    	}
				    resultId = "result-" + index;
				    $("#" + resultId).html(chkfree);
				    
				    // data-distance에 distance 값을 저장
				    var linkElement = document.getElementById("result-" + index);
				    var linkElementbtn = document.getElementById("result1-" + index);

				    if (linkElement) {
			    	  linkElement.setAttribute("data-distance", distance/1000);
			    	  linkElement.setAttribute("data-index", index);
			    	  linkElementbtn.setAttribute("data-distance", distance);
			    	  linkElementbtn.setAttribute("data-index", index);

			    	} else {
			    	  console.error("Link element not found for index: " + index);
			    	}				 
				    
				    return new Promise(function(resolve, reject) {
				        resolve();
				    });
				}
				
				function nextFunction(index) {
				    console.log("다음 함수 실행. Index: " + index);
				    // 결과를 웹 페이지에 표시할 HTML 요소를 선택합니다.
				    resultId = "result-" + index;
				    console.log("nextFunction-resultId:"+resultId)
				    var resultElement = document.getElementById(resultId);

				    var distances = Array.from(document.querySelectorAll(".single-product-item[data-chk]")).map(function (item) {
				        var distanceElement = item.querySelector("p");
				        var distance = distanceElement ? parseFloat(distanceElement.textContent) : null;
				        return distance;
				    });

				    distances.sort(function (a, b) {
				        return b - a;
				    });

				    var productList = document.querySelector(".product-lists");

				    if (productList) {
				        var items = Array.from(productList.children);
				        items.sort(function (a, b) {
				            var distanceAElement = a.querySelector("p");
				            var distanceBElement = b.querySelector("p");
				            var distanceA = distanceAElement ? parseFloat(distanceAElement.textContent) : null;
				            var distanceB = distanceBElement ? parseFloat(distanceBElement.textContent) : null;
				            return distanceA - distanceB;
				        });

				        items.forEach(function(item) {
				            productList.insertBefore(item, productList.firstChild);
				        });
				    }
				}

				$(function() {
					const queryString = window.location.search;
					const urlParams = new URLSearchParams(queryString);
					const value = "."+urlParams.get('category');
					const sortBy = urlParams.get('distance'); 
					
					const customSortFunction = function(a, b) {
					  const distanceA = parseFloat(a.getAttribute('data-distance'));
					  const distanceB = parseFloat(b.getAttribute('data-distance'));
					
					  if (distanceA < distanceB) {
					    return -1;
					  } else if (distanceA > distanceB) {
					    return 1;
					  } else {
					    return 0;
					  }
					};
					
					// 초기 isoptope class="active" 설정
					let category = "${category}";
					let filterValue = "." + category;
					$("li[data-filter='" + filterValue + "']").addClass("active");

					$(".product-lists .single-product-item").each(async function(index) {
					  var startaddress = "<c:out value='${address}' />";
					  var arriveaddress = $(this).find("input#location").val();
					  console.log("arriveaddress: " + arriveaddress);
					  var resultId = "result-" + $(this).index();
					
					  await getCoordinates(startaddress, arriveaddress, resultId, index);
					
					  // 데이터를 받은 후에 정렬하여 isotope에 적용합니다
					  var productList = $(".product-lists");
					  
					  productList.isotope('arrange', { filter: value, sortBy: sortBy, sortAscending: true, sortFunction: customSortFunction });
					});
				});				    
				</script>
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