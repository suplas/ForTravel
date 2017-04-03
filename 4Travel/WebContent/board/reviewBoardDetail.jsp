<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.arrowdiv{
width:10px;
height:10px;
background-image: url('images/arrow.png');
background-size: 10px;
padding:0;
}
</style>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 <small><a href="#">For Travel</a> </small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="ReviewBoardController">목록가기</a></li>
				<li class="active">${boardRetrieve.title}</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->

	<!-- Content Row -->
	<div class="row">

		<!-- Blog Post Content Column -->
		<div class="col-lg-8">

			<!-- Blog Post -->

			<hr>

			<!-- Date/Time -->
			<p>
			<p class="lead">${boardRetrieve.title}</p>	<i class="fa fa-clock-o"></i> Posted on ${boardRetrieve.writeday}
			</p>


			<!-- Preview Image -->
			<c:if test="${boardRetrieve.image1 != null}">
			<hr>
			<c:set var="image_array" value="${fn:split(boardRetrieve.image1,'/')}" />
			<c:forEach var="image" items="${image_array}" varStatus="s">
			<img class="img-responsive"
				src="/4Travel/images/${image}" alt=""><br/><br/>
				</c:forEach>
			</c:if>

			<!-- Post Content -->
			
			<p>
			<pre>${boardRetrieve.content}</pre>
			</p>

			<hr>
			
			<!-- Blog Comments -->

			<!-- Comments Form -->
			<div class="well">
				<h4>Leave a Comment:</h4>
				<form action="ReviewReplyWriteController"role="form" method="post">
					<div class="form-group">
						<textarea name="rpContent"class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" name="num" value="${boardRetrieve.num}">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<hr>


	
</div>


<!-- /.container -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>