<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	 
		$("#package").on("mouseover",function(event) {	
			$(".siteMapList").toggle();
			$(".siteMapList").css("display","block"); 
		});
		$(".siteMapList").css("padding","0px;");
		$(".siteMapList").on("mouseout",function(event) {	
			$(".siteMapList").css("display","none"); 
		});
		
		
	});
			</script>
  <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Site Map
                    <small>한눈에 사이트 보기</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">Site Map</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
                <div class="list-group">
                    <a href="index.html" class="list-group-item">Home</a>
                    <a href="#" class="list-group-item" id = "package">패키지</a>
                    <ul class="siteMapList" style="display:none;">
                    <a href ="PackageFirstALLController?loc=동남아"><li class="list-group-item">동남아/대만</li></a>
                    <a href ="PackageFirstALLController?loc=중국"><li class="list-group-item">중국/홍콩</li></a>
                    <a href ="PackageFirstALLController?loc=일본"><li class="list-group-item">일본</li></a>
                    <li class="list-group-item">유럽</li>
                    <li class="list-group-item">괌/사이판</li>
                    <li class="list-group-item">남태평양</li>
                    <li class="list-group-item">미국/캐나다</li>
                    <li class="list-group-item">서남아/중앙아시아</li>
                    <li class="list-group-item">중동/아프리카</li>
                    <li class="list-group-item">중남미</li>
                    </ul>
                    <a href="services.html" class="list-group-item">여행후기</a>
                    <a href="contact.html" class="list-group-item">공지사항</a>
                    <a href="portfolio-1-col.html" class="list-group-item">FAQ</a>
                    <a href="blog-home-1.html" class="list-group-item">회원가입</a>
                </div>
            </div>
            <!-- Content Column -->
            <div class="col-md-9">
                <h2>Section Heading</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Copyright &copy; team M&amp;M(Jung Minwoo,LeeMinsub) 2017</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
