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
				<form name="goCart" action="/cart/addCart" method="post" 
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
							<input type="hidden" id="book_id" name="book_id" value="${book.book_id }">
							<input type="hidden" id="cartAmount" name="cartAmount" value="${amount }">
							<input type="hidden" id="user_number" name="user_number" value="${sessionScope.user_number }">						
							<!--<input class="btn btn-success" id="addcartBtn" value="장바구니 추가"> -->
							
							<a href="javascript:;" class="btn btn btn-warning"
								onclick="oneOrder()">바로 구매하기</a>
								
							<button type="submit" class="btn btn-success">장바구니 추가</button>
						</div>
					</div>
					</div>
					<!-- /.card -->
				</form>
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

	function oneOrder(){
		var amount = document.getElementById("amount").value;
		
		$.ajax({
			url: "/order/oneBookOrder",
			type: "POST",
			data: { "book_id" : ${book.book_id } , "cartAmount" : amount },
			success : function(){
	    		location = '/order/oneBookOrder';
			 	},
		  	error : function(){
			    alert("상품을 선택해주세요!");	
			}
		});
	}

	if(${message} != null){
		if(confirm("장바구니에 담겼습니다! 지금 바로 장바구니로 이동하시겠습니까? ")) {
			location.href="/cart/list";
		}else {
			history.go(-1);
		}
	}
	
	

/*
	function gocart(){
		$('#cartCheck').modal('show');
   		var form = document.goCart;
   		form.submit();

   		
	}

	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		
		$('#addcartBtn').click(function(e) {
			e.preventDefault();//이벤트 자동발생 막아줌
			gocart();
			
			if(modalShow != null){
				
			$('#cartCheck').modal('show');
			}
			
			
		});
		
		$('#goCartList').click(function(e) {
			gocart();
		});
		
		$('#stay').click(function(e) {
			gocart();
		});
		
		
		$('#stayBtn').click(function(e) {
			actionForm.attr("action", "/board/remove").attr("method", "post");
			actionForm.submit();
		});

	});
*/
</script>

<%@ include file="../includes/footer.jsp"%>
