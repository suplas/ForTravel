<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
<script src="./jquery/jquery-1.11.0.js"></script>
<script src="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/mainSerch.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
    
    <script type="text/javascript" language="JavaScript">
var mobileKeyWords = new Array("iPhone", "iPod", "BlackBerry", "Android", "Windows CE", "Windows CE;", "LG", "MOT", "SAMSUNG", "SonyEricsson", "Mobile", "Symbian", "Opera Mobi", "Opera Mini", "IEmobile");
for (var word in mobileKeyWords){
if (navigator.userAgent.match(mobileKeyWords[word]) != null){
window.location.href = "JqueryMobile/JQueryMobile.jsp";
break;
}
}
</script>



</head>
<body>
	<jsp:include page="maininclude/Serch.jsp" flush="true" />
	<jsp:include page="maininclude/navi.jsp" flush="true" />
	<jsp:include page="maininclude/header.jsp" flush="true" />
	<jsp:include page="maininclude/body.jsp" flush="true" />


</body>
</html>