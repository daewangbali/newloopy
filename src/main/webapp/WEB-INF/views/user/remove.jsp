<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../mypage/header.jsp"%>

<div class="container-fluid">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>회원탈퇴</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>
</div>

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
	

