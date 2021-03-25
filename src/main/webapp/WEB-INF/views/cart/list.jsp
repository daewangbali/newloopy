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

			<!-- 일반상품 (기본배송) -->
			<table border="1" summary=""
				class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
				
				<thead>
					<tr>
						<th scope="col" class="chk"><input type="checkbox"
							onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);"></th>
						<th scope="col" class="thumb">&nbsp;</th>
						<th scope="col" class="product">ITEM</th>
						<th scope="col" class="price">PRICE</th>
						<th scope="col" class="amount">AMOUNT</th>
						<th scope="col" class="charge">CHARGE</th>
						<th scope="col" class="total">TOTAL</th>
						<th scope="col" class="button">SELECT</th>
					</tr>
				</thead>
				<tfoot>
				
					<tr>
						<td colspan="10"><strong class="type">[기본배송]</strong> 상품구매금액
							<strong>138,000 <span class="displaynone">()</span></strong><span
							class="displaynone"> </span> + 배송비 0 (무료)<span
							class="displaynone"> </span> = 합계 : <strong class="total"><span>133,500</span>원</strong>
							<span class="displaynone"> </span></td>
					</tr>
				</tfoot>
				<tbody class="xans-element- xans-order xans-order-list">
					
					<c:forEach items="${bookList }" var="bookList" varStatus="status">
					
					<tr class="xans-record-">
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a><img style="width: 220px;" src= "${bookList.fileName}"></a>
						</td>
						<td>
							<p>${bookList.book_title }</p>
						</td>
						<td>
							<p><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></p>
						</td>
						
						<td>
							
						<span class="quantity">
						
								<a href="javascript:;" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">
									
									<i class="far fa-minus-square" onclick=down(${cartList[status.index].amount })></i>
								
								</a>
								<input id="quantity_id_0"
								name="quantity_name_0" size="2" value="${cartList[status.index].amount }" type="text">
								<a href="javascript:;"
								onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">
									<i class="far fa-plus-square"></i>
								</a></span> 
									<a href="javascript:;"
							onclick="Basket.modifyQuantity()">
							<img
								src="/web/season2_skin/base/btn/btn_quantity_modify.png"
								alt="변경" title=""></a>
								
                

						<td>
							<p class="displaynone">
								0원<span class="displaynone"><br></span><br>
							</p>무료
						</td>
						<td class="total">
						
							<strong><fmt:formatNumber value="${bookList.book_price * cartList[status.index].amount  }" type="currency"></fmt:formatNumber></strong>
							
						</td>
						<td class="button"><a href="javascript:;"
							onclick="Basket.orderBasketItem(0);" class="btntype6">주문하기</a> <a
							href="javascript:;" onclick="Basket.deleteBasketItem(0);"
							class="btntype7">삭제</a></td>
					</tr>
					
					 </c:forEach>
					
				</tbody>
			
			</table>
			
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
			<a href="#none" onclick="Basket.orderSelectBasket(this)"
				link-order="/order/orderform.html?basket_type=all_buy"
				link-login="/member/login.html" class=""><img
				src="/web/season2_skin/base/btn/btn_order_select.png"
				onmouseover="this.src='/web/season2_skin/base/btn/btn_order_select_over.png' "
				onmouseout="this.src='/web/season2_skin/base/btn/btn_order_select.png' "
				alt="선택상품주문" title=""></a> <a href="#none"
				onclick="Basket.orderAll(this)"
				link-order="/order/orderform.html?basket_type=all_buy"
				link-login="/member/login.html" class=" "><img
				src="/web/season2_skin/base/btn/btn_order_all.png"
				onmouseover="this.src='/web/season2_skin/base/btn/btn_order_all_over.png' "
				onmouseout="this.src='/web/season2_skin/base/btn/btn_order_all.png' "
				alt="전체상품주문"></a><span class="right"> <a href="/"
				class="btntype8">쇼핑계속하기</a>
			</span>
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



<%@ include file="../includes/footer.jsp"%>