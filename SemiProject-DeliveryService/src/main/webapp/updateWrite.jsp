<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form method="post" action="ReviewUpdate.do">
	<table class="table">
		<tr>
			<td><textarea rows="12" class="form-control" name="content"
					placeholder="리뷰내용" required="required">${review.reviewContent}</textarea></td>
		</tr>
	</table>
	<div class="text-center">
		<input type="hidden" name="storeNumber" value="${review.storeVO.storeNumber}">
		<input type="hidden" name="storeName" value="${storeName}">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}">
		<button type="submit" class="btn btn-primary">리뷰 수정하기</button>
		<button type="reset" class="btn btn-primary">삭제하기</button>
	</div>
</form>