<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../mypage/header.jsp"%>

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
					<c:forEach items="${orderList }" var="orderList" varStatus="status">
					
					
					<tr class="xans-record-">
						
					
					
						<td>
							<p>${orderList.order_credate }</p>
							
						</td>
						
						
						
					</tr>
					
					 </c:forEach>
					
				</tbody>
			
			</table>
			</form>
		</div>
		
		<br>
		<!-- 네이버 체크아웃 구매 버튼  -->
		
	</div>
	
</div>



<%@ include file="../includes/footer.jsp"%>