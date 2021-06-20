<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/admin_header.jsp"%>

<div class="container-fluid" style="text-align: center;">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>도서 수정</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>
</div>

<main>
	<div class="container-fluid">
		<form  action="/admin/book_modify" method="post">
			<div class="container-fluid">
				<div  style="justify-content: left;">
					<img style="width: 220px;" class="card-img-top"  src="${book.fileName}" alt="">
					<input type="hidden" id="fileName" name="fileName" value="${book.fileName}">
					<br>
					<button type="button" class="btn btn-success">파일 선택</button>
				</div>
				<br>
				<span style="justify-content: right;">
					<table>
						<tr>
							<th scope="row">도서 번호</th>
							<td ><input id="book_id" name="book_id"
								class="inputTypeText" value="${book.book_id }" type="text">
							</td>
						</tr>
						<tr>
							<th scope="row">도서 이름</th>
							<td><input id="book_title" name="book_title"
								class="inputTypeText" value="${book.book_title }" type="text">
							</td>
						</tr>
						<tr>
							<th scope="row">작가</th>
							<td><input id="book_writer" name="book_writer"
								class="inputTypeText" value="${book.book_writer }" type="text">
							</td>
						</tr>
						<tr>
							<th scope="row">출판사</th>
							<td><input id="book_publisher" name="book_publisher"
								class="inputTypeText" value="${book.book_publisher }" type="text">
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td><input id="book_kategorie" name="book_kategorie"
								class="inputTypeText" value="${book.book_kategorie }" type="text">
							</td>
						</tr>
						<tr>
							<th scope="row">도서 설명</th>
							<td>
								<textarea id="book_intro" name="book_intro" rows="13" cols="100">${book.book_intro }</textarea>
							
							</td>
							
						</tr>
						
					</table>
				</span>
				<button type="submit" id="addCartBtn" class="btn btn-success">수정하기</button>
			</div>
		</form>
	</div>

</main>



<%@ include file="../includes/footer.jsp"%>

