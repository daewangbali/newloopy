<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../mypage/header.jsp"%>

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
	
	function checkUserIdExist() {
		console.log("-------------------");
		var user_id = $("#user_id").val();
		
		if(user_id.length == 0){
			alert('아이디를 입력해주세요!');
			return;
		}
		$.ajax({
			url : '/user/join2?user_id='+user_id,
			type : 'get',
			success : function(result) {
				if(result) {
					alert('사용할 수 있는 아이디입니다.');
					//$("#userIdExist").val('true');
				}else {
					alert('이미 존재하는 아이디입니다.');
					//$("#userIdExist").val('false');
				}
			}
		});
	}
	function resetUserIdExist() {
		$("#userIdExist").val('false')
	}
	
	 function pwtest() {
	      var p1 = document.getElementById('user_pw1').value;
	      var p2 = document.getElementById('user_pw2').value;
	      
	      if(p1.length < 6) {
	              alert('입력한 글자가 6글자 이상이어야 합니다.');
	              return false;
	          }
	          
	          if( p1 != p2 ) {
	            alert("비밀번호 불일치");
	            return false;
	          } else{
	            alert("비밀번호가 일치합니다");
	            return true;
	          }
	    }
	 
	 function check_pw(){
	      var user_pw = document.getElementById('user_pw').value;
	      
	       if(document.getElementById('user_pw').value !='' && document.getElementById('user_pw_confirm').value!=''){
	             if(document.getElementById('user_pw').value==document.getElementById('user_pw_confirm').value){
	                 document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	                 document.getElementById('check').style.color='blue';
	             }
	             else{
	                 document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	                 document.getElementById('check').style.color='red';
	             }
	       }
	       if(document.getElementById('user_pw').value < 7  ){
	    	   document.getElementById('check').innerHTML='입력한 글자가 6글자 이상이어야 합니다.'
	    		document.getElementById('check').style.color='red';
	       }
	   }

</script>

<main>
<div class="container-fluid">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>회원정보수정</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>
</div>

<form action="/user/modify" method="post">
	<div class="joinBox" >
		<div class="boardWrite">
			<table >
				<tr>
					<th scope="row">아이디</th>
					<td id="user_id" name = "user_id"> <p> ${user.user_id } </p></td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td> <p> ${user.user_name } </p></td>
				</tr>
				
               <th scope="row">비밀번호</th>
               <td><input id="user_pw" name="user_pw" onchange="check_pw()"
                  fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
                  fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value=""
                  type="password"> (영문 대소문자/숫자 4자~16자)</td>
	            </tr>
	            <tr>
	               <th scope="row">비밀번호 확인</th>
	               <td><input id="user_pw_confirm" name="user_pw_confirm" onchange="check_pw()"
	                  fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
	                  fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
	                  0="disabled" value="" type="password">&nbsp;<span id="check"></span></td>
	            </tr>

				<tr>
					<th scope="row" id="user_name" name="user_name">이름</th>
					<td> <p>${user.user_name }</p> </td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td >
					<input type="text" name="user_zipcode"
						id="sample4_postcode" placeholder="우편번호" style="vertical-align: 2px"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="user_roadAddress" id="sample4_roadAddress" placeholder="도로명주소"> 
						<input type="text" name="user_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" name="user_namujiAddress" id="sample4_detailAddress" placeholder="상세주소">
						</td>
					</tr>
						
				<tr >
					<th scope="row">생년월일</th>
					<td>
						
						<input id="user_birthY" name="user_birthY"
						class="inputTypeText" placeholder="" maxlength="4" value="${user.user_birthY }"
						type="text"> 년 
						<input id="user_birthM" name="user_birthM"
						class="inputTypeText" placeholder="" maxlength="2" value="${user.user_birthM }"
						type="text"> 월 
						<input id="user_birthD" name="user_birthD"
						class="inputTypeText" placeholder="" maxlength="2" value="${user.user_birthD }"
						type="text"> 일</td>

				</tr>
				<tr>
					<th scope="row">휴대전화</th>
					<td><select id="user_hp1" name="user_hp1"
						fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
						fw-msg="" style="width: 100px;height: 32px">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input id="user_hp2" name="user_hp2" maxlength="4"
						fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
						fw-msg="" value="${user.user_hp2 }" type="text"> -
						<input id="user_hp3" name="user_hp3" maxlength="4" fw-filter="isNumber&amp;isFill"
						fw-label="휴대전화" fw-alone="N" fw-msg="" value="${user.user_hp3 }" type="text"></td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><input id="user_email" name="user_email"
						fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"
						fw-msg="" value="${user.user_email }" type="text"> 
						<input type="checkbox">동의함 
						<span id="emailMsg"></span>
						</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="수정하기" class="btn btn-outline-success" required="required" style="float: right">
				</div>
		</div>
	</div>
	
</form>
</main>
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
	
	$('#btn1').click(function(e) {
		e.preventDefaut();
		$('#board_modal_body').html("join?")
		$('#board_modal').lmodal("show");
	});
	$('#btn2').click(function(e) {
		actionForm.attr("action", "/board/remove").attr("method", "post");
		actionForm.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>