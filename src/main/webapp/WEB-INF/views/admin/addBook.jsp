<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/admin_header.jsp"%>

<div class="container-fluid" style="text-align: center;">
	<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<h2>도서 추가하기</h2>

			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<br>
</div>

<main>
	<div class="container-fluid">
		<form action="/admin/addBook" method="post" enctype="multipart/form-data" >
			<div class="container-fluid">
				
					<div class="form-group col-md-12">
							<div class="input-group mb-3">
								<input type="file" class="form-control" name="file" id="inputGroupFile02">	
							</div>
						</div>
				<br> <span style="justify-content: right;">
					<table>
					
						<tr>
							<th scope="row">도서 이름</th>
							<td><input size="50" id="book_title" name="book_title"
								class="inputTypeText" value="" type="text"></td>
						</tr>
						<tr>
							<th scope="row">작가</th>
							<td><input size="50" id="book_writer" name="book_writer"
								class="inputTypeText" value="" type="text"></td>
						</tr>
						<tr>
							<th scope="row">출판사</th>
							<td><input size="50" id="book_publisher" name="book_publisher"
								class="inputTypeText" value="" type="text"></td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td><input size="50" id="book_kategorie" name="book_kategorie"
								class="inputTypeText" value="" type="text"></td>
						</tr>
						<tr>
							<th scope="row">가격</th>
							<td><input size="50" id="book_price" name="book_price"
								class="inputTypeText" value="" type="text"></td>
						</tr>
						<tr>
							<th scope="row">도서 설명</th>
							<td><textarea id="book_intro" name="book_intro" rows="13"
									cols="100"></textarea></td>

						</tr>

					</table>
				</span>
				<button type="submit" id="addCartBtn" class="btn btn-success">도서
					등록하기</button>
			</div>
		</form>
	</div>

</main>



<%@ include file="../includes/footer.jsp"%>

