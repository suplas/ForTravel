<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.TotalSerch{ 
	position: absolute;
	top : 7%; 
	left : 40%; 
}
.serchinput{
	border: 0px;
}
#logimg{
	position : absolute;
	top : 4%;
	left : 30%;
}

.spanmenu{
	position: absolute;
	top: 2%;
	left:76%;  
	font-size: 10px; 
}
</style>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
<span class="spanmenu">
<a href="#">마이페이지 |</a>
<a href="#">예약확인/결제 |</a>
<a href="#">고객센터</a>
</span>
<div>
<a href="Home">
<img id = "logimg" alt="로고" src="images/log2.png"></a>
</div>
<div>
<form action="" method="get">
<table class ="TotalSerch" border="2px" bordercolor="#ffa70b">
<tr>
<td>통합검색 </td><td><input class="serchinput" type="text" border="0"></td><td><input class="serchinput" type = "submit" value="검색">
</tr>
</table>
</form>
</div>
<jsp:include page= "maininclude/navi.jsp" flush="true" />
<jsp:include page= "maininclude/header.jsp" flush="true" />
<jsp:include page="maininclude/body.jsp" flush="true" />

</body>
</html>