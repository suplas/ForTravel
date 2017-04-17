<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="addcon container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="addcon row">
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
            <a id="adminUI" onclick="myAjax('admin/admin.jsp',true,'html',10,'.content');" style="cursor: pointer;">관리자화면</a>
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
    </div>
