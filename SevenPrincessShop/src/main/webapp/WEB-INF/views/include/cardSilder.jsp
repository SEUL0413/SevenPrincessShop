<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	
	<!-- 카드 슬라이더 -->
	<script> $('.carousel').carousel({ interval: 2000  }) </script> 
	<br/>
	<div class="container">
		<p></p>
	</div> 
	
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner"> 
		<!-- 슬라이드 쇼 --> 
		<div class="carousel-item active">
			<!--가로--> 
			<img class="d-block w-100" src="./resources/images/pageImages/card01.jpg" alt="First slide">
			<div class="carousel-caption d-none d-md-block">
				<h5>Design By SPS Team</h5>
			</div> 
		</div>
		
		<div class="carousel-item">
			<img class="d-block w-100" src="./resources/images/pageImages/card02.jpg" alt="Second slide">
		</div> 
		
		
		<div class="carousel-item">
			<img class="d-block w-100" src="./resources/images/pageImages/card03.jpg" alt="Third slide">
		</div>
		<!-- / 슬라이드 쇼 끝 -->
		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<!-- <span>Previous</span> -->
		</a> 
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<!-- <span>Next</span> -->
		</a>
		<!-- / 화살표 버튼 끝 -->
		
		<!-- 인디케이터 -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<!--0번부터시작-->
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul> <!-- 인디케이터 끝 --> 
	</div>
	<br/>
	<!-- 카드 슬라이더 끝 -->
	
	
	
	
	
	
	
	
	
	
</body>
</html>