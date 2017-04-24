<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String packagename=request.getParameter("packagename"); %>
	<form action="">
		<table board="1px">
			<tr>
				<th>상풍명</th>
				<td><%=packagename%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
			<td style="position: absolute;"><font color="red" size="2px">휴대폰 번호를 잘못 입력 하면 상담이 어려울 수 있습니다.</font></td>
			</tr>
		</table>
		<br> 
		<input type="submit" value="상담예약하기">
		<input type="reset" value="다시작성하기">
	</form>
</body>
</html>