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
					<div class="site-logo">
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
												<a href="FindMemberBy.do?user_id=${member.userId}"
													style="margin-left: 10px">${member.userName}님 마이페이지</a> <a
													class="shopping-cart" href="cart.jsp"><i
													class="bi bi-cart"></i></a> <a href="Logout.do" onclick="return confirm('로그아웃을 하시겠습니까?');">로그아웃
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<a href="login.jsp"><i class="bi bi-person-circle"></i></a>
											<%--login.jsp --%>
										</c:otherwise>
									</c:choose>
									<script type="text/javascript">

									</script>
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

