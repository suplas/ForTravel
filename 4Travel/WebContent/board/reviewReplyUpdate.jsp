<%@page import="java.util.List"%>
<%@page import="com.biz.ReviewReplyBiz"%>
<%@page import="com.entity.MemberDTO"%>
<%@page import="com.entity.ReviewReplyDTO"%>
<%@page import="com.dao.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <%
    String content=request.getParameter("rprpContent");
    String num=request.getParameter("num");
    String repRoot=request.getParameter("repRoot");
    String repStep=request.getParameter("repStep");
    String repIndent=request.getParameter("repIndent");
    String reviewNum=request.getParameter("reviewNum");
    ReviewReplyDTO rpDTO=new ReviewReplyDTO();
    MemberDTO mdto = (MemberDTO)session.getAttribute("login");
    
    rpDTO.setContent(content);
	rpDTO.setUserid(mdto.getUserid());
	rpDTO.setNum(Integer.parseInt(reviewNum));
	rpDTO.setRepRoot(Integer.parseInt(repRoot));
	rpDTO.setRepStep(Integer.parseInt(repStep));
	rpDTO.setRepIndent(Integer.parseInt(repIndent));
	rpDTO.setReviewNum(Integer.parseInt(reviewNum));
    
	ReviewReplyBiz biz=new ReviewReplyBiz();
	List<ReviewReplyDTO> rpList=null;
	
    SqlSession sess = MySqlSessionFactory.openSession();
    int result = 0;
    try{
 	 result = biz.replyInsert(rpDTO);
     
     rpList=biz.replyList(Integer.parseInt(reviewNum));
   }catch(Exception e){
 	  e.printStackTrace();
   }finally{
 	  sess.close();
   }
   System.out.println("result:" + result);
   System.out.println("부모 인덴트" + repIndent);
   
   %>

    
    <!-- Comment -->
	<c:forEach var="list" items="<%=rpList%>">
		<div class="media">
			<c:forEach begin="0" end="${list.repIndent}">

			<a class="pull-left" href="#">
					<div class="media-object" >&nbsp;&nbsp;</div>
			</a>
				</c:forEach>
			<a class="pull-left" href="#">
					<div class="media-object arrowdiv" ></div>
			</a>
			<div class="media-body">
			
				<h4 class="media-heading">
					By ${list.userid} <small>${list.writeday}</small>
				</h4>
				<pre>${list.content}</pre>
			<button class="replebutton btn btn-primary">댓글 달기</button>
			<br/><br/>
			<div class="reple well" style="display: none;">
				<h4>Leave a Comment:</h4>
				<form class="rprpform" name="rprpform" role="form" method="post">
					<div class="form-group">
						<textarea name="rprpContent"class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" name="userid" value="${sessionScope.login.userid}">
					<input type="hidden" name="num" value="${list.num}">
					<input type="hidden" name="repRoot" value="${list.repRoot}">
					<input type="hidden" name="repStep" value="${list.repStep}">
					<input type="hidden" name="repIndent" value="${list.repIndent}">
					<input type="hidden" name="reviewNum" value="${boardRetrieve.num}">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			</div>
		</div>
		<hr>
	</c:forEach>
	<!-- Comment -->
