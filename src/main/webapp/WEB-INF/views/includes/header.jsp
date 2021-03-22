<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link href="/resources/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

</head>

<body class="sb-nav-fixed" style="padding: 10px 0 0">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"><i class="fas fa-book"></i>
				Loopy Girls' Bookstore</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav"
				style="justify-content: flex-end">
				<c:choose>
				
					<c:when test="${sessionScope.user_id != null}">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#" style="color: hotpink;">${sessionScope.user_id} 님, </a></li>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">My Page</a></li>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/cart/list">Cart</a></li>
							<li class="nav-item"><a class="nav-link" href="/user/logout">LOG OUT</a>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/user/login">LOGIN</a></li>
								
							<li class="nav-item"><a class="nav-link" href="/user/join">JOIN</a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>


	<!-- Navigation -->


	<!-- Page Content -->
	<div class="container-fluid">

		<div class="row">

			<div class="col-lg-2" style="margin:">

				<h3 class="my-4">Loopy Girls' Bookstore</h3>
				<div class="list-group">
					<a href="/book/list?book_kategorie=all" class="list-group-item"
						style="color: hotpink;">도서 전체 목록</a> <a
						href="/book/list?book_kategorie=IT/컴퓨터" class="list-group-item"
						style="color: hotpink;">- IT/컴퓨터</a> <a
						href="/book/list?book_kategorie=외국어" class="list-group-item"
						style="color: hotpink;">- 외국어</a> <a
						href="/book/list?book_kategorie=소설" class="list-group-item"
						style="color: hotpink;">- 소설</a> <a
						href="/book/list?book_kategorie=여행" class="list-group-item"
						style="color: hotpink;">- 여행</a> <a
						href="/book/list?book_kategorie=요리" class="list-group-item"
						style="color: hotpink;">- 요리</a> <a
						href="/book/list?book_kategorie=어린이" class="list-group-item"
						style="color: hotpink;">- 어린이</a> 
						<a href="/notice/list" class="list-group-item" style="color: hotpink;">공지사항</a>
				</div>

			</div>

			<div class="col-lg-10">

				<div class="row">