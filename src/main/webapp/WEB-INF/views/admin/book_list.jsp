<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/admin_header.jsp"%>

<div class="container-fluid" style="text-align: center;">
	<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<h2>도서 수정 OR 삭제</h2>

			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<br>
</div>

<div style="width: 90%">
	<form id="actionForm">
		<table style="width: 90%">
			<thead style="width: 90%">
				<tr>
					<th scope="col" class="thumb">ITEM</th>
					<th scope="col" class="product" style="width: 60%">TITLE</th>
					<th scope="col" class="price" style="width: 10%">PRICE</th>
					<th scope="col" class="price" style="width: 10%">MODIFY</th>
					<th scope="col" class="price" style="width: 10%">REMOVE</th>

				</tr>
			</thead>

			<tbody>
				<c:forEach items="${bookList }" var="bookList" varStatus="status">
					<tr class="xans-record-">
						<td><a><img style="width: 55px;"
								src="${bookList.fileName}"></a></td>
						<td>
							<p>${bookList.book_title }</p>
						</td>
						<td>
							<p>
								<fmt:formatNumber value="${bookList.book_price }"
									type="currency"></fmt:formatNumber>
							</p>
						</td>
						<td>
							<input type="hidden" name="book_id" id="book_id${status.index }" value="${bookList.book_id }">
							
							<a class="btn btn-outline-success btn-sm"
								style="margin-bottom: 15px" href="/admin/book_modify?book_id=${bookList.book_id }">수정하기</a>
						</td>
						<td>
							<button type="button" class="btn btn-outline-danger btn-sm"
								style="margin-bottom: 15px" id="removeBtn" name="removeBtn"
								onclick="remove(${bookList.book_id })" >삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>

<div class="modal" tabindex="-1" id="book_remove_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="remove_modal_body">
				<p>선택하신 도서를 목록에서 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="removeBtn2">Remove</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" >

function remove(id){
	var book_id = id;

	$('#book_remove_modal').modal('show');
	
	$('#removeBtn2').click(function(e) {
		$.ajax({
		    url: "/admin/book_remove",
		    type: "POST",
		    data: { "book_id" : book_id },
		    success : function(){
		    	alert("삭제되었습니다.");
		     	location = '/admin/book_list';
		    },
		    error : function(){
		    	alert("!!!!!!");	
		    }
		  });
	});
}	





</script>

<%@ include file="../includes/footer.jsp"%>

