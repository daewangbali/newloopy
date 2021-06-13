<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../mypage/header.jsp"%>

<div class="container-fluid" style="text-align: center;">
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" >
			
			<h2>회원탈퇴</h2>
			
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
<br>
</div>

<div >
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <p class="card-text">탈퇴하시겠습니까?</p>
    <input type="button" value="회원탈퇴" class="btn btn-danger" onclick="check_remove()">
	<a href="../" class="btn btn-light" >홈으로 가기</a>
  </div>
</div>
</div>

<div class="modal" tabindex="-1" id="check_remove_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="cart_modal_body">
				<p>정말 탈퇴하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="removeBtn" onclick="remove()">탈퇴하기</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

function check_remove(){
	$('#check_remove_modal').modal('show');
	
	$('#removeBtn').click(function(e) {
		location = '/user/remove_success';
	});
	
}

	
</script>

<%@ include file="../includes/footer.jsp"%>

