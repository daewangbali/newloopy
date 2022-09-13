<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<main>
	<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			
			
			<h2>공지사항</h2>
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<br>
	<div class="container-fluid" style="width: 1000px">
		
		<div class="card mb-4">
			<div class="card-header">
				<c:choose>
					<c:when test="${sessionScope.user_id == 'admin'}">
				 <a class="btn btn-outline-info btn-sm" href="/notice/registerNoticeForm"
					style="float: right;">글작성하기</a>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					
					<table class="table table-bordered" id="" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<!-- <th>Bno</th> -->
								<th style="width:70%">Title</th>
								<th>Writer</th>
								<th>RegDate</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${list }" var="notice">
								<tr>
									<%-- <td><a href="/notice/get?bno=${notice.bno}"><c:out value=" ${notice.bno }"></c:out></a></td> --%>
									<td><a href="/notice/get?bno=${notice.bno}"> <c:out
												value="${notice.title }"></c:out></a></td>
									<td><c:out value="${notice.writer }"></c:out></td>
									<td><fmt:formatDate value="${notice.regdate }"
											pattern="yy/MM/dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
$(document).ready(function() {
		var result = '<c:out value="${result }"></c:out>';

		showModal(result);

		function showModal(result) {

			if (result === "success") {
				$('.modal-body').html("Success Remove!");
				$('.modal').modal('show');
				history.pushState(null, null, location.href);
				window.onpopstate = function() {
					$('.modal-body').html(
							"This content has been removed.");
					$('.modal').modal('show');
					history.go(1);
					history.replace(null, null, null);
				};
			}
		}
});


</script>


<%@ include file="../includes/footer.jsp"%>