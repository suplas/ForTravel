<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->

<script src="js/jquery.js"></script>
<!-- CSS -->
<style type="text/css">
.udbutton{
	 position: absolute;
    float: right;
    left: 58%; 
    top: 24%;
}
.reviewimg{
	    left: 72%;
    position: relative;	
    width: 25%;
    height: 20%;
    top : -147px;
}
.title {
 position: relative;
 left : 29%;
 top : -187px; 
 width: 11%;
 height: 165px;
 
}
</style>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loc").css("display","none");	
		if(${travelNation != "전체보기"}){
			$("#loc").css("display","inline");		
		}
		
		$("body").on("click",".reviewUpdate",function(event){
			var popUrl = "board/reviewUpdatePopUp.jsp?num="+$(this).parent().children(".dtonumber").text();	//팝업창에 출력될 페이지 URL

			var popOption = "top=300, left=200, width=300, height=40, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

				window.open(popUrl,"",popOption);

			});
		
		$("body").on("click",".reviewDelete",function(event){
			var popUrl = "board/reviewDeletePopUp.jsp?num="+$(this).parent().children(".dtonumber").text();	//팝업창에 출력될 페이지 URL

			var popOption = "top=300, left=200, width=300, height=40, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

				window.open(popUrl,"",popOption);

			});

	});
</script>
<div class="container" style="position: relative; top:20px;">  

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 <small>For Travel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="Home">Home</a></li>
				<li class="active">여행 후기
				<li class="dropdown">나라 :
				<a id="aTagNation"  href="ReviewBoardController?orders=${orders}&searchName=${searchName}&searchValue=${searchValue}" class="dropdown-toggle" data-toggle="dropdown">${travelNation}<b
						class="caret"></b></a>
					<ul id="ulTagNation" class="dropdown-menu">
						<li class="liTagNation"><a href="ReviewBoardController?orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">전체보기</a></li>
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=일본&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">일본</a>
						<li class="liTagNation"><a href="ReviewBoardController?travelNation=미국&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}">미국</a>
						</li>
					</ul>
				</li>	
				<li class="dropdown" id="loc">
					<span >
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
		<div class="row reviewlist" style="margin-left: 2%; height: 174px;">  
			<div class="contest">
				<p>${dto.travelNation}</p>
				<p>${dto.travelLoc}</p>
				<p>조회수 : ${dto.readcnt}</p>
				<p>${dto.writeday}</p>
				
			</div>
			<span class = "udbutton">
					<b class="dtonumber" style="display: none;">${dto.num}</b>
					<c:if test="${sessionScope.login.userid==dto.userid}">
					<button class="reviewUpdate btn label label-success" style="display: inline;">수정</button>  
					<button class="reviewDelete btn label label-success" >삭제</button>
					</c:if>
				</span><br>
			<c:if test="${dto.image1 !=null}">
			<c:set var="image_array" value="${fn:split(dto.image1,'/')}" />
				<div class="reviewimg">  
					<a href="#"> 
					<img class="img-responsive img-hover"
						src="/4Travel/images/${image_array[0]}"  alt="">
				</a>
				</div>
			</c:if>
			<div class="title">
				<h3>
					<a href="ReviewBoardDetailController?num=${dto.num}">${dto.title}</a>
				</h3>
				<p>
					by <a style="color: black; text-decoration: none;">${dto.userid}</a>
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
                        <a href="ReviewBoardController?travelNation=${travelNation}&travelLoc=${travelLoc}&orders=${orders}&searchName=${searchName}&searchValue=${searchValue}&curpage=${i}">${i}</a>
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



