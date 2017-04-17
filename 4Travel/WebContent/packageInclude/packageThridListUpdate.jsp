<%@page import="java.util.List"%>
<%@page import="com.biz.PackageBiz"%>
<%@page import="com.entity.PackageThirdDTO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String packagename=request.getParameter("packagename");
String startyear=request.getParameter("startyear");
String startmonth=request.getParameter("startmonth");
String term=request.getParameter("term");
String startdate=startyear+"/0"+startmonth;
PackageThirdDTO dto = new PackageThirdDTO();
dto.setPackagename(packagename);
dto.setStartdate(startdate);
dto.setTerm(term);
PackageBiz biz=new PackageBiz();
List<PackageThirdDTO> list2=null;
System.out.println(startdate);
try {
	list2=biz.packageTableAllList(dto);
	request.setAttribute("Plist2", list2);
	
} catch (Exception e) {
	e.printStackTrace();
}

%>
        
 	 			<table id="tablelist"> 
 	 				<tr style="text-align: center;"> 
 	 				<td>출/도착시간</td><td>항공  </td><td>상품명</td><td> 여행기간 </td><td>상품가격 </td><td> 예약상태 </td>  
 	 				</tr>
 	 				<c:forEach var="i" items="<%=list2%>">
 	 				<tr class="packagelistTable">
 	 				<td>${i.startdate}<br><font color="red">${i.lastdate}</font></td> <td>${i.airline}</td> <td><a href="PackageDeteilController?packagename=${i.packagename}">${i.packagename}</a></td> 
 	 				<td>${i.term}</td> <td><font color="red">${i.price}</font></td> <td>${i.reservationab}</td>  
 	 				</tr>
 	 				
 	 				</c:forEach>
 	 			</table>
