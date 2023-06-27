<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form method="post" action="ReviewWritePost.do">
		<table class="table">
		<%--
			<tr>
				<td><input type="text" name="title" placeholder="리뷰제목"
					required="required"></td>
			</tr>
		--%>
	
			<tr>
				<td><textarea rows="12" class="form-control" name="content"
						placeholder="리뷰내용" required="required"></textarea></td>
			</tr>
		</table>
		<div class="text-center">			
			<button type="submit" class="btn btn-primary">수정하기</button>
			<input type="hidden" name="storeName" value="${storeName}">
			<input type="hidden" name="storeNumber" value="${storeNumber}">
			<button type="reset" class="btn btn-primary">삭제하기</button>	
		</div>
	</form>