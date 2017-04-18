<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#addcon {
    border: 1px solid gray;
}
</style>
<script src="js/myScript.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").on("click","#adminUI",function(){
			myAjax('admin/admin.jsp',true,'html','','.content');
		});//end adminUI
		
		$("body").on("click","#adminMain",function(){
		});//end adminUI 
		
	}); /* endDoucumentReady */
	
	
</script>    
    
<div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
        <div class="col-lg-12">
                <h1 class="page-header">공지사항
                    <small>여행 정보</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">공지사항</li>
                </ol>
            </div>
            <div class="col-md-12">
            <ol class="breadcrumb">
            <li>
            <a id="adminUI" style="cursor: pointer;">관리자화면</a>
            </li>
            <li>
        	<a id="adminMain" style="cursor: pointer;">메인화면 수정</a>
        	</li>
        	<li>
        	<a id="adminPackage" style="cursor: pointer;">패키지목록수정</a>
        	</li>
        	<li>
        	<a id="adminMember" style="cursor: pointer;">회원목록 보기/수정</a>
        	</li>
        	<li>
        	<a id="adminReservation" style="cursor: pointer;">예약목록 보기/수정</a>
			</li>
			<li>
			<a id="adminReviewBoard" style="cursor: pointer;">여행후기/답글 삭제</a>
			</li>
			</ol>
			</div>		
		</div>
		<table  id="addcon">
			<tr><td class="content"></td></tr>
		</table>
    </div>
   
    <!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
