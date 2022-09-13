<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>


<main>
<script type="text/javascript">
$(document).ready(function() {
	$('#goNoticeListBtn').click(function(e) {
		location = '/notice/list';
		
	});
	
	$('#removeNoticeBtn').click(function(e) {
		let result = confirm("게시물을 삭제하시겠습니까?");
		if(result){			
			$.ajaxSettings.traditional = true;
			$.ajax({
			    url: "/notice/remove",
			    type: "POST",
			    data: { "bno" : ${noticeVO.bno} },
			    success : function(){
			    	alert("삭제되었습니다");
			     	location = '/notice/list';
			    },
			    error : function(){
			    	alert("에러!!!");	
			    }
			});
		}
	});
	
	$('#modifyNoticeBtn').click(function(e) {
		let result = confirm("게시물을 수정하시겠습니까?");
		if(result){			
			location = '/notice/modifyForm?bno='+${noticeVO.bno} ;
			
		}
	});
	
});
</script>
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 1000px" >
		<div  style="width: 500px">
			
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
<div style="width: 100%" align="left">

		<table class="table" style="width: 100%">
			<tr>
				<td align="left">
				<br>
					<span>제목 : </span> &nbsp 
					<input type="text" readonly="readonly" name="title" size="100" style="margin-top: 3px" value="${noticeVO.title}" >
				<br>
				<br>
				<span style="margin-bottom: 20px">내용 : </span> &nbsp
				<textarea rows="10" class="form-control" readonly="readonly" name="content"  required="required">${noticeVO.content}</textarea>
			
				</td>
				
			</tr>
			
		</table>
		<br>
		<div style="text-align: center;">
		<c:choose>
			<c:when test="${sessionScope.user_id == 'admin'}">
				<button type="button" class="btn btn-outline-warning" id="modifyNoticeBtn" style="float: right;">수정하기</button>
				<button type="button" class="btn btn-outline-danger" id="removeNoticeBtn" style="float: right;margin-right: 5px">삭제하기</button>
			</c:when>
		</c:choose>
		<button type="button" style="background-color: pink;border-color: pink;color: black;" class="btn btn-primary" id="goNoticeListBtn">목록으로</button>
		</div>
<br><br>
</div>
</main>

<%@ include file="../includes/footer.jsp"%>
