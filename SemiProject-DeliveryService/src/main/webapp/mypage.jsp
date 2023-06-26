<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" id="viewport"
	content="width=1119px, user-scalable=yes">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<!-- 사용자지정 태그 -->
<meta name="description" content="">
<meta name="title" content="오,2km">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>오, 2km</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/asset/css/font.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/ol.css">
<!--메인에는 sub.css 호출하지않음-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/sub.css">
<!--//메인에는 sub.css 호출하지않음  -->

<script type="text/javascript">

	/*gps lsm 전역변수 */
	var lat;
	var lon;
	var xdot;
	var ydot;
	var address;
	var gps_yn;
	
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2018/w";
	function goLink(menuCode, link) {
		location.href = link;
	}
	$(document).ready(function() {
		$.ajaxSetup({cache:false});

		setBasketCnt();

		// 주문&주문트레커 조회(가입회원/인증회원)
		/* 
				$.ajax({
					type: "POST",
					url: "/mypage/leftMyOrderInfoAjax",
					dataType : "json",
					success:function(data) {
					 	if (data.resultData.status == "success") {
					 		// 현재 주문 진행중인건이 있으면
					 		if(data.resultData.ingOrderCnt > 0){
					 			var stateCode = data.resultData.state_code;
					 			$('#ingOrderInfo').show();
						 		$('#gnbOrderCnt').text("("+data.resultData.ingOrderCnt+")");
						 		$('#tracker_order_no').val(data.resultData.order_no);

						 		if(stateCode == '1' || stateCode == '2'){
						 			$(".tracker_step").parent().addClass("active");  // 접수완료
						 		}else if(stateCode == '3'){
						 			$(".tracker_step2").parent().addClass("active"); // 요리중
						 		}else if(stateCode == '4'){
						 			$(".tracker_step3").parent().addClass("active"); // 배달중
						 		}else if(stateCode == '5'){
						 			$(".tracker_step4").parent().addClass("active"); // 배달완료
						 		}else{
// 						 			console.log("Left 주문내역 가져오기 실패");
						 		}
					 		}
						} else {
// 							console.log("Left 주문내역 가져오기 실패");
						}
					}
				});
			 */
		
		if("Y" == "Y"){
			$(".qnaForm-title").html("1:1문의/칭찬");
		} 
	});

	function qnaFormConfirm(){
		if("Y" == "Y"){
	        location.href = "/mypage/qustionList";
	    }else{
	   	 	if (confirm("회원일 경우, 로그인 후 1:1 문의로 남겨주시면 나의정보에서 답변을 빠르게 확인하실 수 있습니다.\n로그인 하시겠습니까?")) {
		   	 	var loginUrl = '/global/login?returnUrl=';
		   		 
		   		if("true"){
					location.href = "/global/logout?returnUrl=" + loginUrl + "/mypage/qustionList";
				 } else{
					location.href = loginUrl + "/bbs/qnaForm";
				 }
		   		
		     } else {
	           location.href = "/bbs/qnaForm";
		     }
	    }
	}
	
	function setBasketCnt() {
		var basketCnt = cookieManager.getCookie("BASKETCNT");
		var basket = cookieManager.getCookie("BASKET");
		var finish_basket = cookieManager.getCookie("FINISH_BASKET");

		if(basketCnt == "") basketCnt = "0";
		else if(basket != "" && basket == finish_basket) basketCnt = "0";
		
		if(basketCnt != "0"){ 
			$(".btn-cart > strong ").addClass("cart-count");
			$(".cart-count").text(basketCnt);
		}else{
			$(".btn-cart > strong").removeClass("cart-count");
		}
	}

	var goCart = function() {
		location.href="/basket/detail";
	};

	var doLogin = function() {
		location.href="/global/login";
	};

	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="/mypage/myOrderView?order_no="+order_no+"&pageNo=1";
	};
	
	var goPresentLogin = function(gubun) {
		var rtnUrl = "/voucher/list?gubun="+gubun;
		if("true" == "true"){
			location.href = rtnUrl;
		}else{
			location.href = "/global/login?returnUrl="+rtnUrl;	
		}
	};
	
	function appendLocation(paramArr) {
		var simpleAddress;
		
		gps_yn = 'Y';
		
		if (paramArr == null || paramArr.length == 0){
			return;
		}
		
		$.ajax({
		    type: "GET",
		    url: "/gis/getXyAddressAjax",
		    data: paramArr.join('&'),
		    
		    success:function(data) {
		        $('#myloc').html("");
		        
		        if(data.resultData.result.length > 0) {
		        	var html = '';
					html += '<div class="tip-box center" id="tip-box">';
					html += '<p>주변 매장의 프로모션을 확인해보세요!</p>';
					html += '</div>';
					
					$("#tip-box-top").append(html);
					$("#tip-box").delay(2000).fadeOut(1000);
					
		       		$.each(data.resultData.result, function(i, v) {
		       			if(v.roadaddr === ''){
		       				simpleAddress = v.sggname+' '+v.bemdname+' '+v.jbmain+(v.jbsub=='0'?'':'-'+v.jbsub);
		       				$('#myloc').html(simpleAddress);
		       				lat = v.lat;
		       				lon = v.lon;
		       				xdot = v.kx;
		       				ydot = v.ky;
		       				address = simpleAddress;
		       				
		       			}else{
		       				simpleAddress = v.roadname+' '+v.bdmain+(v.bdsub=='0'?'':'-'+v.bdsub);
		       				$('#myloc').html(simpleAddress);
		       				lat = v.lat;
		       				lon = v.lon;
		       				xdot = v.kx;
		       				ydot = v.ky;
		       				address = simpleAddress;
		       			}
		       		});
		   	    }else {
		       		 $('#myloc').html("주변 매장의 프로모션이 궁금하시면, 위치 서비스를 허용해주세요.");
		    	}
		    },
		    error: function (error){
		        alert("다시 시도해주세요.");
		    }
		    
		});
	}
	
	//현재 위치 받아오기

	var geo = {
		init : function() { 
			
			if ('geolocation' in navigator) {
				/* 지오로케이션 사용 가능 */
				navigator.geolocation.getCurrentPosition(geo.success, geo.error);
				
			} else {
				/* 지오로케이션 사용 불가능 */
				alert('geolocationx');
				alert('사용자의 브라우저는 지오로케이션을 지원하지 않습니다.');

				//geo.changeTab();
			}
		},
		success : function(position) {

			var latitude  = position.coords.latitude;
		    var longitude = position.coords.longitude;
		  	// console.log('<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>');

		    findLocation(latitude, longitude);
		},
		error : function(err) {
			
			var userAgent = navigator.userAgent.toString();

			if(/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream){ // iOS
				alert('아이폰 > 설정 >개인정보보호 > 위치서비스 > 오,2km 항목의 위치접근허용을 체크해주세요.');
				return;
			} else {
				//alert('위치접근허용을 승인해주세요.');
				$('#myloc').html('주변 매장의 프로모션을 확인해보세요!');
				return;
				/* var latitude  = '37.539465';
				var longitude = '127.052185';

				findLocation(latitude,longitude);
				gps_yn = 'Y'; */
			}
		}
	}



	function findLocation(lat,lon) {
		//if (!!!optn) return;

		// 검색 파라미터 설정
		var paramArr = [];	
		paramArr[0] = 'lat=' + lat;
		paramArr[1] = 'lon=' + lon;
		
		appendLocation(paramArr);
	}
	
	function gpsLsm(gps_yn){
		if(gps_yn == 'Y'){
			address = encodeURIComponent(address);
			UI.layerPopUp({selId:'#pop-lsm', url:'/branch/gpsLsm', data:{lon:lon, lat:lat, xdot:xdot, ydot:ydot, address:address}});
			address = decodeURIComponent(address);
			_trk_call();
		}else{
			alert('위치접근허용을 승인해주세요.');	
		}
	}
	
	var _trk_call = function () {
	    // 트래킹
		var _trk_url = document.baseURI + '&_TRK_PI=WP_1P&_TRK_CP=LSM 팝업';
	    try {
	       	_trk_code_base = _trk_code_base.replace(/(du=).*?(&)/,'$1' + escape(_trk_url) + '$2');
	        _trk_flashEnvView("_TRK_PI=WP_1P","_TRK_CP=LSM 팝업");
	        /* console.log('TRK WEB_3_2 DONE!!'); */
	    } catch (e) {
	    	console.log(e.message);
	    }
		
	}
</script>
<!-- Set AdBrix Web SDK -->
<script>!function(e,r){if(void 0!==e&&!e.adbrix){var o={queue:[]},t=navigator.userAgent.toLowerCase(),c=r.createElement("script"),a="Netscape"===navigator.appName&&-1!==navigator.userAgent.search("Trident")||-1!==t.indexOf("msie")?"abx-web-sdk.ie.min.js":"abx-web-sdk.min.js";c.type="text/javascript",c.async=!0,c.src="//static.adbrix.io/web-sdk/latest/"+a,c.onload=function(){e.adbrix.runQueuedFunctions?e.adbrix.runQueuedFunctions():console.log("[adbrix] Error: could not load SDK")};var i=r.getElementsByTagName("script")[0];i.parentNode.insertBefore(c,i);["init","onInitialized","login","getUserId","logout","userProperty.get","userProperty.getAll","userProperty.addOrUpdate","userProperty.remove","userProperty.removes","common.signUp","common.invite","common.useCredit","common.purchase","event.send","debug.traceListener","commerceAttr.categories","commerceAttr.product","commerce.viewHome","commerce.categoryView","commerce.productView","commerce.addToCart","commerce.addToWishList","commerce.reviewOrder","commerce.refund","commerce.search","commerce.share","commerce.listView","commerce.cartView","commerce.paymentInfoAdded","game.tutorialComplete","game.characterCreated","game.stageCleared","game.levelAchieved"].forEach(function(e){var r=e.split("."),t=r.pop();r.reduce(function(e,r){return e[r]=e[r]||{}},o)[t]=function(){o.queue.push([e,arguments])}}),e.adbrix=o}}(window,document);
	</script>

<!-- AdBrix Web SDK init -->
<script>
	window.adbrix.init({
	appkey: 'iKSRi1xdMES5FzDWh7bbwg',
	webSecretkey: 'mdcoW2QIKk6dHm2g3pew4g'
	});
	</script>
<!-- End AdBrix Web SDK -->

<!-- Google Tag Manager -->
<script>
	(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-N52VV58');
	</script>
<meta http-equiv="origin-trial"
	content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<meta http-equiv="origin-trial"
	content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<meta http-equiv="origin-trial"
	content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<meta http-equiv="origin-trial"
	content="A+xK4jmZTgh1KBVry/UZKUE3h6Dr9HPPioFS4KNCzify+KEoOii7z/goKS2zgbAOwhpZ1GZllpdz7XviivJM9gcAAACFeyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiQXR0cmlidXRpb25SZXBvcnRpbmdDcm9zc0FwcFdlYiIsImV4cGlyeSI6MTcwNzI2Mzk5OSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
<script attributionsrc="" type="text/javascript" async=""
	src="https://www.googleadservices.com/pagead/conversion/11048720240/?random=1687247647320&amp;cv=11&amp;fst=1687247647320&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45He36e0&amp;u_w=1920&amp;u_h=1080&amp;url=https%3A%2F%2Fweb.dominos.co.kr%2Fmypage%2FmyOrderList&amp;ref=https%3A%2F%2Fweb.dominos.co.kr%2Fmypage%2FmyLevel&amp;label=mzzvCMuJiYYYEPCuuJQp&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=%EB%8F%84%EB%AF%B8%EB%85%B8%ED%94%BC%EC%9E%90&amp;value=0&amp;bttype=purchase&amp;gclaw=CjwKCAjwhJukBhBPEiwAniIcNUQCa-KYYUfbsTXjtW4qWfZTjo41Nlf5itzQ4QPqD2WeCu0cdMegKRoC0asQAvD_BwE&amp;auid=621761916.1684372177&amp;rfmt=3&amp;fmt=4"></script>
</head>
<body>
	<!-- top_event_bnr -->
	<!-- <div class="top_bnr top_event" id="lineBanner">
		<div class="top_event_wrap">
			<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
		</div>
	</div> -->
	<!-- //top_event_bnr -->
	<!-- 	<div id="wrap">
		<header id="header" style="transform: translateY(0px);">

			<div class="top-wrap">
				<div class="inner-box" id="tip-box-top">
					<a href="/main" class="btn-logo"> <i class="oh2km-logo"></i>
						<h1 class="hidden">오,2km</h1>
					</a>

			<div class="util-nav">
				<a href="/logout">로그아웃</a> <a href="/mypage/myInfo">나의 정보</a> <a
					href="javascript:goCart();" class="btn-cart"> <i
					class="ico-cart"></i> <span class="hidden ">장바구니</span> <strong
					class="cart_count"></strong> count
				</a>
			</div>
		</header>
	</div> -->

	<!-- main 1dep menu -->
	<!--		<div id="gnb" class="gnb-wrap">
				<div class="gnb-inner">
					<ul>
						<li class="active">
							<a href="/goods/list?dsp_ctgr=C0101"><span>메뉴</span></a>
						</li>
						<li>
							<a href="/ecoupon/main"><span>e-쿠폰</span></a>
						</li>
						<li>
							<a href="/voucher/list?gubun=M"><span>상품권 선물</span></a>
						</li>
						<li>
							<a href="/event/list?gubun=E0200"><span>이벤트·제휴</span></a>
						</li>
						<li>
							<a href="/branch"><span>매장검색</span></a>
						</li>
						<li>
							<a href="/company/contents/chainstore1"><span>가맹점 모집</span></a>
						</li>
					</ul> <a href="javascript:void(0);" class="snb-more">더보기</a>
	</div>
	</div> -->
	<!-- //main 1dep menu -->

	<!-- //header -->
	<!-- container -->
	<div id="container">
		<section id="content">
			<div class="sub-type mypage">
				<div class="inner-box">
					<div class="page-title-wrap">
						<h2 class="page-title">나의 정보</h2>
						<div class="depth-area">
							<ol>
								<li><a href="../index.jsp">홈</a></li>
								<li><strong>주문내역</strong></li>
							</ol>
						</div>
					</div>
					<article class="mypage-wrap mypage-grade">
						<div class="menu-nav-wrap">
							<div class="menu-nav">
								<ul class="nav nav-tabs" role="tablist" style="background: none">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="update-form.jsp" style="margin-top: 15px"
										onclick="updateMember()">회원정보수정</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="myOrderList">주문내역보기</a></li>
									<!-- 									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="myQna">1:1 문의</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="myReview">내가 쓴 리뷰 보기</a></li> -->
								</ul>

							</div>
						</div>
						<div class="info-wrap">
							<c:choose>
								<c:when test="${sessionScope.member!=null}">
									<div class="user">
										<span>${member.userName}</span>님이 주문하신 내역입니다.
									</div>
								</c:when>
							</c:choose>
							<div class="text-type">주문을 취소하시려면 고객센터로 문의하시기 바랍니다.</div>
						</div>
						<div class="tab-type6"></div>
						<div class="order-list">
							<div class="no-data">주문내역이 없습니다.</div>
							<div class="cart-section mt-150 mb-150">
								<div class="container">
									<div class="row">
										<div class="col-lg-8 col-md-12">
											<div class="cart-table-wrap">
												<table class="cart-table" style="align-items: center">
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
														<tr class="table-body-row">
															<td class="product-remove"><a href="#">1</a></td>
															<td class="product-remove"><a href="#">한식당</a></td>
															<td class="product-image"><img
																src="assets/img/음식카테고리/한식.png" alt=""></td>
															<td class="product-name">비빔밥</td>
															<td class="product-price">8,000원</td>
															<td>
																<button id="decreaseButton" class="btn btn-secondary">-</button>
																<input type="text" placeholder="0" style="width: 30px">
																<button id="increaseButton" class="btn btn-secondary">+</button>
															</td>
															<td class="product-total">8,000원</td>
															<td class="product-total"><button type="button"
																	class="btn btn-link">삭제</button></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="btn-wrap">
								<a href="${pageContext.request.contextPath}/index.jsp"
									class="btn-type v3" style="border-radius: 5%">지금 주문하러 가기</a> <a
									href="${pageContext.request.contextPath}/cart.jsp"
									class="btn-type v4" style="border-radius: 5%">장바구니 보러가기</a>
							</div>
						</div>
					</article>
				</div>
			</div>
		</section>
	</div>
	<!--팝업-주문내역 이용안내 -->
	<div class="pop-layer" id="pop-order-info">
		<div class="dim"></div>
		<div class="pop-wrap">
			<div class="pop-title-wrap">
				<h2 class="pop-title v2">주문내역 이용안내</h2>
			</div>
			<div class="pop-content">
				<div class="pop-text">
					<div class="title-type2">주문내역 이용안내</div>
					<ul class="list-text-v2">
						<li>매장 또는 콜센터/ 다른 이름으로 주문하신 내역은 온라인 주문내역에 표시되지 않습니다.</li>
						<li>온라인 상으로 주문한 최초의 이력만 확인하실 수 있으며, 전화를 통해 변경하신 사항은 반영되지
							않습니다.</li>
						<li>주문번호를 클릭하시면 상세정보(주문번호/배달장소/주문내역 등) 를 확인하실 수 있습니다.</li>
						<li>메뉴 변경이나 주문취소를 원하실 경우, 매장에 주문번호를 알려 주셔야 합니다. (온라인으로 주문취소는
							불가합니다.)</li>
						<li>결제방법을 수정하실 경우에는 해당 매장으로 직접 연락하셔야 하며, 배달 중에는 변경 불가합니다.</li>
						<li>영수증 출력을 원하시는 고객님은 주문상세 페이지의 ‘영수증 출력’을 클릭하시면, 해당 주문의 영수증을
							출력할 수 있습니다.</li>
						<li>주문이력은 최대 1년까지 확인 가능합니다.</li>
						<li>주문이력은 최근 3개월 내역까지만 삭제 가능합니다.</li>
					</ul>
				</div>
				<a href="#" class="btn-close"></a>
			</div>
		</div>
	</div>
	<!--//팝업-주문내역 이용안내 -->
	<form name="f" id="f" method="get" action="/mypage/myOrderList">
		<input type="hidden" name="order_no" id="order_no"> <input
			type="hidden" name="pageNo" id="pageNo" value="1">
	</form>

	<script type="text/javascript">
	//updateMember로 이동
    function updateMember() {
        var contextPath = "${pageContext.request.contextPath}";
        var updateMemberURL = contextPath + "/UpdateMemberForm.do";
        window.location.href = updateMemberURL;
    }	
	
	$(document).ready(function(){
		// 박스 위치 잡기				
		// 2020-01-06 수정
		$('.tip-box2').each(function() {
			var boxWidth = 0;
			var tipWidth = $(this).parent().find('.graph-inner').css("width").replace('px', '');
			var gradeWidth = $('.grade-wrap').innerWidth();
			boxWidth = $(this).innerWidth();
			var tipPosition = tipWidth - (boxWidth / 2);  
			if (gradeWidth <= (tipPosition + boxWidth)) {
				tipPosition = gradeWidth - boxWidth; 
				$('.tip-box2').addClass('right');
				
			} else if (tipPosition < 0) {
				tipPosition = 0;
				$(this).css('display','none');
			}
			// $('.tip-box2').css('width', boxWidth + 'px');
			$(this).css('left', tipPosition + 'px');
		});
	});
	

//주문 내역 삭제
function goDelete(order_no) {
	if(confirm('주문내역만 삭제될 뿐 주문이 취소되진 않습니다. \n취소를 하시려면 고객센터로 전화하셔야 합니다.')){
		$.ajax({
			type: "POST",
			url: "/mypage/myOrderDelete",
			data : { "order_no" : order_no },
			dataType : "json",
			cache : false,
			success:function(data) {
				alert(data.msg);
				if(data.status == "success")
					location.href="/mypage/myOrderList";
				return;
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});
	}
}

//주문 내역 상세보기
function goView(order_no) {
	if(order_no.length > 15 || parseInt(order_no.substring(0,8)) > 20090300 ){
		$('#order_no').val(order_no);
		$('#f').attr("action", "/mypage/myOrderView");
		$('#f').submit();
	}else{
		alert("2009년 3월 이전 주문내역은 콜센터로 문의 바랍니다.");
		return;
	}
}

//페이징
function paging(no){
	$("#pageNo").val(no);
	$('#f').attr("action", "/mypage/myOrderList");
	$("#f").submit();
}
</script>
	<script type="text/javascript">
	_TRK_PI = "WP_24_2";	
	_TRK_CP = "나의 정보>주문내역";
</script>


	<!-- 로딩 이미지 -->
	<!-- // 로딩 이미지 -->

	<!-- 로딩 이미지 -->
	<!-- 장바구니 담기 토스트 팝업(s) -->
	<div class="pop_toast" id="card_add" style="display: none;">
		<div class="bg"></div>
		<div class="pop_wrap">
			<div class="pop_content">
				<p>장바구니에 담았습니다.</p>
			</div>
		</div>
	</div>
	<!-- //장바구니 담기 토스트 팝업(e) -->

	<!-- 웨이팅 예약 팝업(s) -->
	<div class="pop_toast1" id="reserve_online" style="display: none;">
		<div class="bg"></div>
		<div class="pop_wrap">
			<div class="pop_content">
				<p></p>
			</div>
		</div>
	</div>
	<!-- //웨이팅 예약 팝업(e) -->

	<!-- 장바구니(s) -->
	<div class="pop_layer pop_type" id="cart_pop" style="display: none;">
		<div class="bg"></div>
		<div class="pop_wrap">
			<div class="pop_header">
				<h2>장바구니</h2>
			</div>
			<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//아이프레임대체 -->
			<a href="javascript:;" onclick="setBasketCnt();"
				class="btn_ico btn_close">닫기</a>
		</div>
	</div>
	<!-- //장바구니(e) -->

	<!-- GTM event member_info (gender+age+grade) -->
	<iframe height="0" width="0" style="display: none; visibility: hidden;"
		src="https://12702465.fls.doubleclick.net/activityi;src=12702465;type=count0;cat=ipm_70;ord=6989232393669;gtm=45He36e0;gclaw=CjwKCAjwhJukBhBPEiwAniIcNUQCa-KYYUfbsTXjtW4qWfZTjo41Nlf5itzQ4QPqD2WeCu0cdMegKRoC0asQAvD_BwE;auiddc=621761916.1684372177;~oref=https%3A%2F%2Fweb.dominos.co.kr%2Fmypage%2FmyOrderList?"></iframe>
	<script type="text/javascript">
	var sx = cookieManager.getCookie('SEX');
	var ag = cookieManager.getCookie('MY_LEVEL');
	var m = "";
	switch (sx) {
		case "F" : sx = "A"; break;
		case "M" : sx = "S"; break;
		default : sx = "D"; break;
	} 
	m = sx + ag;
	dataLayer.push({
		"ecommerce": {
			"member": m
		}
	});
	</script>
	<script type="text/javascript" id="" charset="UTF-8"
		src="//t1.daumcdn.net/kas/static/kp.js"></script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","561452602071314");fbq("trackSingle","561452602071314","PageView");</script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=561452602071314&amp;ev=PageView&amp;noscript=1">
	</noscript>

	<script type="text/javascript" id=""
		src="//fin.rainbownine.net/js/across_adn_2.0.1.js"></script>


	<script type="text/javascript" id="">kakaoPixel("969121011841453543").pageView();</script>
	<!-- 2017-05-08 // 챗봇 추가(s) -->

	<!-- <div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">닫기</a>
	</div>
</div> -->
	<!-- 2017-05-08 // 챗봇 추가(e) -->


	<script>
cookieManager.makePCID("PCID", 10);

$(".select-type.language").change(function() {
	
	location.href = $("#select-type").val();
});
</script>
	<div id="across_adn_container" style="display: none"></div>
	<script type="text/javascript" id="" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript" id="">try{var across_adn_contain=new fn_across_adn_contain,across_adn_param=[];across_adn_param={ut:"Home",ui:"107029"};across_adn_contain.init(across_adn_param)}catch(a){};</script>
	<script type="text/javascript" id="">if(!wcs_add)var wcs_add={};wcs_add.wa="s_273c36e36e8a";if(!_nasa)var _nasa={};wcs.inflow("dominos.co.kr");wcs_do(_nasa);</script>
</body>
</html>