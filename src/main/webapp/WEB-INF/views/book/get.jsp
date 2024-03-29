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
				
				<div class="card mt-4">
					<img style="height: 70%" class="card-img-top" src="${book.fileName}" alt="">
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

						<form id="actionForm" method="post">
							<div class="input-group"
								style="width: 15px 0; justify-content: center">
								<tr>
									<td class="fixed">수량</td>
									<td class="fixed">
									<select style="width: 60px;" name="amount" id="amount">
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
													
							<!--<input class="btn btn-success" id="addcartBtn" value="장바구니 추가"> -->
							
							
							<button type="button" id="goOrderBtn"  class="btn btn-warning">바로 구매하기</button>
							<button type="button" id="addCartBtn" class="btn btn-success">장바구니 추가</button>
							
						</div>
						
							<input type="hidden" id="book_id" name="book_id" value="${book.book_id }">
							
							<input type="hidden" id="user_number" name="user_number" value="${sessionScope.user_number }">
					</form>
						
					</div>
					</div>
					<!-- /.card -->
				
				</div>
			</div>
		</div>

</main>

<!-- 모달 창 띄우기 -->
	<div class="modal" tabindex="-1" id="cartCheck">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">장바구니</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="board_modal_body">
				<p>장바구니에 담겼습니다.</p>
			</div>
			<div class="modal-footer">
			 <button type="button" id="goCartList" name="result" value="goCartList" class="btn btn-primary" data-dismiss="modal">장바구니로 이동</button>
			 <button type="button" id="stay" name="result" value="stay" class="btn btn-secondary" data-dismiss="modal">계속 쇼핑하기</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

$(document).ready(function() {
	var actionForm = $("#actionForm");
	
	var book_id = [[${book.book_id }]];
	
	$('#goOrderBtn').click(function(e) {
		if($('#user_number').val()==""){
			alert("로그인 후 이용가능합니다.");
		}
		else{
			var amount = $('#amount').val();
			
			$.ajaxSettings.traditional = true;
			$.ajax({
			    url: "/order/oneBookOrder",
			    type: "POST",
			    data: { "book_id" : ${book.book_id } , "amount" : amount },
			    success : function(){
			     	location = '/order/oneBookOrder';
			    },
			    error : function(){
			    	alert("!!!!!!");	
			    }
			  });
		
		}
		
	});
	
	
	$('#addCartBtn').click(function(e) {
		if($('#user_number').val()==""){
			alert("로그인 후 이용가능합니다.");
		}
		else{
			actionForm.attr("action", "/cart/addCart").attr("method", "post");
			actionForm.submit();
		}
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>
