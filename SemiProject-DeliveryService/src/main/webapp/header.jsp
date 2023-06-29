<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
<div class="top-header-area" id="sticker">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-sm-12 text-center">
				<div class="main-menu-wrap">
					<!-- logo -->
					<div class="site-logo" id="ducklogo" style="margin-top: -30px">
						<a href="index.jsp"> <img src="assets/img/oh2km.png"
							alt="오리사진">
						</a>
					</div>
					<!-- logo -->

					<!-- menu start -->
					<nav class="main-menu">
						<ul>
							<li>
								<div class="header-icons">
									<c:choose>
										<c:when test="${sessionScope.member!=null}">
											<div style="display: flex; align-items: center;">
												<span style="color : #fff">${member.userName}님 환영합니다!</span>
												<a href="FindMemberBy.do?user_id=${member.userId}"
													style="margin-left: 10px"><i class="bi bi-person-circle fa-2x"></i>
												</a> 
												<a class="shopping-cart" href="#">
													<i class="bi bi-cart fa-2x"></i>
												</a>
												<a href="Logout.do" onclick="return confirm('로그아웃을 하시겠습니까?');">
													<i class="bi bi-box-arrow-right fa-2x"></i>
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<a href="login-chk-fail.jsp"
												style="margin-left: 10px"><i class="bi bi-person-circle fa-2x"></i>
											</a> 
											<a class="shopping-cart" href="login-chk-fail.jsp">
												<i class="bi bi-cart fa-2x"></i>
											</a>
											<a href="login.jsp"><i class="bi bi-box-arrow-in-right fa-2x"></i></a>
											<%--login.jsp --%>
										</c:otherwise>
									</c:choose>
								</div>
							</li>
						</ul>
					</nav>
					<a class="mobile-show search-bar-icon" href="#"><i
						class="fas fa-search"></i></a>
					<div class="mobile-menu"></div>
					<!-- menu end -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end header -->

