<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
파일 이름 : <a href="FileDown?fileName=${map['fileName']}">${map['fileName']}</a> &nbsp; &nbsp; 파일크기 : ${fileSize} kb <br>
<hr>
<div>설명 : 여행${map['travelNation']} 타이틀:${map['title']} <br> 컨텐츠 : ${map['content']}</div>
<img src ="/4Travel/images/${map['fileName']}" width="100" height="100">
콘텐츠:${map['content']}  임 
</body>
</html>