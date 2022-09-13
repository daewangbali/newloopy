<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/mypage_header.jsp"%>

<div class="container-fluid">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>주문내역</h2>
			
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
<form id="actionForm" >
			<!-- 일반상품 (기본배송) -->
			<table style="width: 100%" summary=""
				class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
				
				<tbody class="xans-element- xans-order xans-order-list">
					
					<c:set var="sum" value="0" />
					<c:forEach var="orderList" items="${orderList }"  >
					<%-- <c:forEach items="${orderItemList }" var="orderItemList" varStatus="status"> --%>
					<%-- <c:forEach items="${orderBookList }" var="orderBookList"> --%>
					<tr class="xans-record-">
						
					
					
						<td>
							<p id="orderBookChk" style="font-weight: bold;background-color:#ffcbf4">${orderList.order_credate } 주문내역 </p>
							
							<c:forEach var="orderItemList" items="${orderItemList }">
							<c:if test="${orderList.order_number eq orderItemList.order_number}"> 
								<span>
									<img style="width: 110px;" src="${orderItemList.fileName}">
								</span>
								<span>${orderItemList.book_title } &nbsp
								${orderItemList.book_price }
								</span>
							</c:if>
							</c:forEach>
							
							<p style="margin-top: 5px">총 결제금액 : ${orderList.order_price }</p>
							
						</td>
						<%-- <c:forEach items="${orderItemList }" var="orderItemList" > --%>
						
						
						<td id="orderBookTitle">
						<c:forEach var="orderItemList" items="${orderItemList }">
							<c:if test="${orderList.order_number eq orderItemList.order_number} "> 
								<p>${orderBookList.book_title }</p>
							
							</c:if>
						</c:forEach>
						</td>
						
						
					<%-- 
						</c:forEach>
						<c:if test="${orderList.order_number eq orderItemList.order_number} "> 
						<td>
							<p>${orderBookList.book_title }</p>
							
							</td>
						<td>
							<img style="height: 20px" src="${orderBookList.fileName}">
						</td>
						<td>
							<p><fmt:formatNumber value="${orderBookList.book_price }" type="currency"></fmt:formatNumber></p>
						</td>
						 </c:if> 
					 --%>
					 
						
					
					</tr>
					</c:forEach> 
					 
					<%-- </c:forEach> --%> 
					<%--  </c:forEach> --%>
					
				</tbody>
			
			</table>
			</form>
		</div>
		
		<br>
		<!-- 네이버 체크아웃 구매 버튼  -->
		
	</div>
	
</div>
</div>

<script type="text/javascript">

/* $(document).ready(function() {
	
	$('#orderBookTitle').hide();
	
	if($('#orderBookChk').click()){
		$('#orderBookTitle').show();
	}


}); */





</script>


<%@ include file="../includes/footer.jsp"%>