<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div >
<div class="card" align="center" style="width: 30rem;margin-top: 100px;margin-left: 300px;margin-bottom: 300px">
  <div class="card-body" >
    <h5 class="card-title" style="justify-content: center">주문완료!!</h5>
   
    <p class="card-text">주문해주셔서 감사합니다.</p>
    <a href="../" class="card-link" style="border:1;border-color: pink;">메인페이지</a>
    <a href="/order/order_list" class="card-link">주문목록</a>
  </div>
</div>
</div>

<%@ include file="../includes/footer.jsp"%>