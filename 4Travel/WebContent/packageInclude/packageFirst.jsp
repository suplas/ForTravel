<%@page import="com.entity.PackageThirdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%session.getAttribute("login"); %>
 <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">패키지
                    <small>${Plist[0].loc}</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">패키지</li>
           
                </ol>
             
            </div>
            
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
     
 	<c:forEach var="i" items="${Plist}">
        <div class="row">
            <div class="col-md-4 img-portfolio">
                <a href="PackageThirdListController?packagename=${i.packagename}&packageno=${i.packageno}&userid=${login.userid}">
                    <img class="img-responsive img-hover" src="images/${i.doorimg}.jpg" alt="packageimage01">
                </a>
                <h3>
                    <a href="PackageThirdListController?packagename=${i.packagename}&packageno=${i.packageno}&userid=${login.userid}">${i.packagename}</a>
                </h3>
               			<p>여행 지역 : ${i.loc}</p>
               			<p>여행 기간 : ${i.term}</p>
                		<p>가격 : ${i.price}</p>
                		
                		
                
            </div>
           
       
        </div> 
         </c:forEach>
        <!-- /.row -->

        <hr>

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
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
                    <p>Copyright &copy; team M&amp;M(Jung Minwoo,LeeMinsub) 2017</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
