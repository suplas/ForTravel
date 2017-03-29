<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->

<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loc").css("display","none");	
		if(${travelNation != "전체보기"}){
			$("#loc").css("display","inline");		
		}
		
	});
</script>
<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 <small>For Travel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="Home">Home</a></li>
				<li class="active">여행 후기
				<li class="dropdown">나라 : 
				<a id="aTagNation" href="ReviewBoardController?orders=${orders}&searchName=${searchName}&searchValue=${searchValue}" class="dropdown-toggle" data-toggle="dropdown">${travelNation}<b
						class="caret"></b></a>
					<ul id="ulTagNation" class="dropdown-menu">
						<li class="liTagNation"><a href="ReviewBoardController?orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">전체보기</a></li>
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=일본&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">일본</a>
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=미국&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">미국</a>
						</li>
					</ul>
				</li>	
				<li class="dropdown">
					<span id="loc">
				지역 : <a id="aTagLoc" href="ReviewBoardController?travelNation=${travelNation}&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}"
					class="dropdown-toggle" data-toggle="dropdown">${travelLoc} <b
						class="caret"></b></a>
					<ul id="ulTagLoc" class="dropdown-menu">
						<li class="liTagLoc"><a href="ReviewBoardController?travelNation=${travelNation}&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">전체보기</a></li>
						<c:forEach items="${locList}"  var="loc">
						<li class="liTagLoc"><a href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${loc}&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">${loc}</a></li>
						</c:forEach>
					</ul>
					</span>
				</li>
					
					<li class="dropdown"> 
				<a id="aTagNation" href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${travelLoc}&orders=writeday&searchName=${searchName}&searchValue=${searchValue}" class="dropdown-toggle" data-toggle="dropdown">
				<c:if test="${orders=='writeday'}">최신순</c:if>
				<c:if test="${orders=='readcnt'}">조회순</c:if>
				<b class="caret"></b></a>
					<ul id="ulTagNation" class="dropdown-menu">
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${travelLoc}&orders=writeday&searchName=${searchName}&searchValue=${searchValue}">최신순</a>
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${travelLoc}&orders=readcnt&searchName=${searchName}&searchValue=${searchValue}">조회순</a>
						</li>
					</ul>
				</li>	
				<li>
					<form action="ReviewBoardController" method="get"
						style="display: inline;">
						<select name="searchName">
							<option value="title"
								<c:if test="${searchName !=null && searchName=='title'}">selected="selected"</c:if>>제목</option>
							<option value="userid"
								<c:if test="${searchName !=null && searchName=='userid'}">selected="selected"</c:if>>작성자</option>
						</select> 
						<input type="text" name="searchValue" value='${searchValue}'>
						<input type="hidden" name="perPageCount" value='${perPage}'>
						<input type="hidden" name="searchName" value='${searchName}'>
						<input type="hidden" name="searchValue" value='${searchValue}'>
						<input type="hidden" name="travelNation" value='${travelNation}'>
						<input type="hidden" name="travelLoc" value='${travelLoc}'>
						<input type="hidden" name="orders" value='${orders}'>
						<input type="submit" value="검색" height="5px">
					</form>
				</li>
				<li>
				<a href="ReviewBoardWriteUIController">후기 작성하기</a>
				</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->

	<c:forEach items="${pageDTO.list}" var="dto">

		<!-- Blog Post Row -->
		<div class="row">
			<div class="col-md-1 text-center">
				<p>${dto.travelNation}</p>
				<p>${dto.travelLoc}</p>
				<p>조회수 : ${dto.readcnt}</p>
				<p>${dto.writeday}</p>
			</div>
			<c:if test="${dto.image1 !=null}">
				<div class="col-md-5">
					<a href="#"> <img class="img-responsive img-hover"
						src="/4Travel/images/${dto.image1}" width="300px" height="180px"  alt="">
					</a>
				</div>
			</c:if>
			<div class="col-md-6">
				<h3>
					<a href="ReviewBoardDetailController?num=${dto.num}">${dto.title}</a>
				</h3>
				<p>
					by <a href="#">${dto.userid}</a>
				</p>
				<p>${dto.content}</p>
				<a class="btn btn-primary" href="ReviewBoardDetailController?num=${dto.num}">Read More <i
					class="fa fa-angle-right"></i></a>
			</div>
		</div>
		<!-- /.row -->
		<hr>
	</c:forEach>




<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="PageDisCountController">&laquo;</a>
                    </li>
                    <c:forEach var="i" begin="${startPageCount}" end="${endPageCount}">

					<c:if test="${curpage==i}">
					<li class="active">
                        <a href="#">${i}</a>
                    </li>
					</c:if>
					<c:if test="${curpage!=i}">
					<li>
                        <a href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${travelLoc}&orders=readcnt&searchName=${searchName}&searchValue=${searchValue}&curpage=${i}">${i}</a>
                    </li>
					</c:if>
				</c:forEach>
					<li>
                        <a href="PageCountController">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->
	<hr>

	<!-- Footer -->
	 <footer>
            <div class="row">
                <div class="col-lg-12">
                    <font color="gray"><p>ForTravel 대표이사: team M&M 서울 강남구 역삼동  에이콘아카데미(주)에이콘이즈</p>
						<p>대표전화: 02-000-0000 팩스:02-000-0000</p>
                   		 <p>Copyright &copy; team M&amp;M(Jung MinWoo,Lee Min Sub) All Rights Reserved.</p></font>
                </div>
            </div>
        </footer>

</div>
<!-- /.container -->



