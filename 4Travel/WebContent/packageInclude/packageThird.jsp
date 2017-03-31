<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<style type ="text/css">
	.tit{
		position : absolute;
		left : 5%;
	}
	.conten{
		position: absolute;
    	left: 15%; 
	}
	
	</style>
<script type="text/javascript">
	$(document).ready(function() {
	 
	</script>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
            
                <h1 class="page-header">${Plist[0].packagename}
                    <small>${i.city}</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li><a href="PackageFirstALLController?loc=${Plist[0].loc}">${Plist[0].loc}</a>
                    <li class="active">${Plist[0].city}</li>
                </ol>
            </div>
        </div> 
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src="images/${Plist[0].image1}.jpg" alt="그림1">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/${Plist[0].image2}.jpg" alt="그림2">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/${Plist[0].image3}.jpg" alt="그림3">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>

            <div class="col-lg-12">
            
              	  <span class = "tit">상품 가격</span><br>
              	  <span class="conten" style="top:0%;"><font color="red" size="2px">${Plist[0].price}원 ~ ${Plist[0].price}원</font></span>
              	
              	  	<span class = "tit" style="top:50%;">여행기간</span><br>
              	  	<span class="conten">${Plist[0].term}</span> 
              	 
              	  	<span class = "tit" style="top:100%;">간략일정</span><br>
              	  	<span class="conten"></span>
              	 
              	  	<span class = "tit" style="top:200%;">상품설명</span><br>
              	 
                	  
            </div>

        </div>
 	 	<div>
 	 	
 	 	</div>
       

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>