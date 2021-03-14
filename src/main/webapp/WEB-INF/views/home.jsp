<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>

<main>
	<div class="col-lg-11">
		<div id="carouselExampleIndicators" class="carousel slide my-4"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="d-block img-fluid"
						style="display: block; margin: 0px auto;"
						src="resources/img/11.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						style="display: block; margin: 0px auto;"
						src="http://placehold.it/900x350" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						style="display: block; margin: 0px auto;"
						src="http://placehold.it/900x350" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

			<div class="row" style="justify-content: space-around ; margin: 1px"  >
        
        <c:forEach items="${list }" var="bookList">
		<div class="col-lg-3 col-md-5 mb-3" 
				style="text-align: center ; padding: 0 5px">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src= "${bookList.fileName}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/book/get?book_id=${bookList.book_id }">${bookList.book_title }</a>
                </h4>
                <h5> <fmt:setLocale value="ko_KR"/><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></h5>
              </div>
            </div>
          </div>
          </c:forEach>

          </div>
		</div>
</main>

<%@ include file="includes/footer.jsp"%>