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
<form  id="updateform" name="form1" method="post" enctype="multipart/form-data" action="">

		<!-- Preview Image -->
			<c:forEach var="image" items="<%=imageList%>" varStatus="image_status">
				<div>
				<img src="/4Travel/images/${image}" height="300px" class="existingImages"/>
				<input type="hidden" class="InputexistingImages" name="existingImages" value="${image}">
				<img class="buttonx" src="images/buttonx.png" width="20px" style="cursor: pointer;">	
					<c:if test="<%=captionList.size()!=0%>">
						<c:forEach var="caption" items="<%=captionList%>" varStatus="caption_status">
							<c:if test="${image_status.index==caption_status.index}">
							<textarea id="content" name="content" class="content">${caption}</textarea>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>
					<div class="blah"></div>
					<input type="file" name="theFile" class="imgInp" ><br />
</form>
	<!-- Controls -->
