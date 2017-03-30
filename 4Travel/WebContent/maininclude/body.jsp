<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="container">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".newpackage").css("width","100%");
		$(".newpackage").css("height","200px");
		
		$(".testEle").css("color","red");
		$(".fontcolor").css("color","black");
		
		$("#002").css("left","65%");
		$("#002box").css("background-color","orange");
		$("#002box").css("color","white"); 
		
		$("#api").css("position","fixed");
		$("#api").css("left","85%");
		$("#api").css("top","75%");
		
		$(window).scroll(function(){
			
			var sc = $(document).scrollTop();
			var dHeight = $("body").height();
			var wHeight = $(window).height();
			console.log(sc);
			if(sc > 100){
				$("#api").css("position","fixed");
				$("#api").css("top","20%");    
				$("#api").css("left","85%");
			}else if (sc < 100){   
			$("#api").css("position","fixed");
			$("#api").css("top","75%"); 
			$("#api").css("left","85%");
			/* $("#navitop").css("top","100"); */
			}
		});
	});
	
/* 	setInterval(function(){
		$(".testEle").toggle();
		}, 500); */
	
			</script>
        <!-- Marketing Icons Section -->
        <br>
        <div class="marquee"> 
           <marquee>   
           	<font color="black"><h3>환율 정보 api</h3></font>   
           </marquee>
           </div>
           <div>
        <iframe id ="api" src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0002&rc=0&divType=1&lang=KOR" frameBorder=0
width=600 scrolling=no height=184 topmargin="0" name=irate marginWidth=0 marginHeight=0 title="무료환율표A형"></iframe>			
			
           </div>
    
         <h3 class="page-header">
                 <font color="orange">1BEST 여행 후기</font>  	 
         </h3>
         
     <c:forEach var="BestReview" items="${Plist2}"> 
        <div >
               
        	<div class="col-md-4" id="bestReview">
                <div class="panel panel-default">
                  <!--   <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>베스트 여행후기</h4>
                    </div> -->
        	 <div class="panel-body">
        	 <p><a href="ReviewBoardDetailController"><img  class="newpackage" src="/4Travel/images/${BestReview.image1}"></img></a><br><br>
                        	<span>타이틀 : </span><span class="testEle">${BestReview.title}</span></p>
                        	작성자 : ${BestReview.userid}<br>
                        	여행지 : ${BestReview.travelNation}/${BestReview.travelLoc}<br>
                        	<span>조회수 : </span><span class="testEle">${BestReview.readcnt}</span></p>
        	</div>
        	</div>
        	</div>
        </div>
        </c:forEach>
        
         <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    	<font color="orange">추천 패키지</font><font size = "1"><a href="#" >더보기...</font></a>
                </h3> 
            </div>
             
            <c:forEach var="i" items="${Plist}"> 
            <div class="col-md-4"> 
                 <div class="panel panel-default"> 
                    <!--  <div class="panel-heading"> 
                        <h4><i class="fa fa-fw fa-check"></i>추천 패키지</h4>
                    </div> -->
                    <div class="panel-body">
    
				<a href="PackageThirdListController?packagename=${i.packagename}&packageno=${i.packageno}">
                        <p><img  class="newpackage" src="images/${i.doorimg}.jpg"></img></a><br><br>
                        	패키지 명 : ${i.packagename}<br>
                        	출발날짜 : ${i.startdate}<br>
                        	도착날짜 : ${i.lastdate}<br>
                        	<span>가격 : </span><span class="testEle">${i.price}</span></p>
                    </div>
               </div>
             </div>
              </c:forEach>
           
             </div>
           
           
            <%-- <div class="col-md-4">
            </div>
            
            <!-- div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> 공지사항</h4>
                    </div>
                    <div class="panel-body">
                        <p>공지사항 텍스트</p>
                        <a href="#" class="btn btn-default">보러가기</a>
                    </div>
                </div>
            </div> -->
            <%-- <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>여행후기</h4>
                    </div>
                    <div class="panel-body">
                    	
                         <p><a href="ReviewBoardDetailController?num=${Plist2[0].num}"><img  class="newpackage" src="/4Travel/images/${Plist2[0].image1}"></img></a><br><br>
                        	<span>타이틀 : </span><span class="testEle">${Plist2[0].title}</span></p>
                        	작성자 : ${Plist2[0].userid}<br>
                        	여행지 : ${Plist2[0].travelNation}/${Plist2[0].travelLoc}<br>
                        	<span>조회수 : </span><span class="testEle">${Plist2[0].readcnt}</span></p>
                        <a href="ReviewBoardDetailController?num=${Plist2[0].num}" class="btn btn-default">보러가기</a>
                    </div>
                </div>
            </div>
        </div>  --%>
        <!-- /.row -->

        <!-- Portfolio Section -->
        
        <!-- Features Section -->
        <%-- <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">이달의 여행지</h2>
            </div>
            <div class="col-md-6">
                
                <p><strong>지역 설명</strong></p>
            	 <strong>우에노 공원 / 신주쿠교엔 – 도쿄</strong><br>
					<strong><font color="FF99FF">기간: 3월 중순 ~ 4월 중순</font></strong><br>
					<p>우에노 공원은 시민들의 휴식 장소이자 일본에서 가장 유명한 벚꽃 명소 중 하나로 
					국립 서양 미술관으로 향한 길과 시노바즈노이케에 핀 벚꽃은 어디에 견주어도 아름답다.
					하지만 그만큼 꽃놀이를 즐기러 오는 하루 평균 수십만명의 인파들을 견뎌야 한다. 
					벚꽃 축제 기간에는 해가 지면 1,000개의 초롱 등대가 설치되어 벚꽃나무 아래에서 
					하나미를 즐기려는 사람들의 밤을 밝혀준다	
					신주쿠 교엔은 신주쿠의 빽빽한 고층 빌딩 사이의 오아시스 같은 공간이다. 
					과거 막부의 가신 나이토 가문의 소유지로 다시 메이지 시대에는 황실 정원, 
					1949년 이후에는 시민의 공원으로 재편되었다. 메이시 시대 때부터 벚꽃으로 명성이 높았던 
					신주쿠 교엔은 봄이 되면 약 65종류의 벚꽃을 1개월 넘게 감상할 수 있다.</p>
					<p><strong>관련 패키지</strong></p>
                	<ul>
                    <li><strong>패키지 명 :${Plist[1].packagename}</strong></li>
                    <li>출발날짜 : ${Plist[1].startdate}</li>
                    <li>도착 날짜 : ${Plist[1].lastdate}</li>
                    <li>여행기간 : ${Plist[1].term}</li>
                    <li>항공사 : ${Plist[1].airline}</li>
                    <li>가격 : ${Plist[1].price}</li> <a class="btn btn-lg btn-default btn-block" href="PackageThirdListController?loc=${Plist[1].loc}&packagename=${Plist[1].packagename}"><font class="fontcolor">관련 패키지 보러 가기</font></a>
                </ul>
            </div>
         --%>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p><font color="orange">고객지원 센터</font></p>
                </div>
                <div class="col-md-4" id="002">
                    <a class="btn btn-lg btn-default btn-block " id="002box" href="FAQBoard.jsp">02-000-0000</a>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                   <jsp:include page="forcopy.jsp" flush="true" />
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
