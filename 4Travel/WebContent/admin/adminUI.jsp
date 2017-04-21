<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#addcon {
	width:100%;
	height:500px;
    border: 1px solid gray;
}
</style>
<script src="js/myScript.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").on("click","#adminUI",function(){
			myAjax('admin/admin.jsp',true,'html','','.addcontent');
		});//end adminUI
		
		$("body").on("click","#adminMain",function(){
			myAjax('admin/bannerUpdate.jsp',true,'html','','.addcontent');
		});//end adminUI 
		
		$("body").on("click","#preview",function(){
			var imageLength=$("img.existingImages").length;
			
			$("header").find(".fill").each(function(idx, obj) {
				var imgsrc=$("img.existingImages").eq(idx).attr("src");
				$(this).css("background-image","url("+imgsrc+")");
			});
			$("header").find(".carousel-caption").each(function(idx, obj) {
				var precaption=$("textarea.content").eq(idx).val();
				$(this).text(precaption);
			});
			$("#previewDiv").css("display","block");
		});//end previewEvent

		function readURL(input,inputIndex) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                var state = FileReader.readyState;
                reader.onload = function (e) {
                    $('.blah').eq(inputIndex).append($('<img/>', {
						class:'buttonx',
                    	src: 'images/buttonx.png',
                        style:'cursor: pointer; width:20px',
                    }));
                	
                	$('.blah').eq(inputIndex).append($('<img/>', {
                        src: e.target.result,
                        class:'existingImages',
                    }));
                	$('.blah').eq(inputIndex).append("<textarea id='content' name='content' class='content'></textarea>");
                	
           		}
                reader.readAsDataURL(input.files[0]); 
        	}//readURL()--
        }
        $("body").on("change",".InputexistingImages",function(){
            var fileNm = this.value;

			if (fileNm != "") {

			    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();

			if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
    			alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
   				 return false;
				}else{
					inputIndex=$(".InputexistingImages").index(this);
	                $(this).after("<div class='blah'></div>");
	                $(this).css("display","none");
	                $(this).after("<input type='file' name='theFile' class='InputexistingImages' ><br />")
 	                
					readURL(this,inputIndex);
				}

			}

            
        });
        $("body").on("click",".buttonx",function(){
        	imageIndex=$(".buttonx").index(this);
        	console.log(imageIndex);
        	$(".InputexistingImages").eq(imageIndex).remove();
        	$(".blah").eq(imageIndex).remove();
        	$(this).remove();
      });
	}); /* endDoucumentReady */
	
	
</script>    
    
<div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
        <div class="col-lg-12">
                <h1 class="page-header">관리자페이지
                    <small>4Travel</small>
                </h1>
            </div>
            <div class="col-md-12">
            <ol class="breadcrumb">
            <li>
            <a id="adminUI" style="cursor: pointer;">관리자화면</a>
            </li>
            <li>
        	<a id="adminMain" style="cursor: pointer;">메인화면 수정</a>
        	</li>
        	<li>
        	<a id="adminPackage" style="cursor: pointer;">패키지목록수정</a>
        	</li>
        	<li>
        	<a id="adminMember" style="cursor: pointer;">회원목록 보기/수정</a>
        	</li>
        	<li>
        	<a id="adminReservation" style="cursor: pointer;">예약목록 보기/수정</a>
			</li>
			<li>
			<a id="adminReviewBoard" style="cursor: pointer;">여행후기/답글 삭제</a>
			</li>
			</ol>
			</div>		
		</div>
		<table  id="addcon">
			<tr><td class="addcontent"></td></tr>
		</table>
    </div>
   
    <!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
