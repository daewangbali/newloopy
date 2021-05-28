<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>



<div class="container-fluid">

	<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<h2>주문서 작성</h2>
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<br>

	<div id="container">
		<div id="contents">

		<form id="actionForm" >
			
				<!-- 일반상품 (기본배송) -->
				<table  summary=""
					class="xans-element- xans-order xans-order-normnormal boardList xans-record-"
					style="width: 100%">

					<thead>
						<tr>

							<th scope="col" class="product" style="width: 10%">ITEM</th>
							<th scope="col" class="title" style="width: 60%">TITLE</th>
							<th scope="col" class="price" style="width: 10%">PRICE</th>
							<th scope="col" class="amount" style="width: 10%">AMOUNT</th>
							<th scope="col" class="total" style="width: 10%">TOTAL</th>

						</tr>
					</thead>
					
					
					
					<tbody class="xans-element- xans-order xans-order-list">
							<c:set var="sum" value="0" />
							<c:forEach items="${newBookList }" var="newBookList" varStatus="status">
								<input type="hidden" name="newBookList" value="${newBookList }">
								<tr class="xans-record-">

									<td><a><img style="width: 110px;"
											src="${newBookList.fileName}"></a></td>
									<td>
										<p>${newBookList.book_title }</p> <input type="hidden"
										name="book_id_list" id="book_id${statis.index }" value="${newBookList.book_id }">
									</td>
									<td>
										<p>
											<fmt:formatNumber value="${newBookList.book_price }"
												type="currency"></fmt:formatNumber>
										</p>
									</td>

									<td>
										<p>${newCartList[status.index].amount }권</p>
									</td>

									<td class="total"><strong id="price" name="totalPrice"
										style="text-align: center;"><fmt:formatNumber
												value="${newBookList.book_price * newCartList[status.index].amount  }"
												type="currency"></fmt:formatNumber></strong> <input type="hidden"
										name="totalPrice" value=""></td>


								</tr>
								<c:set var="sum"
									value="${sum + (newBookList.book_price * newCartList[status.index].amount )}" />
							</c:forEach>
						
					<tfoot>

						<tr>
							<td colspan="10">상품구매금액 <strong><fmt:formatNumber
										value="${sum}"></fmt:formatNumber></strong> <span class="displaynone">
							</span> + 배송비 <strong> ${sum < 30000 ? 2500 : 0 }</strong> <span
								class="displaynone"> </span> = 합계 : <strong><fmt:formatNumber
										value="${sum < 30000 ? sum+2500 : sum }" type="currency"></fmt:formatNumber></strong>
								<span class="displaynone"> </span></td>
						</tr>
					</tfoot>
					</tbody>

				</table>
			</form>
		</div>
	</div>
	<div style="height: 30px;"></div>
	
	
	<!-- 국내 배송지 정보 -->
	<div class="orderArea">

		<!-- .mem-lvl -->
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 5px"></div>
	
		<h4>주문자정보</h4>
		
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%; color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>	
	<div style="height: 10px"></div>
		
		
		<div class="tbl-order">
			<table>
				<colgroup>
					<col style="width: 168px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><div class="txt-l">이름</div></th>
						<td>
						<input type="text" name="orderer_name"
							id="sender" class="MS_input_txt" value="${user.user_name }">
						</td>
					</tr>
					
					<tr>
						<th scope="row"><div class="txt-l">연락처</div></th>
						<td>
						<input type="text" name="orderer_hp1" 
							id="orderer_hp1" size="4" maxlength="4" class="MS_input_txt w60" value="${user.user_hp1 }">
						 - <input type="text" name="orderer_hp2" 
							id="emergency12" size="4" maxlength="4" class="MS_input_txt w60"
							value="${user.user_hp2 }"> - <input type="text" name="orderer_hp3"
							id="emergency13" size="4" maxlength="4"
							minlength="4" class="MS_input_txt w60" value="${user.user_hp3}"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- .tbl-order -->
	<div style="height: 20px"></div>	
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 5px"></div>

		<h4 style="margin: 0">
			배송 정보 <label style="margin: 0; font-size: 17px"> <input type="checkbox" name="same"
				 id="same" onclick="copydata()"> 주문자 정보와 동일
			</label>
		</h4>
	<div style="height: 5px"></div>	
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 10px"></div>	
		
		<div class="tbl-order">
			<table>
				<colgroup>
					<col style="width: 168px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><div class="txt-l">이름</div></th>
						<td><input type="text" name="order_name" form="actionForm"
							id="order_name" class="MS_input_txt" value=""></td>
					</tr>
					<tr>
						<th scope="row"><div class="txt-l">연락처 </div></th>
						<td><select name="order_hp1" form="actionForm"
							id="order_hp1" class="MS_select MS_tel">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0507">0507</option>
								<option value="0508">0508</option>
								<option value="070">070</option>
								<option value="080">080</option>
						</select> - <input type="text" name="order_hp2" form="actionForm"
							id="order_hp2" size="4" maxlength="4" class="MS_input_txt w60"
							value=""> - <input type="text" name="order_hp3"
							form="actionForm" id="order_hp3" size="4" maxlength="4"
							minlength="4" class="MS_input_txt w60" value=""></td>
					</tr>
					
					<tr>
					<th scope="row">주소</th>
					<td >
					<input type="text" name="order_zipcode" form="actionForm"
						id="sample4_postcode" placeholder="우편번호" style="vertical-align: 2px"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="order_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" form="actionForm"> 
						<input type="text" name="order_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" form="actionForm"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" name="order_namujiAddress" id="sample4_detailAddress" placeholder="상세주소" form="actionForm">
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="txt-l">
								주문메세지<br>
								<span>(100자내외)</span>
							</div></th>
						<td><textarea name="order_message" id="order_message"
								cols="50" rows="5" class="MS_textarea" form="actionForm"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- .tbl-order -->
	<div style="height: 20px"></div>
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 5px"></div>

		<!-- 결제 예정 금액 -->
		<div class="title">
			<h4 style="margin: 2">결제 예정 금액</h4>
		</div>
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 5px"></div>		

		<div class="summary">
			<table width="70%" cellpadding="5" cellspacing="0" align="center">
				<thead>
					<tr>
						<th scope="col"><span>총 주문 금액</span></th>
						<th scope="col" class="">배송비</th>
						<th scope="col">총 결제예정 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="price"><div class="box">
								<strong id="total_order_price_view"><fmt:formatNumber
										value="${sum}"></fmt:formatNumber></strong><strong
									class="tail">원</strong><span id="total_order_price_ref_view"
									class="tail displaynone"></span>
							</div></td>
						<td class="option "><div class="box">
								<strong> ${sum < 30000 ? 2500 : 0 }</strong><strong
									class="tail">원</strong><span id="total_sale_price_ref_view"
									class="tail displaynone"></span>
							</div></td>
						<td class="total"><div class="box">
							
								<strong id="total_order_sale_price_view"><fmt:formatNumber
										value="${sum < 30000 ? sum+2500 : sum }"></fmt:formatNumber></strong><strong
									class="tail">원</strong><span
									id="total_order_sale_price_ref_view" class="tail displaynone"></span>
							</div></td>
						
					</tr>
				</tbody>
			</table>
		</div>
	<div style="height: 20px"></div>
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div style="height: 5px"></div>	
		
		<!-- 결제수단 -->
		<div class="title">
			<h4>결제수단</h4>
		</div>
	<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>	
		<div style="height: 5px"></div>	
		<div class="payArea">
			<div class="payment">
				<div class="method">
					<span class="ec-base-label"><input id="paymethod_cash"
						name="paymethod_cash" fw-filter="isFill" fw-label="결제방식" fw-msg=""
						value="cash" type="radio" ><label
						for="addr_paymethod0">무통장 입금   </label></span> 
						<span class="ec-base-label"><input
						id="paymethod_card" name="paymethod_card" fw-filter="isFill"
						fw-label="결제방식" fw-msg="" value="card" type="radio"><label
						for="addr_paymethod1" >카드 결제    </label></span> 
				</div>
				
			<input form="actionForm" type="hidden" id="paymentMethod" name="paymentMethod" value="">
			<input type="hidden" id="payment_method"  value="무통장입금">	
				<div class="info" id="payInCash" >
					
					<!-- 무통장입금 -->
					<table>
						<tbody>
							<tr>
								<th scope="row">입금자명</th>
								<td><input id="deposit_name" name="deposit_name" fw-filter=""
									fw-label="무통장 입금자명" fw-msg="" class="inputTypeText"
									placeholder="" size="15" maxlength="20" value="" type="text"
									form="actionForm" ></td>
							</tr>
							<tr>
								<th scope="row">입금은행</th>
								<td><select id="bankaccount" name="bankaccount"
									fw-filter="" fw-label="무통장 입금은행" fw-msg="">
										<option value="-1">::: 선택해 주세요. :::</option>
										<option >우리은행:1001234100123 (주) LoopyBook's</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>	
				<div class="info" id="payByCard">
					
					<table>
						<tr>
						<td>
						  <strong>카드 선택<strong>:&nbsp;&nbsp;&nbsp;
						  <select id="card_name" name="card_name" form="actionForm" >
								<option value="삼성" selected>삼성</option>
								<option value="하나SK">하나SK</option>
								<option value="현대">현대</option>
								<option value="KB">KB</option>
								<option value="신한">신한</option>
								<option value="롯데">롯데</option>
								<option value="BC">BC</option>
								<option value="시티">시티</option>
								<option value="NH농협">NH농협</option>
						</select>
						<br>
						<strong>할부 기간:<strong>  &nbsp;&nbsp;&nbsp;
						<select id="card_installment" name="card_installment" form="actionForm" >
								<option value="일시불" selected>일시불</option>
								<option value="2개월">2개월</option>
								<option value="3개월">3개월</option>
								<option value="4개월">4개월</option>
								<option value="5개월">5개월</option>
								<option value="6개월">6개월</option>
						</select>
						
						</td>
					</tr>
					</table>
				</div>	
					
				</div>

				<div class="line"></div>

				<h3></h3>
				
			</div>
		<div style="height: 10px"></div>	
		<div class="progress" style="height: 1px;">
	  <div class="progress-bar" role="progressbar" style="width: 0%;color: $gray-500" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
		<br>
		<br>
			<!-- 최종결제금액 -->
			<div class="total" align="center">
				<h4>
					<strong id="current_pay_name">무통장 입금</strong> <span>최종 결제 금액</span>
				</h4>
				<h5 class="price">
					<input type="hidden" form="actionForm"  name="order_price" id="order_price" value="${sum < 30000 ? sum+2500 : sum }">
					<span></span><fmt:formatNumber value="${sum < 30000 ? sum+2500 : sum }"></fmt:formatNumber><strong>원</strong>
				</h5>
				<p class="paymentAgree" id="chk_purchase_agreement" style="">
					<input id="chk_purchase_agreement0" name="chk_purchase_agreement"
						fw-filter="" fw-label="구매진행 동의" fw-msg="" value="T"
						type="checkbox" style=""><label
						for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
				</p>
				<input type="hidden" form="actionForm"  name="delivery_status" id="delivery_status" value="주문완료">
				<div class="d-grid gap-2 col-6 mx-auto">
 				 <button class="btn btn-primary" id="orderBtn" style="width:40%; background-color: pink ;border: 0; color: black" type="button">결제하기</button>
</div>

			</div>
		</div>
		
		<br>
		<br>
		<br>
		<br>
		


		<!-- 크로스 브라우징 지원 -->
		
</div>


<script type="text/javascript">

$(document).ready(function() {
	
	
	
	$('#payByCard').css('display', 'none'); //display 'none'은= div가 보이지않는!
    $('#payInCash').css('display', 'block');

	$('input:radio[id="paymethod_cash"]').prop('checked', true);
	document.getElementById('paymentMethod').value = 2;
			
	$('input:radio[id="paymethod_card"]').click(function(e) {
		$('input:radio[id="paymethod_card"]').prop('checked', true);
		$('input:radio[id="paymethod_cash"]').prop('checked', false);

		$('#payInCash').css('display', 'none'); //display 'none'은= div가 보이지않는!
        $('#payByCard').css('display', 'block');
        document.getElementById("payment_method").value = "카드";
        document.getElementById('paymentMethod').value = 1;
        $('#paymentMethod').value = "카드";
		console.log($('#payment_method').val());
	});
	
	$('input:radio[id="paymethod_cash"]').click(function(e) {
		$('input:radio[id="paymethod_cash"]').prop('checked', true);
		$('input:radio[id="paymethod_card"]').prop('checked', false);

		$ ('#payInCash').show();
	    $ ('#payByCard').hide(); //클릭 시 첫 번째 요소 숨김
	    document.getElementById("payment_method").value  = "무통장입금";
	    document.getElementById('paymentMethod').value = 2;
	    console.log($('#payment_method').val());
	    console.log($('#paymentMethod').val());
	});
	
	//주문하기 버튼 클릭시
	


});

var actionForm = $("#actionForm");

$('#orderBtn').click(function(e) {
	
	actionForm.attr("action", "/order/orderCompleted").attr("method", "post");
	actionForm.submit();
});



</script>

<%@ include file="../includes/footer.jsp"%>
