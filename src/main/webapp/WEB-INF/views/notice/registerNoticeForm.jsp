<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>


<main>
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 1000px" >
		<div  style="width: 500px">
			
			<h2>공지사항 작성하기</h2>
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<br>
<div style="width: 100%" align="left">
<form id="registerNoticeForm" method="post" action="/notice/registerNotice">

		<table class="table" style="width: 100%">
			<tr>
				<td align="left">
				<br>
					<span>제목 : </span> &nbsp 
					<input type="text" name="title" required="required" size="100" style="margin-top: 3px">
				<br>
				<br>
				<span style="margin-bottom: 20px">내용 : </span> &nbsp
				<textarea rows="10" class="form-control" name="content"  required="required"></textarea>
			
				</td>
				
			</tr>
			
		</table>
		<div class="text-center">
			<%-- <input type="hidden" name="boardCategori" value="${param.boardCategori}" th:value="${param.boardCategori}"> --%>
			<button type="submit" id="submitBtn" class="btn btn-success">확인</button>
			<!-- <button type="button" class="btn btn-light"  th:onclick="|location.href='@{/guest/findAllBoardList}'|">취소</button> -->
		</div>
	</form>
<br><br>
</div>
</main>

<%@ include file="../includes/footer.jsp"%>
