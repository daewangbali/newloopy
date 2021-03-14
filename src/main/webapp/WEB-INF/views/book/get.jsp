<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<main>

	<!-- Page Content -->
	<div class="container">
	
		<div class="row" style="justify-content: center">

			<div class="col-lg-9" style="text-align: center; width: 800px">
				<form action="/cart/addCart" method="post" 
							style="margin: 0 0 10px">
				<div class="card mt-4">
					<img class="card-img-top" src="${book.fileName}" alt="">
					<div class="card-body">
						<h4 class="card-title">
							<a href="/book/get?book_id=${book.book_id }">${book.book_title }</a>
						</h4>
						<h5>
							<fmt:setLocale value="ko_KR" />
							<fmt:formatNumber value="${book.book_price }" type="currency"></fmt:formatNumber>
						</h5>
						<p>${book.book_writer } | ${book.book_publisher }</p>
						<p class="card-text">${book.book_intro }</p>

						
							<div class="input-group"
								style="width: 15px 0; justify-content: center">
								<tr>
									<td class="fixed">수량</td>
									<td class="fixed">
									<select style="width: 60px;" name="amount">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select>
									</td>
								</tr>
							</div>
						

						<div class="card-body">
							<input type="hidden" id="book_id" name="book_id" value="${book.book_id }">
							<input type="hidden" id="user_number" name="user_number" value="${sessionScope.user_number }">						
							<input type="submit" class="btn btn-success" value="장바구니 추가">
							<!-- <button type="submit" class="btn btn-success">장바구니 추가</button> -->
							<button class="btn btn-warning">바로 구매하기</button>
						</div>
					</div>
					</div>
					</form>
					<!-- /.card -->

				</div>
				<!-- /.col-lg-9 -->

			</div>

		</div>
</main>


<%@ include file="../includes/footer.jsp"%>
