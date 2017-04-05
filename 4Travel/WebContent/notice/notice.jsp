<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		//ajax 통신
		$.ajax({
			type : "get",
			url : "/4Travel/images/getTravelBanList.xml",
			dataType : "xml",
			success : function(responseData, status, xhr) {
				var mesg = "";
				var totalCount = $(responseData).find("totalCount").text();
				$(responseData).find("item").each(function(idx, obj) {
					var countryName = $(this).find("countryName").text();
					var countryEnName = $(this).find("countryEnName").text();
					var continent = $(this).find("continent").text();
					var ban = $(this).find("ban").text();
					var banPartial = $(this).find("banPartial").text();
					var banNote = $(this).find("banNote").text();
					var wrtDt = $(this).find("wrtDt").text();
					var info = "<tr>";
						info += "<td>"+countryName+"</td>";
						info += "<td>"+countryEnName+"</td>";
						info += "<td>"+continent+"</td>";
						info += "<td>"+ban+"</td>";
						info += "<td>"+banPartial+"</td>";
						info += "<td>"+banNote+"</td>";
						info += "<td>"+wrtDt+"</td>";
						info += "</tr>";
						mesg += info;
					$("#addBanTable").html(mesg);
				});
				$("#BanTotalCount").append(totalCount);
			},
			error : function(error) {
				console.log(error);
			}
		}); //end ajax
		$.ajax({
			type:"get",
			url:"/4Travel/images/getTravelWarningList.xml",
			dataType:"xml",
			success:function(responseData,status,xhr){
				var mesg ="";
				var totalCount=$(responseData).find("totalCount");
				$(responseData).find("item").each(function(idx,obj){
					var continent=$(this).find("continent").text();
					var countryName=$(this).find("countryName").text();
					var countryEnName=$(this).find("countryEnName").text();
					var wrtDt=$(this).find("wrtDt").text();
					var attention=$(this).find("attention").text();
					var attentionPartial=$(this).find("attentionPartial").text();
					var attentionNote=$(this).find("attentionNote").text();
					var control=$(this).find("control").text();
					var controlPartial=$(this).find("controlPartial").text();
					var controlNote=$(this).find("controlNote").text();
					var limit=$(this).find("limit").text();
					var limitPartial=$(this).find("limitPartial").text();
					var limitNote=$(this).find("limitNote").text(); 
					var info = "<tr>";
					info += "<td>"+continent+"</td>";
					info += "<td>"+countryName+"</td>";
					info += "<td>"+countryEnName+"</td>";
					info += "<td>"+wrtDt+"</td>";
					info += "<td>"+attention+"</td>";
					info += "<td>"+attentionPartial+"</td>";
					info += "<td>"+attentionNote+"</td>";
					info += "<td>"+control+"</td>";
					info += "<td>"+controlPartial+"</td>";
					info += "<td>"+controlNote+"</td>";
					info += "<td>"+limit+"</td>";
					info += "<td>"+limitPartial+"</td>";
					info += "<td>"+limitNote+"</td>";
					info += "</tr>";
					mesg += info;
					
				$("#addWarningTable").html(mesg);
				});
				$("#WarningTotalCount").append(totalCount);
			},
			error:function(error){
				console.log(error);
			}
		}); //end ajax
	}); /* endDoucumentReady */
</script>    

    
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">공지사항
                    <small>여행 정보</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">공지사항</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
        
       
       
        <!-- /.row -->
        <hr>
        <form action="BanListUpdateController" name="banUpdateForm" method="post">
        	<!-- <input type="hidden" name="banUpdateDate"  id="banUpdateDate"> -->
            <button id="banUpdate">금지목록 업데이트</button>&nbsp;&nbsp;<font color="red"><small>주의! 시간이 다소 걸리는 과정입니다</small></font><br>
            </form>
             금지목록 마지막 업데이트 날짜:<span id="banUpdateDate"></span>
        <table border="1" id="BanTable">
		<thead>
			<tr>
				<th>국가명</th>
				<th>영문 국가명</th>
				<th>대륙</th>
				<th>여행금지</th>
				<th>여행금지(일부)</th>
				<th>여행금지 내용</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody id="addBanTable">
		
		</tbody>
	</table>
		<div id="BanTotalCount">TotalCount:</div>
    
    <hr>
     <form action="WarningListUpdateController" name="warningUpdateForm" method="post">
        	<!-- <input type="hidden" name="warningUpdateDate"  id="warningUpdateDate"> -->
            <button id="warningUpdate">경보목록 업데이트</button>&nbsp;&nbsp;<font color="red"><small>주의! 시간이 다소 걸리는 과정입니다</small></font><br>
        </form>  
           
            경보목록 마지막 업데이트 날짜:<span id="warningUpdateDate"></span>
         <table border="1" id="warningTable" style="width: 1000px; height:2000px; overflow: auto; " >
		<thead>
			<tr>
				<th>대륙</th>
				<th>국가명</th>
				<th>영문 국가명</th>
				<th>등록일</th>
				<th>여행유의</th>
				<th>여행유의(일부)</th>
				<th>여행유의 내용</th>
				<th>여행자제</th>
				<th>여행자제(일부)</th>
				<th>여행자제 내용</th>
				<th>여행제한</th>
				<th>여행제한(일부)</th>
				<th>여행제한 내용</th>
			</tr>
		</thead>
		<tbody id="addWarningTable">
		
		</tbody>
	</table>
	<div id="WarningTotalCount">TotalCount:</div>
    <hr>
   <small> 출처: <a href="https://www.data.go.kr/">공공데이터포털</a>의 여행금지제도,여행경보제도 api </small><br>
   <small> 원본 xml : <a href="http://apis.data.go.kr/1262000/TravelBanService/getTravelBanList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D">여행금지제도</a>,<a href="http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D&numOfRows=150">여행경보제도</a></small>
    <hr>
    </div>
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
