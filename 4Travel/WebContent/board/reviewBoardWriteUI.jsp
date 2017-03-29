<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
        $(document).ready(function(){
            function readURL(input) {
                if (input.files && input.files[0]) {
                	//console.log(input.files);
                	//console.log(input.files[0]);
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) {
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        $('#blah').append($('<img/>', {
                            src: e.target.result,
                        }));
                        $('#blah').append('<br/>');
                        $('#blah').append('<br/>'); 
                    	///* $('#blah').attr('src', e.target.result); */
                        //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                        //(아래 코드에서 읽어들인 dataURL형식)
                    }                   
                    //File내용을 읽어 dataURL형식의 문자열로 저장
                    reader.readAsDataURL(input.files[0]); 
                	//console.log($(".imgInp").val());
                	//console.log($(".imgInp"));
                	//console.log($(".imgInp")[0].files);
                	//console.log($(".imgInp")[0].files[0]);
                }
            }//readURL()--
   
            //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
            $("body").on("change",".imgInp",function(){
                //alert(this.value); //선택한 이미지 경로 표시
                var fileNm = this.value();
 
				if (fileNm != "") {
 
				    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
 
    			if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
        			alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
       				 return false;
    				}
 
}

                readURL(this);
                
                $(this).after("<input type='file' name='theFile' class='imgInp' ><br />");
                
                $(this).css("display","none");
                //$("#realFile")[0].files[$(".imgInp").length-1]=$(this)[0].files[0];
                //$("#realFile")[0].files.length=$(".imgInp").length; 
                //console.log($("#realFile")[0].files);
                //console.log($("#realFile")[0].files.length);
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
		<form  id="form1" name="form1"method="POST" enctype="multipart/form-data" action="ReviewBoardWriteController">
			<div class="col-lg-12">
		<select name="travelNation">
		<option value="일본">일본</option>
		<option value="미국">미국</option>
		</select> 
		<select name="travelLoc">
		<option value="오사카">오사카</option>
		<option value="교토">교토</option>
		</select><br/><br/>
		 제목:  <input type="text" name="title" size="124"><br /> <br /> 
		 <div id="blah"></div>
					<!-- <img id="blah" src="#" alt="사진도 같이 올려보세요" /> -->
					<input type="file" name="theFile" class="imgInp" ><br />
			</div>
			<div class="col-md-6">
				<p><textarea rows="20" cols="130" id="content" name="content" ></textarea></p>
				<a class="btn btn-primary" href="javascript:form1.submit();">글작성 <i
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
