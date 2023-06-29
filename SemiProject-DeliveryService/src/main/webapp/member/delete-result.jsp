<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.kosta.semiproject.model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container pt-3">
		<%
			String id = (String)session.getAttribute("user_id");
			String password = (String)session.getAttribute("password");
			
			MemberDAO dao = MemberDAO.getInstance();
			int result = dao.deleteMember(id, password);
	
			if(result > 0) {
				%>
		<script>
			alert("회원 탈퇴가 정상처리되었습니다.");
			location.href = "/index.jsp";
		</script>
		<% } else { %>
		<script>
			alert("회원 탈퇴에 실패했습니다. 지속적인 문제 발생시 관리자에게 문의바랍니다.");
			location.href = "delete-form.jsp";
		</script>
		<% } %>
	</div>
</body>
</html>