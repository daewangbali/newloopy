<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container-fluid">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>주문서 작성</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>

<div id="container">
    <div id="contents">


<form id="frm_order_act" name="frm_order_act" action="" method="post" target="_self" enctype="multipart/form-data">
			<!-- 일반상품 (기본배송) -->
			<table border="1" summary=""
				class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
				
				<thead>
					<tr>
						
						<th scope="col" class="product">ITEM</th>
						<th scope="col" class="price">TITLE</th>
						<th scope="col" class="amount" style="width: 76px">PRICE</th>
						<th scope="col" class="amount">AMOUNT</th>
						<th scope="col" class="total" style="width: 76px">TOTAL</th>
						
					</tr>
				</thead>
				
				<tbody class="xans-element- xans-order xans-order-list">
				<form id="actionForm">
					<c:set var="sum" value="0" />
					<c:forEach items="${bookList }" var="bookList" varStatus="status">
					
					<tr class="xans-record-">
						
						<td>
							<a><img style="width: 110px;" src= "${bookList.fileName}"></a>
						</td>
						<td>
							<p>${bookList.book_title }</p>
							<input type="hidden" name="book_id" id="book_id" value="${bookList.book_id }">
							</td>
						<td>
							<p><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></p>
						</td>
						
						<td>
							<p>${cartList[status.index].amount } 권</p>
                		</td>

						<td class="total">
						
							<strong id="price" name ="totalPrice" style="text-align: center;"><fmt:formatNumber value="${bookList.book_price * cartList[status.index].amount  }" type="currency"></fmt:formatNumber></strong>
							<input type="hidden" name ="totalPrice" value="">
						</td>
						
							
					</tr>
					<c:set var="sum" value="${sum + (bookList.book_price * cartList[status.index].amount )}" />	
					 </c:forEach>
					 </form>
					<tfoot>
				
					<tr>
						<td colspan="10">상품구매금액
							<strong><fmt:formatNumber value="${sum}"></fmt:formatNumber></strong>
							<span class="displaynone"> </span> + 배송비 <strong> ${sum < 30000 ? 2500 : 0 }</strong>
							<span class="displaynone"> </span> = 합계 : <strong><fmt:formatNumber value="${sum < 30000 ? sum+2500 : sum }" type="currency" ></fmt:formatNumber></strong>
							<span class="displaynone"> </span></td>
					</tr>
				</tfoot>
				</tbody>
			
			</table>
			</form>
		</div>
</div>

  

<!-- 국내 배송지 정보 -->
<div class="orderArea">

    <!-- .mem-lvl -->
                                            
    <h3>주문자정보</h3>
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
                                        정다운
<input type="hidden" name="sender" form="order_form" id="sender" class="MS_input_txt" value="정다운">									</td>
                </tr>
                <tr>
                    <th scope="row"><div class="txt-l">이메일</div></th>
                    <td>
                            <input type="hidden" name="oldemail" id="oldemail" value="dw1677@nate.com">
<input type="hidden" name="email" id="email" value="dw1677@nate.com">
<input type="text" name="email1" id="email1" class="MS_input_txt" maxlength="20" form="order_form">
<span>@</span> 
<span id="direct_email" style="margin-top:3px;display:inline-block">
<input type="text" name="email3" id="email3" value="nate.com" class="MS_input_txt" disabled="" maxlength="25" form="order_form">
</span>
<select name="emailsel" id="emailsel" class="MS_select MS_email" style="margin-right:5px;" onchange="viewdirect()">
<option value="direct">직접입력</option><option value="naver.com">naver.com</option><option value="hotmail.com">hotmail.com</option><option value="hanmail.net">hanmail.net</option><option value="yahoo.com">yahoo.com</option><option value="nate.com" selected="selected">nate.com</option><option value="korea.com">korea.com</option><option value="chol.com">chol.com</option><option value="gmail.com">gmail.com</option><option value="netian.com">netian.com</option>
</select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><div class="txt-l">연락처</div></th>
                    <td>
                                    <select name="emergency11" form="order_form" id="emergency11" class="MS_select MS_tel">
<option value="">선택</option>            <option value="010">010</option>            <option value="011">011</option>            <option value="016">016</option>            <option value="017">017</option>            <option value="018">018</option>            <option value="019">019</option>            <option value="02">02</option>            <option value="031">031</option>            <option value="032">032</option>            <option value="033">033</option>            <option value="041">041</option>            <option value="042">042</option>            <option value="043">043</option>            <option value="044">044</option>            <option value="051">051</option>            <option value="052">052</option>            <option value="053">053</option>            <option value="054">054</option>            <option value="055">055</option>            <option value="061">061</option>            <option value="062">062</option>            <option value="063">063</option>            <option value="064">064</option>            <option value="0502">0502</option>            <option value="0503">0503</option>            <option value="0504">0504</option>            <option value="0505">0505</option>            <option value="0507">0507</option>            <option value="0508">0508</option>            <option value="070">070</option>            <option value="080">080</option>
</select>            - 
<input type="text" name="emergency12" form="order_form" id="emergency12" size="4" maxlength="4" class="MS_input_txt w60" value="">
-
<input type="text" name="emergency13" form="order_form" id="emergency13" size="4" maxlength="4" minlength="4" class="MS_input_txt w60" value="">									</td>
                </tr>
            </tbody>
        </table>
    </div><!-- .tbl-order -->

    <h3>배송 정보
        <label>        <input type="checkbox" name="same" form="order_form" id="same" onclick="copydata()"> 위 정보와 같음</label>
    </h3>
    <div class="tbl-order">
        <table>
            <colgroup>
                <col style="width: 168px;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><div class="txt-l">이름</div></th>
                    <td>        <input type="text" name="receiver" form="order_form" id="receiver" class="MS_input_txt" value=""></td>
                </tr>
                <tr>
                    <th scope="row"><div class="txt-l">연락처 1</div></th>
                    <td>
                                    <select name="emergency21" form="order_form" id="emergency21" class="MS_select MS_tel">
<option value="">선택</option>                    <option value="010">010</option>                    <option value="011">011</option>                    <option value="016">016</option>                    <option value="017">017</option>                    <option value="018">018</option>                    <option value="019">019</option>                    <option value="02">02</option>                    <option value="031">031</option>                    <option value="032">032</option>                    <option value="033">033</option>                    <option value="041">041</option>                    <option value="042">042</option>                    <option value="043">043</option>                    <option value="044">044</option>                    <option value="051">051</option>                    <option value="052">052</option>                    <option value="053">053</option>                    <option value="054">054</option>                    <option value="055">055</option>                    <option value="061">061</option>                    <option value="062">062</option>                    <option value="063">063</option>                    <option value="064">064</option>                    <option value="0502">0502</option>                    <option value="0503">0503</option>                    <option value="0504">0504</option>                    <option value="0505">0505</option>                    <option value="0507">0507</option>                    <option value="0508">0508</option>                    <option value="070">070</option>                    <option value="080">080</option>
</select>            - 
<input type="text" name="emergency22" form="order_form" id="emergency22" size="4" maxlength="4" class="MS_input_txt w60" value="">
-
<input type="text" name="emergency23" form="order_form" id="emergency23" size="4" maxlength="4" minlength="4" class="MS_input_txt w60" value="">									</td>
                </tr>
                <tr>
                    <th scope="row"><div class="txt-l">연락처 2</div></th>
                    <td>
                                    <select name="emergency31" form="order_form" id="emergency31" class="MS_select MS_tel">
<option value="">선택</option>                    <option value="010">010</option>                    <option value="011">011</option>                    <option value="016">016</option>                    <option value="017">017</option>                    <option value="018">018</option>                    <option value="019">019</option>                    <option value="02">02</option>                    <option value="031">031</option>                    <option value="032">032</option>                    <option value="033">033</option>                    <option value="041">041</option>                    <option value="042">042</option>                    <option value="043">043</option>                    <option value="044">044</option>                    <option value="051">051</option>                    <option value="052">052</option>                    <option value="053">053</option>                    <option value="054">054</option>                    <option value="055">055</option>                    <option value="061">061</option>                    <option value="062">062</option>                    <option value="063">063</option>                    <option value="064">064</option>                    <option value="0502">0502</option>                    <option value="0503">0503</option>                    <option value="0504">0504</option>                    <option value="0505">0505</option>                    <option value="0507">0507</option>                    <option value="0508">0508</option>                    <option value="070">070</option>                    <option value="080">080</option>
</select>            -
<input type="text" name="emergency32" form="order_form" id="emergency32" size="4" maxlength="4" class="MS_input_txt w60" value="">
- 
<input type="text" name="emergency33" form="order_form" id="emergency33" size="4" maxlength="4" minlength="4" class="MS_input_txt w60" value="">									</td>
                </tr>
                                                                                                                    <tr>
                    <th scope="row"><div class="txt-l">배송지 선택</div></th>
                    <td>
                                                <input type="radio" value="H" form="order_form" name="place" onclick="addrclick()">자택&nbsp;&nbsp;

&nbsp;&nbsp;<input type="radio" value="A" name="place" form="order_form">최근 배송지&nbsp;<a href="javascript:;" class="past_list" style="display: inline-block; height: 23px; line-height: 25px; padding: 0px 5px; border: 1px solid rgb(221, 221, 221); color: rgb(0, 0, 0); font-weight: bold; letter-spacing: -1px; border-radius: 3px;">배송지 목록</a>
&nbsp;&nbsp;<input type="radio" value="E" name="place" form="order_form" onclick="post();">신규 배송지									</td>
                </tr>
                                                    <tr>
                    <th scope="row"><div class="txt-l">주소</div></th>
                    <td>
                              <input name="post1" id="post1" form="order_form" size="3" class="MS_input_txt w60" onclick="this.blur();post();">
- 
<input name="post2" id="post2" form="order_form" size="3" class="MS_input_txt w60" onclick="this.blur();post();">										<a href="javascript:post();" class="btn_zipcode">우편번호</a>
                        <div class="mt-10">
                                    <input type="text" name="address1" form="order_form" id="address1" size="50" class="MS_input_txt w445" readonly="">
<input type="hidden" name="old_address" form="order_form" id="old_address" value="광주 광산구 산정동 911-3">
<input type="hidden" name="old_home_address" form="order_form" id="old_home_address" value="광주 광산구 산정동 911-3">
<input type="hidden" name="old_offi_address" form="order_form" id="old_offi_address" value="">         <input type="text" name="address2" form="order_form" id="address2" size="50" class="MS_input_txt w445">										</div>
                    </td>
                </tr>
                                                <tr>
                    <th scope="row"><div class="txt-l">주문메세지<br><span>(100자내외)</span></div></th>
                    <td>
                                <textarea name="message" form="order_form" id="message" cols="50" rows="5" class="MS_textarea"></textarea>
                            </td>
                </tr>
                                                <tr>
                    <th scope="row"><div class="txt-l">무통장 입금자명</div></th>
                    <td>
                                <input type="text" name="bankname" form="order_form" class="MS_input_txt" size="10" maxlength="40">
<span class="MS_bankname_message">(주문자와 같을경우 생략 가능)</span>									</td>
                </tr>
                                                                                                                                                </tbody>
        </table>
    </div><!-- .tbl-order -->
    


<!-- 결제 예정 금액 -->
<div class="title">
<h3>결제 예정 금액</h3>
</div>

<div class="summary">
    <table width="70%" cellpadding="5" cellspacing="0" border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
        <thead><tr>
            <th scope="col">
            <span>총 주문 금액</span></th>
                                <th scope="col" class="">배송비</th>
                                <th scope="col">총 결제예정 금액</th>
                            </tr></thead>
<tbody><tr>
<td class="price"><div class="box"><strong id="total_order_price_view">42,500</strong><strong class="tail">원</strong><span id="total_order_price_ref_view" class="tail displaynone"></span>
</div></td>
            <td class="option "><div class="box">
<strong>-</strong><strong id="total_sale_price_view">2,000</strong><strong class="tail">원</strong><span id="total_sale_price_ref_view" class="tail displaynone"></span>
</div></td>
            <td class="total"><div class="box"><strong id="total_order_sale_price_view">40,500</strong><strong class="tail">원</strong><span id="total_order_sale_price_ref_view" class="tail displaynone"></span>
</div></td>
        </tr></tbody>
</table>
</div>
<!-- 결제수단 -->
<div class="title">
<h3>결제수단</h3>
<span class="txtEm gIndent20 displaynone">
   <input type="checkbox" id="save_paymethod" name="save_paymethod" value="" disabled=""><label for="save_paymethod">지금 선택한 결제수단을 다음에도 사용</label>
</span>
</div>
<div class="payArea">
<div class="payment">
    <div class="method"><span class="ec-base-label"><input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cash" type="radio" checked="checked"><label for="addr_paymethod0">무통장 입금</label></span>
<span class="ec-base-label"><input id="addr_paymethod1" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio"><label for="addr_paymethod1">카드 결제</label></span>
<span class="ec-base-label"><input id="addr_paymethod2" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="kakaopay" type="radio"><label for="addr_paymethod2">카카오페이(간편결제) <a href="http://www.kakao.com/kakaopay" target="_blank"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info"></a></label></span>
<span class="ec-base-label"><input id="addr_paymethod3" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="payco" type="radio"><label for="addr_paymethod3">페이코(간편결제) <a href="http://www.payco.com/payco/guide.nhn" target="_blank"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info"></a></label></span>
<span class="ec-base-label"><input id="addr_paymethod4" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="smilepay" type="radio"><label for="addr_paymethod4">스마일페이(간편결제) <a href="http://rpp.gmarket.co.kr/?exhib=20634" target="_blank"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info"></a></label></span>
<span class="ec-base-label"><input id="addr_paymethod5" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cell" type="radio"><label for="addr_paymethod5">휴대폰 결제</label></span></div>

    <div class="info">
        <!-- 무통장입금 -->
        <table >
            <tbody>
<tr>
<th scope="row">입금자명      </th>
                    <td><input id="pname" name="pname" fw-filter="" fw-label="무통장 입금자명" fw-msg="" class="inputTypeText" placeholder="" size="15" maxlength="20" value="" type="text"></td>
                </tr>
<tr>
<th scope="row">입금은행      </th>
                    <td>
                        <select id="bankaccount" name="bankaccount" fw-filter="" fw-label="무통장 입금은행" fw-msg="">
<option value="-1">::: 선택해 주세요. :::</option>
<option value="bank_04:86770104095785:(주) 메이크엠:국민은행:www.kbstar.com">국민은행:86770104095785 (주) 메이크엠</option>
<option value="bank_13:3010178957071:(주) 메이크엠:농협:banking.nonghyup.com">농협:3010178957071 (주) 메이크엠</option>
<option value="bank_20:1005302806886:(주) 메이크엠:우리은행:www.wooribank.com">우리은행:1005302806886 (주) 메이크엠</option>
</select>
                    </td>
                </tr>
</tbody>
</table>
<!-- //무통장입금 --><!-- 실시간 계좌이체 --><table border="1" summary="" id="payment_input_tcash" style="display:none;">

            <tbody><tr>
<th scope="row">예금주명</th>
                    <td></td>
                </tr></tbody>
</table>
<!-- //실시간 계좌이체 --><!-- 에스크로(가상계좌) --><table border="1" summary="" id="payment_input_icash" style="display:none;">

            <tbody><tr>
<th scope="row">에스크로</th>
                    <td><input id="flagEscrowIcashUse0" name="flagEscrowIcashUse" fw-filter="" fw-label="에스크로(구매안전)" fw-msg="" value="T" type="checkbox"><label for="flagEscrowIcashUse0"></label><label for="flagEscrowIcashUse0">에스크로(구매안전)서비스를 적용합니다.</label>
</td>
                </tr></tbody>
</table>
<!-- //에스크로(가상계좌) --><!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체, 페이팔, 엑심베이, 엑시즈, 알리페이 --><div id="pg_paymethod_info" class="payHelp" style="display: none;">
            <p id="pg_paymethod_info_shipfee">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
            <p id="pg_paymethod_info_pg">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
        </div>
        <!-- //무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체, 페이팔, 엑심베이, 엑시즈, 알리페이 -->
    </div>

    <div class="line"></div>
    
	<h3> </h3>
    <div class="agree">
        <table>

        <!-- 현금영수증 발행 -->
     <tbody id="cashreceipt_display_area" class=""><tr>
<th >현금영수증<br>발행</th>
         <td>
             <input id="cashreceipt_user_type0" name="cashreceipt_user_type" fw-filter="" fw-label="현금영수증 신청자 종류" fw-msg="" value="0" type="radio"><label for="cashreceipt_user_type0">개인</label>
<input id="cashreceipt_user_type1" name="cashreceipt_user_type" fw-filter="" fw-label="현금영수증 신청자 종류" fw-msg="" value="1" type="radio"><label for="cashreceipt_user_type1">사업자</label>
<input id="cashreceipt_user_type2" checked="checked" name="cashreceipt_user_type" fw-filter="" fw-label="현금영수증 신청자 종류" fw-msg="" value="99" type="radio"><label for="cashreceipt_user_type2">신청안함</label>                     <!-- 개인 -->
             <div class="mobile" id="cashreceipt_mobile_display_area" style="display: none;">
             <strong>휴대전화 : </strong>
             <select id="cashreceipt_user_mobile1" name="cashreceipt_user_mobile[]" fw-filter="" fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N" fw-msg="">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="cashreceipt_user_mobile2" name="cashreceipt_user_mobile[]" maxlength="4" fw-filter="" fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N" fw-msg="" value="" type="text">-<input id="cashreceipt_user_mobile3" name="cashreceipt_user_mobile[]" maxlength="4" fw-filter="" fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N" fw-msg="" value="" type="text">                     </div>
             <!-- 사업자 -->
             <div class="regno" id="cashreceipt_regno_display_area" style="display: none;">
             <strong>사업자등록번호 : </strong>
             <input id="cashreceipt_reg_no" name="cashreceipt_reg_no" fw-filter="" fw-label="현금영수증 사업자 번호" fw-msg="" placeholder="사업자번호" value="" type="text">                     <p class="grid">입력 시 '-' 없이 숫자만 입력하세요.</p>
             </div>
         </td>
     </tr></tbody>

<!-- 전자보증보험--><tbody class="guarantee displaynone" style="display: none;"><tr>
<th scope="row">전자보증보험</th>
                <td>
                    <div>
                        <p>전자보증보험 발급 여부 : <input id="eguarantee_flag0" name="eguarantee_flag" fw-filter="" fw-label="전자보증보험 발급여부" fw-msg="" value="T" type="radio" disabled=""><label for="eguarantee_flag0">발급</label>
<input id="eguarantee_flag1" name="eguarantee_flag" fw-filter="" fw-label="전자보증보험 발급여부" fw-msg="" value="F" type="radio" checked="checked" disabled=""><label for="eguarantee_flag1">미발급</label></p>
                        <p>전자보증보험 안내(100% 매매보호 안전결제) <a href="/common/usafe_notice.php" target="_blank" onclick="window.open(this.href,'new','height=500 width=550 toolbar=no location=no directory=no status=no resizable=no'); return false;">[자세히보기]</a></p>
                        <p>물품대금결제시 구매자의 피해보호를 위해 '(주)서울보증보험'의 보증보험증권이 발급됩니다.</p>
                        <p>증권이 발급되는 것의 의미는, 물품대금 결제시에 소비자에게 서울보증보험의 쇼핑몰보증보험 계약체결서를 인터넷상으로 자동 발급하여, 피해발생시 쇼핑몰보증보험으로써 완벽하게 보호받을 수 있습니다.</p>
                        <p>또한, 입력하신 개인정보는 증권발급을 위해 필요한 정보이며 다른 용도로 사용되지 않습니다. </p>
                        <p>전자보증보험 발생시 별도의 수수료가 부과되지 않습니다.</p>
                    </div>
                    <div id="eguarantee_personal">
                        <p>생년월일 : <input id="eguarantee_year" name="eguarantee_year" fw-filter="" fw-label="전자보증보험 생년월일1" fw-msg="" class="inputTypeText" placeholder="" size="4" maxlength="4" value="" type="text" disabled=""> 년 <input id="eguarantee_month" name="eguarantee_month" fw-filter="" fw-label="전자보증보험 생년월일2" fw-msg="" class="inputTypeText" placeholder="" size="2" maxlength="2" value="" type="text" disabled=""> 월 <input id="eguarantee_day" name="eguarantee_day" fw-filter="" fw-label="전자보증보험 생년월일3" fw-msg="" class="inputTypeText" placeholder="" size="2" maxlength="2" value="" type="text" disabled=""> 일</p>
                        <p>성별 : <input id="eguarantee_user_gender0" name="eguarantee_user_gender" fw-filter="" fw-label="전자보증보험 성별" fw-msg="" value="1" type="radio" disabled=""><label for="eguarantee_user_gender0">남자</label>
<input id="eguarantee_user_gender1" name="eguarantee_user_gender" fw-filter="" fw-label="전자보증보험 성별" fw-msg="" value="2" type="radio" disabled=""><label for="eguarantee_user_gender1">여자</label></p>
                        <p>개인정보 이용동의 : <input id="eguarantee_personal_agreement0" name="eguarantee_personal_agreement" fw-filter="" fw-label="전자보증보험 개인정보 이용동의" fw-msg="" value="T" type="radio" disabled=""><label for="eguarantee_personal_agreement0">동의함</label>
<input id="eguarantee_personal_agreement1" name="eguarantee_personal_agreement" fw-filter="" fw-label="전자보증보험 개인정보 이용동의" fw-msg="" value="F" type="radio" checked="checked" disabled=""><label for="eguarantee_personal_agreement1">동의안함</label></p>
                    </div>
                </td>
            </tr></tbody>
</table>
</div>
</div>

<!-- 최종결제금액 -->
<div class="total">
    <h4>
<strong id="current_pay_name">무통장 입금</strong> <span>최종결제 금액</span>
</h4>
    <p class="price"><span></span><input id="total_price" name="total_price" fw-filter="isFill" fw-label="결제금액" fw-msg="" class="inputTypeText" placeholder="" style="text-align:right;ime-mode:disabled;clear:none;border:0px;float:none;" size="10" readonly="1" value="48500" type="text"><strong>원</strong></p>
    <p class="paymentAgree" id="chk_purchase_agreement" style=""><input id="chk_purchase_agreement0" name="chk_purchase_agreement" fw-filter="" fw-label="구매진행 동의" fw-msg="" value="T" type="checkbox" style=""><label for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label></p>
    <div class="button"><a href="#none"><img src="/web/season2_skin/base/btn/btn_payment.png" onmouseover="this.src='/web/season2_skin/base/btn/btn_payment_over.png' " onmouseout="this.src='/web/season2_skin/base/btn/btn_payment.png' " id="btn_payment" alt="결제하기"></a></div>
    
</div>
</div>
<!-- 무이자 할부 이용안내 -->
<div class="freeInfo">
<h3><font color="#DB2648">[부분배송관련 안내]</font></h3>
<font color="#222222"><p>입고/배송기간이 예정보다 많이지연되는경우, 임의로 부분배송을 해드릴수있습니다.<br> 부분배송을 원치않으시고 [한번에 배송]받으시길 원하시는경우, 반드시 결제후 QNA에 글을 남겨주세요. </p></font>
</div>
<div class="freeInfo">
<h3><font color="#DB2648">[휴대폰결제 안내]</font></h3>
<font color="#222222"><p>휴대폰결제는 이동통신사 정책상 [결제한 당월안에만 취소 가능]합니다. 당월이후 취소처리시 예치금처리나, 수수료4.15%차감후 현금처리 해드립니다. 결제전 꼭 참고하시길 바랍니다. </p></font>
</div>
<br><br><br><br><div class="helpT">
<h3><font color="#DB2648"></font></h3>
</div>


<!-- 크로스 브라우징 지원 --><div class="" style="margin-top:15px;">
        <span>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</span>
        <ul>
<li class="item1">KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
            <li class="item2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
            <li class="item3">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br>(무통장, 휴대폰결제 포함)</li>
        </ul>
</div>
</div>
</div>




<%@ include file="../includes/footer.jsp"%>