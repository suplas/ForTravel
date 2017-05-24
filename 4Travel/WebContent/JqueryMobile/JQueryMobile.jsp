<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jquery mobile</title>
 
<link rel="stylesheet" href="./jqueryMobile/jquery.mobile-1.4.5.css">
<script src="./jquery/jquery.js"></script>
<script src="./jqueryMobile/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/jqueryMobile.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<!-- Jquery source -->
<script type="text/javascript">
var intervalFn;
var init = {
setting:function(){

var $listTarget = $('.list ul li');
var liWidth,liOffset;
$.each($listTarget,function(i,e){
liWidth = $(e).innerWidth();
$(e).css('left',liWidth*i);
})

this.clickEv();
},
clickEv:function(){
rs = 2000
var $listTarget = $('.list ul');

$('.next').on('click',function(){

clearInterval(intervalFn)
intervalFn = setInterval(function(){
init.moveEff($listTarget.children('li'),'next');
},rs)
})
$('.prev').on('click',function(){
clearInterval(intervalFn)
intervalFn = setInterval(function(){
init.moveEff($listTarget.children('li'),'right');
},rs)
})
},
moveEff:function(t,c){
if(c == 'next'){

var overWrap = t.first().position().left;

var dumi = 0

$.each(t,function(i,e){
$(e).animate({
left:'-=' + $(e).width()
},{
duration:500,
step:function(){

if(overWrap <= 0 && dumi == 0){
var copyEl = t.first().html();
var spot = t.last().position().left;

t.last().after('<li style="left:'+spot+'px">'+copyEl+'</li>');
dumi = 1;
}
},
complete:function(){
t.first().remove()
}
})
})

}else if(c =='right'){

var overWrap = t.first().position().left;
var dumi = 0
$.each(t,function(i,e){
$(e).animate({
left:'+='+$(e).width()
},{
duration:500,
step:function(){

if(overWrap > 0 && dumi == 0){
var copyEl = t.last().html()
var spot = t.first().position().left
t.first().before('<li style="left:'+spot+'px">'+copyEl+'</li>')
dumi=1
}
},
complete:function(){
t.last().remove()
}
})
})
}
}
}

$(document).ready(function(){
init.setting()
$('.next').trigger('click')
})
</script>
</head>
<body>
<div id="home" data-role="page">
<div data-role ="header" style="background-color: #ffa70b;"> 
<h1>4Trevel</h1>
<a href = "#" data-icon = "arrow-L" class = "ui-btn ui-btn-b">Back</a>
<a href = "#" data-icon = "home" class = "ui-btn ui-btn-b">Home</a>
<div data-role = "controlgroup" data-type="horizontal" style="margin-left:20%; margin-right:10%;" >  
<a href = "#package" data-role = "button"  >패키지</a> 
<a href = "#" data-role = "button" >여행후기</a>
<a href = "#" data-role = "button" >로그인</a> 
</div>
</div>


<div data-role ="content">

 <div class="slider_bg">
<div class="slider">
<div class="controller"> 
<button class="next">&gt;</button>
<!-- <button class="prev">&lt;</button> -->
</div>
<div class="list">
<ul>
<li><a href=""><img src="imeage/op1.jpg" alt=""></a></li>
<li><a href=""><img src="imeage/op2.jpg" alt=""></a></li>
<li><a href=""><img src="imeage/op3.jpg" alt=""></a></li>
</ul>
</div>
</div>
</div>
    
   <!-- main package area -->
    <div class="package_main_div">
    	<h3><font color = "orange">패키지 추천</font></h3>
    	<hr>
    	<div class ="package_div">
    	<div class= "package_div_img" >
    	<img src ="imeage/osak.jpg" class="package_img">
    	</div>
    	<div class="package_text_div">
    	<h3>이름 및 내용</h3>
    	</div>
    	</div> 
    	<div class ="package_div2">
    	<div class= "package_div_img" >
    	<img src ="imeage/osak.jpg" class="package_img">
    	</div>
    	<div class="package_text_div">
    	<h3>이름 및 내용</h3>
    	</div>
    	</div> 
    </div> <!-- End main package area  -->
    
      <!-- main review area -->
    <div class="package_main_div">
    	<h3><font color = "orange">Best 후기</font></h3>
    	<hr>
    	<div class ="review_div">
    	<div class= "review_div_img" >
    	<img src ="imeage/osak.jpg" class="package_img">
    	</div>
    	<div class="package_text_div">
    	<h3>이름 및 내용</h3>
    	</div>
    	</div> 
    	<div class ="package_div2">
    	<div class= "package_div_img" >
    	<img src ="imeage/osak.jpg" class="package_img">
    	</div>
    	<div class="package_text_div">
    	<h3>이름 및 내용</h3>
    	</div>
    	</div> 
    </div><!-- End main review area  -->
    
</div>
<div data-role ="footer" data-position="fixed">
<h1>footer</h1>
</div> 
</div>
<div id="package" data-role="page">
<h3>두번째 페이지 </h3>
</div>

</body>
</html>


