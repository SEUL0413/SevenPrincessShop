<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






<!-- top bar -->

	  <nav class="navbar fixed-top navbar-expand-sm navbar-light bg-light">
		  <div class="container-fluid">
		  	<a class="navbar-brand" href="#">SenvePrincessShop</a>
		  	
		  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		    	<span class="navbar-toggler-icon"></span>
		  	</button>
		  	
		  	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    <ul class="nav navbar-nav ml-auto">
			    	<li class="nav-item">
			    		<c:if test="${empty sessionScope.nowUser}">
			        		<a class="nav-link" href="login">로그인</a>
			        	</c:if>
			        	<c:if test="${not empty sessionScope.nowUser}">
			        		<a class="nav-link" href="logout">로그아웃</a>
			        	</c:if>
				    </li>
				    <li class="nav-item">
				    	<a class="nav-link" href="myPage">마이페이지</a>
				    </li>
				    <li class="nav-item">
				    	<a class="nav-link" href="myBasket">장바구니</a>
				    </li>
				    <li class="nav-item">
				    	<a class="nav-link" href="customerService">고객센터</a>
				    </li>
		   	 	</ul>
		  	</div>
		</div>
	</nav>
	<!-- top bar 끝 -->
	
	
	
	<!-- 메인 배너 -->
	<div class="jumbotron text-center mb-0">
		<h1><br/>SEVEN PRINCESS SHOP</h1>
		<p>대한민국 No.1 여성의류 쇼핑몰</p>
	</div> 
	<!-- 메인 배너 끝-->







</body>
</html>