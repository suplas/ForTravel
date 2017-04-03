<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
        $(document).ready(function(){
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    var state = FileReader.readyState;
                    reader.onload = function (e) {
                        $('.blah').append($('<img/>', {
							class:'buttonx',
                        	src: 'images/buttonx.png',
                            style:'cursor: pointer; width:20px',
                        }));
                    	
                    	$('.blah').append($('<img/>', {
                            src: e.target.result,
                        }));
                    	
               		}
                    reader.readAsDataURL(input.files[0]); 
            	}//readURL()--
            }
            $("body").on("change",".imgInp",function(){
                var fileNm = this.value;
 
				if (fileNm != "") {
 
				    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
 
    			if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
        			alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
       				 return false;
    				}else{
    					
    					readURL(this);
    	                
    	                $(this).after("<input type='file' name='theFile' class='imgInp' ><br />");
    	                
    	                $(this).css("display","none");
    				}
 
				}

                
            });
            $("body").on("click",".buttonx",function(){
            	imageIndex=$(".buttonx").index(this);
            	console.log(imageIndex);
				$(this).next().remove();
            	$(this).remove();
            	$(".imgInp").eq(imageIndex).remove();
            	if($.isEmptyObject($(".existingImage"))==true){
            		$(".existingImage").remove();
            	}
          });
        });
  
  </script>    
    
  <div class="container">
<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 작성<small>For Travel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="ReviewBoardController">목록가기</a></li>
				<li class="active">여행 후기
				
			</ol>
		</div>
	</div>
	<!-- /.row -->
	
	<!-- Blog Post Row -->
		<div class="row">
		<form  id="form1" name="form1" method="post" enctype="multipart/form-data" action="ReviewBoardUpdateController">
			<div class="col-lg-12">
		<select name="travelNation">
		<option value="${boardRetrieve.travelNation}" selected="selected">${boardRetrieve.travelNation}</option>
		</select> 
		<select name="travelLoc">
		<option value="${boardRetrieve.travelLoc}" selected="selected">${boardRetrieve.travelLoc}</option>
		</select><br/><br/>
		 제목:  <input type="text" name="title" size="124" value="${boardRetrieve.title}"><br /> <br /> 
		 <div class="existingImage"><c:if test="${boardRetrieve.image1 != null}">
			<c:set var="image_array" value="${fn:split(boardRetrieve.image1,'/')}" />
			<c:forEach var="image" items="${image_array}" varStatus="s">
			<img class="buttonx" src="images/buttonx.png" width="20px" style="cursor: pointer;">
			<img class="existingImages" src="/4Travel/images/${image}" alt="">
				<input type="file" name="theFile" class="imgInp" style="display: none;" value="/4Travel/images/${image}">
				</c:forEach>
			</c:if>
			</div>
			<div class="blah"></div>
					<input type="file" name="theFile" class="imgInp" ><br />
			</div>
			<div class="col-md-6">
				<p><textarea rows="20" cols="130" id="content" name="content" >${boardRetrieve.content}</textarea></p>
				<input type="hidden" name="num" value="${boardRetrieve.num}">
				<a class="btn btn-primary" href="javascript:form1.submit();">수정하기 <i
					class="fa fa-angle-right"></i></a>
			</div>
			</form>
		</div>
		<!-- /.row -->
		<hr>
		
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <font color="gray"><p>ForTravel 대표이사: team M&M 서울 강남구 역삼동  에이콘아카데미(주)에이콘이즈</p>
						<p>대표전화: 02-000-0000 팩스:02-000-0000</p>
                   		 <p>Copyright &copy; team M&amp;M(Jung MinWoo,Lee Min Sub) All Rights Reserved.</p></font>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
