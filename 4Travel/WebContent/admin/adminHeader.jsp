<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="com.entity.BannerImageDTO"%>
<%@page import="com.biz.BannerImageBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
BannerImageBiz biz=new BannerImageBiz();

BannerImageDTO dto=biz.BannerImageSelect();
ArrayList<String> imageList=new ArrayList<>();
ArrayList<String> captionList=new ArrayList<>();
StringTokenizer imagetoken=new StringTokenizer(dto.getImageName(),"/");

if(dto.getImageCaption()!=null){
StringTokenizer captiontoken=new StringTokenizer(dto.getImageCaption(),"/");
while(captiontoken.hasMoreTokens()){
	captionList.add(captiontoken.nextToken());
}
	
}
while(imagetoken.hasMoreTokens()){
	imageList.add(imagetoken.nextToken());
}

%>
   <link href="css/mainSerch.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(document).ready(function() {
		 $(".item").eq(0).addClass("active");
	});
</script>
<header id="myCarousel" class="carousel slide">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<!-- Preview Image -->
			<c:forEach var="image" items="<%=imageList%>" varStatus="image_status">
				<div class="item">
					<a href="#">
						<div class="fill" style="background-image:url('/4Travel/images/${image}');"></div>
					<c:if test="<%=captionList.size()==0%>">
						<c:forEach var="caption" items="<%=captionList%>" varStatus="caption_status">
							<c:if test="${image_status.index==caption_status.index}"></c:if>
							<div class="carousel-caption">${caption}</div>
						</c:forEach>
					</c:if>
					 </a>
				</div>
			</c:forEach>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a>
</header>