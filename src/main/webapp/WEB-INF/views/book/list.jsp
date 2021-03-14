<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<main>
<br>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			
			
			<h2>${nothing != "all" ? list[0].book_kategorie : "전체도서"}</h2>
			
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

<div class="row" style="justify-content: space-around ; margin: 1px"  >
        <c:forEach items="${list }" var="bookList">
		<div class="col-lg-3 col-md-5 mb-3" style="text-align: center ; padding: 0 5px">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src= "${bookList.fileName}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/book/get?book_id=${bookList.book_id }">${bookList.book_title }</a>
                </h4>
                <h5> <fmt:setLocale value="ko_KR"/><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></h5>
                <p class="card-text">${bookList.book_intro }</p>
              </div>
            </div>
          </div>
          </c:forEach>

          </div>
</main>
<%@ include file="../includes/footer.jsp"%>