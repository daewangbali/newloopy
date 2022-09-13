<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>


<main>
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 1000px" >
		<div  style="width: 500px">
			
			<h2>도서 등록</h2>
			
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
<form id="registerBookForm" method="post" action="/book/registerBook"  enctype="multipart/form-data">

		<table class="table" style="width: 100%">
			<tr>
				<td align="left">
				<span>카테고리 : </span> &nbsp 
					<select id="book_kategorie" name="book_kategorie"
						fw-filter="isNumber&amp;isFill" fw-label="카테고리" fw-alone="N"
						fw-msg="" style="width: 100px;height: 30px;margin-top: 4px">
							<option value="IT/컴퓨터">IT/컴퓨터</option>
							<option value="외국어">외국어</option>
							<option value="소설">소설</option>
							<option value="여행">여행</option>
							<option value="요리">요리</option>
							<option value="어린이">어린이</option>
					</select>
				<br>
					<span>책제목 : </span> &nbsp 
					<input type="text" name="book_title" required="required" size="50" style="margin-top: 3px">
				<br>
					<span>지은이 : </span> &nbsp 
					<input type="text" name="book_writer" required="required" size="50" style="margin-top: 3px">
				<br>
					<span>출판사 : </span> &nbsp 
					<input type="text" name="book_publisher" required="required" size="50" style="margin-top: 3px">
				<br>
					<span style="margin-right: 12px">가격 : </span> &nbsp 
					<input type="number" name="book_price" required="required" size="20" style="margin-top: 3px">
				<br>
				<span style="margin-top: 5px">책설명 : </span> &nbsp
				<textarea rows="10" class="form-control" name="book_intro"  required="required"></textarea>
				<br>
				<input type="file" name="file">
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
