<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#reple{
width: 700px;
height: 200px;
margin: auto;
}
.arrowdiv{
width:15px;
height:15px;
background-image: url('images/arrow.png');
background-size: 15px;
padding:0;
}
.showtoggle{
display:block;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
		
	$("body").on("click",".replebutton",function(event){
		if(${login==null}){
				alert('로그인 후 시도 해주세요');
			}else if($(this).next().next().next(".reple").attr("style")=='display: block;'){
			$(this).next().next().next(".reple").css("display","none");
		}else{
			$(this).next().next().next(".reple").css("display","block");
		}
			console.log($(this).next().next().next(".reple").attr("style"));
			console.log($.trim($(this).next().next().next(".reple").attr("style"))=='display: block;');
		});//end rdeplebutton event
		
		$(".rprpformButton").on("click",function(event){
			console.log($(this).closest(".rprpform"));
			var queryString = $(this).closest(".rprpform").serialize() ;
			console.log(queryString);
		
			$.ajax({
				type:"get",
				url:"board/reviewReplyUpdate.jsp",
				dataType:"html",
				data:queryString,
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#replyDiv").html(responseData);
				},
				error:function(error){
					console.log(error);
				}
			}); //end ajax 
		});	
});	
		</script>
<div id="replyDiv" class="container">
<!-- Comment -->
	<c:forEach var="list" items="${rpList}">
		<div class="media">
			<c:forEach begin="0" end="${list.repIndent}">

			<a class="pull-left" href="#">
					<div class="media-object" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</a>
				</c:forEach>
			<a class="pull-left" href="#">
					<div class="media-object arrowdiv" ></div>
			</a>
			<div class="media-body">
			
				<h4 class="media-heading">
					By ${list.userid} <small>${list.writeday}</small>
				</h4>
				<pre style="background: none; border: 0;">${list.content}</pre>
			<button class="replebutton btn btn-primary" style="display: inline; size: ">댓글 달기</button>
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
					<button type="button" class="rprpformButton btn btn-primary">Submit</button>
				</form>
			</div>
			</div>
		</div>
	</c:forEach>
	<!-- Comment -->
		<hr>
</div>