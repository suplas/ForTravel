<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<scriptsrc="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#myCarousel").css("top","81px");
});

</script>
 <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
            <a href = "#">
                <div class="fill" style="background-image:url('images/배너1.jpg');"></div>
                <div class="carousel-caption">
                    
                </div></a> 
            </div>
            <div class="item">
            <a href = "#">
                <div class="fill" style="background-image:url('images/배너2.jpg');"></div>
                <div class="carousel-caption">
                  
                </div></a>
            </div>
            <div class="item">
            <a href = "#">
                <div class="fill" style="background-image:url('images/배너3.jpg');"></div>
                <div class="carousel-caption">
                     
                </div></a>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>