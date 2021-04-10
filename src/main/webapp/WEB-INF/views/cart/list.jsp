<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
 <!--
<script>
  function numcheck(val,jaego){
                        if (val>jaego-1){
                                alert("재고량이 없습니다")
                                document.frm.ea.value=jaego}
                        else if (val<2){
                                document.frm.ea.value=1        }
        }
function up(val,jaego){
                        if (val>jaego-1){
                                alert("재고량이 없습니다")
                                document.frm.ea.value=jaego}
                        else{
                                document.frm.ea.value=(val/1)+1}
}
                                                         
function down(val){
                        if (val<2){
                                document.frm.ea.value=1}
                        else{
                                document.frm.ea.value=val-1}
}
</script>
  -->
<div class="container-fluid">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>CART</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>

	
<div id="contents">
	<!-- EDNplus 장바구나 스크립트 -->
	<script type="text/javascript"
		src="//script.about.co.kr/templates/script/cm/adbay.cart.controller.js"></script>


	<div id="adbay_cart" style="display: none;"></div>
	<!-- EDNplus 장바구나 스크립트 종료 -->

	<!-- 장바구니 모듈 Package -->
	<div class="xans-element- xans-order xans-order-basketpackage ">
		<!-- 혜택정보 -->
		<!-- 탭 -->

		<!-- 장바구니 비어있을 때 -->
		<!-- 할인금액 노출 : 삭제 시 할인금액이 노출되지 않습니다.-->
		<!-- 일반상품 -->
		<div class="orderListArea">
<form id="actionForm">
			<!-- 일반상품 (기본배송) -->
			<table border="1" summary=""
				class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
				
				<thead>
					<tr>
						<th scope="col" class="chk"></th>
						<th scope="col" class="thumb">&nbsp;</th>
						<th scope="col" class="product">ITEM</th>
						<th scope="col" class="price">PRICE</th>
						<th scope="col" class="amount">AMOUNT</th>
						<th scope="col" class="charge">CHARGE</th>
						<th scope="col" class="total">TOTAL</th>
						<th scope="col" class="button">SELECT</th>
					</tr>
				</thead>
				
				<tbody class="xans-element- xans-order xans-order-list">
				
					<c:set var="sum" value="0" />
					<c:forEach items="${bookList }" var="bookList" varStatus="status">
					
					<tr class="xans-record-">
						<td>
							<input type="checkbox" id="checkBook">
						</td>
						<td>
							<a><img style="width: 220px;" src= "${bookList.fileName}"></a>
						</td>
						<td>
							<p>${bookList.book_title }</p>
							<input type="hidden" name="book_id" id="book_id" value="${bookList.book_id }">
							</td>
						<td>
							<p><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></p>
						</td>
						
						<td>
						
							<span class="btn-group-vertical">
								<button onclick="modifyAmount()" name="cartAmount" value="${cartList[status.index].amount + 1 }" style="border: 0; background-color: #ffffff;"><i class="fas fa-sort-up" ></i></button>
								<button onclick="modifyAmount()" name="cartAmount" value="${cartList[status.index].amount - 1 }" style="border: 0; background-color: #ffffff;margin: 10 10"><i class="fas fa-sort-down" ></i></button>
							</span>
							<input id="cartAmount" name="cartAmount" size="2" value="${cartList[status.index].amount }"type="text">		
							<input class="btn btn-outline-secondary btn-sm" onclick="modifyAmount()" type="button" value="변경">
                		
                		</td>

						<td>
							<p class="displaynone">
								0원<span class="displaynone"><br></span><br>
							</p>무료
						</td>
						<td class="total">
						
							<strong><fmt:formatNumber value="${bookList.book_price * cartList[status.index].amount  }" type="currency"></fmt:formatNumber></strong>
							<input type="hidden" name ="totalPrice" value="${bookList.book_price * cartList[status.index].amount  }">
						</td>
						<td class="button"><a href="javascript:;"
							onclick="Basket.orderBasketItem(0);" class="btntype6">주문하기</a> 
							<a href="javascript:;" onclick="cart()">삭제</a>
							
					</tr>
					<c:set var="sum" value="${sum + (bookList.book_price * cartList[status.index].amount )}" />
					 </c:forEach>
					
					<tfoot>
				
					<tr>
						<td colspan="10">상품구매금액
							<strong><fmt:formatNumber value="${sum}"></fmt:formatNumber></strong>
							<span class="displaynone"> </span> + 배송비 <strong><fmt:formatNumber value="${sum < 30000 ? 2500 : 0 }"></fmt:formatNumber></strong>
							<span class="displaynone"> </span> = 합계 : <strong><fmt:formatNumber value="${sum < 30000 ? sum+2500 : sum }" type="currency" ></fmt:formatNumber></strong>
							<span class="displaynone"> </span></td>
					</tr>
				</tfoot>
				</tbody>
			
			</table>
			</form>
		</div>
		
		
		<!-- 선택상품 제어 버튼 -->
		<div class="xans-element- xans-order xans-order-selectorder ">
			<span class="left"> <strong class="ctrlTxt">선택상품을</strong> <a
				href="#none" onclick="Basket.deleteBasket()" class="btntype8">삭제하기</a>

			</span> <span class="right"> <a href="#none"
				onclick="Basket.emptyBasket()" class="btntype8">장바구니비우기</a>
			</span>
		</div>


		<!-- 주문 버튼 -->
		<div class="xans-element- xans-order xans-order-totalorder">
			<button class="btn btn-dark" onclick="location.href='/order/list'"> 선택상품 주문하기</button>
			
		</div>
		<br>
		<!-- 네이버 체크아웃 구매 버튼  -->
		<div id=""></div>
	</div>
	<!-- //장바구니 모듈 Package -->

	<!-- 관심상품 목록 -->
	<div
		class="xans-element- xans-myshop xans-myshop-wishlist displaynone xans-record-">
		<!--
    $login_page = /member/login.html
    $count = 5
    $mode = basket
    -->

	</div>
</div>

</div>
<div class="modal" tabindex="-1" id="cartDelete_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="cart_modal_body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="deleteBtn" onclick="cartdelete()">삭제</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function cart(){
		var actionForm = $("#actionForm");

	    $('#cart_modal_body').html("선택하신 상품을 삭제하시겠습니까?");
		$('#cartDelete_modal').modal('show');
		
		$('#deleteBtn').click(function(e) {
			actionForm.attr("action", "/cart/remove").attr("method", "post");
			actionForm.submit();
		});
	}	
	function modifyAmount(){
		var actionForm = $("#actionForm");
		
			actionForm.attr("action", "/cart/modify").attr("method", "post");
			actionForm.submit();
		
		
	}
	
	function setAmount(choice){
		
		if(choice === 'up'){
			var amount = $('#cartAmount').val()
			amount *= 1;
			++amount;
			
			
			
		}
	}	
	
	
	


</script>

<%@ include file="../includes/footer.jsp"%>