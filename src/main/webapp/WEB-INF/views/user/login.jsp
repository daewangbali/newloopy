<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<link href="../resources/css/signin.css" rel="stylesheet">
  <body class="text-center">
    
<main class="form-signin">
  <form action="/user/login_success" method="post">

    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
    <label  style="vertical-align: 17px" >ID</label>
    <input type="text" id="user_id" name="user_id" class="form-control" style="vertical-align: 17px; text-align: right: ;" placeholder="아이디를 입력하세요" required autofocus><br>
    <label for="inputPw" class="visually-hidden">Password</label>
    <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호를 입력하세요" required>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <c:if test="${message != null }">
    	<p style="color: red">${message }</p>
    </c:if>
      <input type="hidden" name="referer" value="${referer }">
    <input class="btn btn-lg btn-primary " type="submit" value="로그인">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  
   
  </form>
</main>

  </body>
  
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
	
	$('#btn1').click(function(e) {
		e.preventDefault();
		$('#board_modal_body').html("join?")
		$('#board_modal').modal("show");
	});
	$('#btn2').click(function(e) {
		actionForm.attr("action", "/board/remove").attr("method", "post");
		actionForm.submit();
	});
	
	
	
}
</script>
