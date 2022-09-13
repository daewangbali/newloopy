<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%-- <%@ include file="../includes/header.jsp"%> --%>

  <body class="text-center">
    
<main class="form-signin">
<div align="left" style="margin-top: 150;margin-left: 550px">
  <form action="/user/login_success" method="post">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
    <label  style="vertical-align: 10px;margin-right: 52px" >ID</label>
    <input type="text" id="user_id" name="user_id" class="form-control" style="vertical-align: 17px; text-align: right:;height: 30px;" placeholder="아이디를 입력하세요" required autofocus><br>
    <label for="inputPw" class="visually-hidden">Password</label>
    <input type="password" id="user_pw" name="user_pw" class="form-control" style="height: 30px" placeholder="비밀번호를 입력하세요" required>
    <c:if test="${message != null }">
    	<p style="color: red">${message }</p>
    </c:if>
      <input type="hidden" name="referer" value="${referer }">
    <input class="btn btn-lg btn-primary" style="height: 30px" type="submit" value="로그인">
  </form>
  	<button id="gohome" style="height: 30px">돌아가기</button>
 </div>
</main>

<script type="text/javascript">
$(function() {
	$("#gohome").click(function() {
		location.href="/";
		
	});
});
</script>
  </body>
  
