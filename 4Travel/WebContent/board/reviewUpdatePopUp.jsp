<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String num=request.getParameter("num");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4Travel/여행후기 수정하기</title>
<style type="text/css">
body{
margin: auto;
}
</style>
<script language="Javascript"> 
function frameclose() { 
parent.close() 
window.close() 
self.close() 
} 
</script>
</head>
<body>
<form id="reviewUpdateForm" name="reviewUpdateForm" action="ReviewBoardUpdateController">
<input type="hidden" name="num" value="<%=num%>">
<center><b><%=num%>번 글을 수정하시겠습니까?</b></center>
<center>
<input type="submit" value="수정하기" onclick="javascript:frameclose()">
<input type="reset" value="취소" onclick="javascript:frameclose()">
</center>
</form>
</body>
</html>