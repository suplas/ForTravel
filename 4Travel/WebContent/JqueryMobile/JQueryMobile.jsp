<%@page import="com.biz.ReviewReplyBiz"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jquery mobile</title>

<link rel="stylesheet" href="jqueryMobile/jquery.mobile-1.4.5.css">
<script src="./jquery/jquery.js"></script>
<script src="./jqueryMobile/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/jqueryMobile.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<!-- Jquery source -->
<script type="text/javascript">
	var intervalFn;
	var init = {
		setting : function() {

			var $listTarget = $('.list ul li');
			var liWidth, liOffset;
			$.each($listTarget, function(i, e) {
				liWidth = $(e).innerWidth();
				$(e).css('left', liWidth * i);
			})

			this.clickEv();
		},
		clickEv : function() {
			rs = 2000
			var $listTarget = $('.list ul');

			$('.next').on('click', function() {

				clearInterval(intervalFn)
				intervalFn = setInterval(function() {
					init.moveEff($listTarget.children('li'), 'next');
				}, rs)
			})
			$('.prev').on('click', function() {
				clearInterval(intervalFn)
				intervalFn = setInterval(function() {
					init.moveEff($listTarget.children('li'), 'right');
				}, rs)
			})
		},
		moveEff : function(t, c) {
			if (c == 'next') {

				var overWrap = t.first().position().left;

				var dumi = 0

				$.each(t, function(i, e) {
					$(e).animate(
							{
								left : '-=' + $(e).width()
							},
							{
								duration : 500,
								step : function() {

									if (overWrap <= 0 && dumi == 0) {
										var copyEl = t.first().html();
										var spot = t.last().position().left;

										t.last().after(
												'<li style="left:'+spot+'px">'
														+ copyEl + '</li>');
										dumi = 1;
									}
								},
								complete : function() {
									t.first().remove()
								}
							})
				})

			} else if (c == 'right') {

				var overWrap = t.first().position().left;
				var dumi = 0
				$.each(t, function(i, e) {
					$(e).animate(
							{
								left : '+=' + $(e).width()
							},
							{
								duration : 500,
								step : function() {

									if (overWrap > 0 && dumi == 0) {
										var copyEl = t.last().html()
										var spot = t.first().position().left
										t.first().before(
												'<li style="left:'+spot+'px">'
														+ copyEl + '</li>')
										dumi = 1
									}
								},
								complete : function() {
									t.last().remove()
								}
							})
				})
			}
		}
	}

	$(document).ready(function() {
		init.setting()
		$('.next').trigger('click')
	})
</script>

<!-- ajex DB연동 -->
<script>
	$(function() {
		$(document).ready(function() {
			$.ajax({
				url : 'JQueryMobile.jsp',
				Type : 'get',
				success : function(t) {

					$(t).find("person").each(function(i) {
							console.log(t);
						$("#package_imeage_frist").attr({
							src : $(t).find('image1#1').text()
						});
						$("#package_imeage_two").attr({
							src : $(t).find('image2#1').text()
						});
						$("#package_imeage_three").attr({
							src : $(t).find('image3#1').text()
						});
						$("#packagename").text($(t).find('packagename#1').text()).css('font-size','11px'); 
						$("#packagename2").text($(t).find('packagename#2').text()).css('font-size','11px');
						
						/* startdate 날짜 포멧 변환 */
						var date = ($(t).find('startdate#1').text()).split(" ")[0];
						var tmpDate = date.split("-");
						var startdate = tmpDate[0]+"/"+tmpDate[1]+"/"+tmpDate[2];
						var date2 = ($(t).find('startdate#2').text()).split(" ")[0];
						var tmpDate2 = date2.split("-");
						var startdate2 = tmpDate2[0]+"/"+tmpDate2[1]+"/"+tmpDate2[2];
						
						 
						$("#startdateOne").text(startdate);
						$("#startdateTwo").text(startdate2);
						
						
						$("#package_price").text($(t).find('price#1').text()+"원");
						$("#package_price2").text($(t).find('price#2').text()+"원");
						
						$("#packagePage_img1").attr({src : $(t).find('image1#2').text()});
							
					});
				}
			});
		});
	});
</script>
</head>
<body>
	<%
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			String url = "jdbc:oracle:thin:@192.168.1.14:1521:orcl";
			String userName = "fortravel";
			String passWord = "fortravel";
			Connection con = DriverManager.getConnection(url, userName, passWord);
			Statement st = con.createStatement();
			
			  String sql = "select * from packagedb";

			st.executeUpdate(sql);
			ResultSet rs = st.executeQuery(sql);
			String strXML = "";
		
			int packageID = 1;
			int imeage1ID = 1;
			int imeage2ID = 1;
			int imeage3ID = 1;
			int priceID = 1;
			int startDateId = 1;
			strXML += "<packagedb style='display:none;'>"; 
			while (rs.next()) {
				strXML += "<person>";
				strXML += "<PACKAGENAME id=" + packageID + ">" + rs.getString("PACKAGENAME") + "</PACKAGENAME>";
				strXML += "<PRICE id=" + priceID + ">" + rs.getString("PRICE") + "</PRICE>";
				strXML += "<image1 id=" + imeage1ID + ">" + rs.getString("image1") + "</image1>";
				strXML += "<image2 id=" + imeage2ID + ">" + rs.getString("image2") + "</image2>";
				strXML += "<image3 id=" + imeage3ID + ">" + rs.getString("image3") + "</image3>";
				strXML += "<startdate id=" + startDateId + ">" + rs.getString("startdate") + "</startdate>";
				strXML += "</person>" + ",";
				packageID++;
				imeage1ID++;
				imeage2ID++;
				imeage3ID++;
				priceID++;
				startDateId++;
			}
			strXML += "</packagedb>";
			out.write(strXML);

		} catch (Exception e) {
			System.out.println(e);
		}
	%>


	<div id="home" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			<a class="main_button" href="#home" data-icon="home"
				style="background-color: #ffffff;">Home</a> <a class="main_button"
				href="#login" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package">패키지</a> <a id="header_naviBar_review" href="#review">여행
					후기</a> <a id="header_naviBar_login" href="#sign-up">회원가입</a>
			</span>
		</div>


		<div data-role="content" style="background-color: #ffffff;">

			<div class="slider_bg">
				<div class="slider">
					<div class="controller">
						<button class="next">&gt;</button>
						<!-- <button class="prev">&lt;</button> -->
					</div>
					<div class="list" style="position: relative; left: 9%;">
						<ul>
							<li><a href=""><img id="package_imeage_frist" alt=""></a></li>
							<li><a href=""><img id="package_imeage_two" alt=""></a></li>
							<li><a href=""><img id="package_imeage_three" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- main package area -->
			<div class="package_main_div">
				<h3 class="subNavi">
					<font color="black">패키지 추천</font>
				</h3>
				<hr>
				<br>
				<div class="package_div">
					<div class="package_div_img">
						<img src="imeage/osak.jpg" class="package_img">
					</div>
					<div class="package_text_div">
						<a href="#"><h3 id="packagename"></h3></a>
						<h5 id = startdateOne></h5>
						<h4 id="package_price"
							style="position: relative; bottom: 17px; left: 27%;"></h4> 
					</div>
				</div>
				<div class="package_div2">
					<div class="package_div_img">
						<img src="imeage/osak.jpg" class="package_img">
					</div>
					<div class="package_text_div">
						<a href="#"><h3 id="packagename2"></h3></a>
						<h5 id = startdateTwo></h5>
						<h4 id="package_price2" style="position: relative; bottom: 17px; left: 27%;"></h4>
					</div>
				</div>
			</div>
			<!-- End main package area  -->

			<!-- main review area -->
			<div class="review_main_div">
				<h3 class="subNavi">
					<font color="black">Best 후기</font>
				</h3>
				<hr>
				<br>
				<div class="review_div">
					<div class="package_text_div">
						<a href="#"><h3>내용 / 작성자</h3></a>
						<h3 style="position: absolute; left: 75%; top: 4%;">조회수:</h3>
					</div>
				</div>
				<br>
				<div class="review_div2">
					<div class="package_text_div">
						<a href="#"><h3>내용 / 작성자</h3></a>
						<h3 style="position: absolute; left: 75%; top: 4%;">조회수:</h3>
					</div>
				</div>
			</div>
			<!-- End main review area  -->

		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>
	</div>
	<!-- package page 영역 -->
	<div id="package" data-role="page">
		<div data-role="header" style="background-color: #ffffff;">
			<h1>4Trevel</h1>
			<a class="main_button" href="#home" data-icon="home"
				style="background-color: #ffffff;">Home</a> <a class="main_button"
				href="#login" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package">패키지</a> <a id="header_naviBar_review" href="#review">여행
					후기</a> <a id="header_naviBar_login" href="#login">로그인</a>
			</span>
		</div>
		<div data-role="content" style="background-color: #E6E9ED;">
			<div>
				<a href="#"><img id = "packagePage_img1"></a>
			</div>
		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>

	</div> <!-- package page 영역 종료 -->
	
	<!-- review page 여역 -->

	<div id="review" data-role="page">
		<div data-role="header" style="background-color: #ffffff;">
			<h1>4Trevel</h1>
			<a class="main_button" href="#home" data-icon="home"
				style="background-color: #ffffff;">Home</a> <a class="main_button"
				href="#login" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package">패키지</a> <a id="header_naviBar_review" href="#review">여행
					후기</a> <a id="header_naviBar_login" href="#login">로그인</a>
			</span>
		</div>
		<div data-role="content" style="background-color: #E6E9ED;">
		
		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>
	</div> <!-- review page 영역 종료 -->
	
	<!-- login page 영역 -->

	<div id="login" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			<a class="main_button" href="#home" data-icon="home"
				style="background-color: #ffffff;">Home</a> <a class="main_button"
				href="#login" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package">패키지</a> <a id="header_naviBar_review" href="#review">여행
					후기</a> <a id="header_naviBar_login" href="#sign-up">회원가입</a>
			</span>
		</div>
		<div data-role="content" style="background-color: #E6E9ED;">
		
		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>
	</div> <!-- login page 영역 종료 -->
	
	<!-- sign-up page 영역 -->

	<div id="sign-up" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			<a class="main_button" href="#home" data-icon="home"
				style="background-color: #ffffff;">Home</a> <a class="main_button"
				href="#login" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package">패키지</a> <a id="header_naviBar_review" href="#review">여행
					후기</a> <a id="header_naviBar_login" href="#sign-up">회원가입</a>
			</span>
		</div>
		<div data-role="content" style="background-color: #E6E9ED;">
		
		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>
	</div> <!-- sign-up page 영역 종료 -->
	

</body>
</html>


