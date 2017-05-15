<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
$(document).ready(function(){
	var check=false;
	var regPhone = /^\d{4}$/; 
	
	$("#phonenum2").on("blur",function(){
		
		console.log(!regPhone.test(parseInt($("#phonenum2").val())));
		if ((!regPhone.test(parseInt($("#phonenum2").val())))) {
		$("#phonenum2").focus();
		$("#phonenum2").val("");
		}
	});
	
	$("#phonenum3").on("blur",function(){
		if ((!regPhone.test(parseInt($("#phonenum3").val())))) {
		$("#phonenum3").focus();
		$("#phonenum3").val("");
		}
	}); 
	$("form[name='reservationForm']").on("submit",function(event){
		$("form[name='reservationForm'] input").each(function(idx,obj){
			if($.trim($(this).val())==''){
				alert("공란 없이 입력해주세요");
				$(this).focus();
				check=false;
			}
				if(!$.isNumeric($("#phonenum2").val())){
					alert("전화번호는 숫자만 입력해주세요.");
					$("#phonenum2").focus();
					check=false;
				}else if(!$.isNumeric($("#phonenum3").val()))
				{
					alert("전화번호는 숫자만 입력해주세요.");
					$("#phonenum3").focus();
					check=false;
				}else{
					check=true;
				}
					return check;
			}
		}
	});

</script>
</head>
<body>
<%String packagename = request.getParameter("packagename"); %>
	<form name = "reservationForm" action="ReservationController">
		<table board="1px">
			<tr>
				<th>상풍명</th>
				<td><%=packagename%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><select name="phoneno" id="phoneno"><option>010</option><option>011</option></select>-<input size="2px" id="phonenum2" type="text" name="phoneno2">
				-<input size="2px" id="phonenum3" type="text" name="phoneno3"></td>
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