<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<style type ="text/css">
	#price1{
		position : absolute; 
		left : 5%;
		top : 30%;
	}
	#price2{
		position: absolute;
    	left: 15%; 
    	top : 30%;
	}
	#term{
		position : absolute; 
		left: 5%;  
		top : 38%; 
	}
	#term2{
		position : absolute; 
		left: 15%;
		top : 38%;
	}
	#date1{
		position : absolute; 
		left: 5%;
		top : 46%;
	}
	#date2{
		position : absolute; 
		left: 15%;
		top : 46%;
	}
	#contents{
		position : absolute;  
		left: 5%;
		top : 55%; 
	}
		#contents2{
		position : absolute;  
		left: 15%;
		top : 55%; 
		width: 40%;
	}
	#remoteButton{
	position: absolute;
	top : 100%;
	width: 100%; 
	height: 70%;
	 
	}
	#prevButton{
	position: absolute;
	left: 74%;
	}
	#nextButton{
	position: absolute;
	left: 26%; 
	}
	#datespan1{
	position: absolute;
    left: 31%; 
    width: 19%;
    text-align: center;
    border: 1px solid;
   
	}
	#datespan2{
	position: absolute;
    left: 54%;
    width: 19%;
    border: 1px solid;
    text-align: center;
    	
	}
	#listDayPackage{
    position: absolute;
    top: 26%;
    left: 12%;
    width: 86%;
	}
 #tablelist{
 	width: 100%;
 }
	</style>
<script type="text/javascript">
	$(document).ready(function() {
		
	}; 
	 
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

            <div class="col-md-8" style="float: right;"> 
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
                            <img class="img-responsive" style="height: 300px;" src="images/${Plist[0].image1}.jpg" alt="그림1">
                        </div>
                        <div class="item">
                            <img class="img-responsive" style="height: 300px;" src="images/${Plist[0].image2}.jpg" alt="그림2">
                        </div>
                        <div class="item">
                            <img class="img-responsive" style="height: 300px;" src="images/${Plist[0].image3}.jpg" alt="그림3">
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
            
              	  <span id = "price1">상품 가격</span><br>
              	  <span id ="price2" ><font color="red" size="2px">${Plist[0].price}원 ~ ${Plist[0].price}원</font></span>
              	
              	  	<span id = "term" >여행기간</span><br>
              	  	<span id ="term2">${Plist[0].term}</span> 
              	 
              	  	<span id = "date1">간략일정</span><br>
              	  	<span id ="date2">${Plist[0].overview}</span>
              	 
              	  	<span  id = "contents">상품설명</span>
              	  	<span  id = "contents2">${Plist[0].detail}</span>
 				
            </div>
        </div>
        <div id = "remoteButton">
        
        <div>
 				<span id = "prevButton"><button type="button">prev</button></span>
 				<span id = "nextButton"><button type="button">next</button></span> 
 				<span id = "datespan1">test</span>
 				<span id ="datespan2">test2</span>
 				<div id="listDayPackage"> 
 	 			<table id="tablelist"> 
 	 				<tr>
 	 				<td>출/도착시간</td><td>◆ 항공 ◆</td><td>상품명</td><td>◆ 여행기간 ◆</td><td>상품가격 </td><td>◆ 예약상태 ◆</td> 
 	 				</tr>
 	 				<c:forEach var="i" items="${Plist}">
 	 				<tr>
 	 				<td>${i.startdate}<br>${i.lastdate}</td> <td>${i.airline}</td> <td>${i.packagename}</td> 
 	 				<td>${i.term}</td> <td>${i.price}</td> <td>${i.reservationab}</td>  
 	 				</tr>
 	 				<br> 
 	 				</c:forEach>
 	 			</table>
 	 		</div>
 	 		</div>
 			</div>
 			
	
       

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>