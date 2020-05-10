<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<!-- Toggle Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" aria-controls="collapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar"> 
			
			<ul id="menuList" class="nav navbar-nav centered"> 
				
				
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">상의</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="showCategory?cNum=01">블라우스</a>
						<a class="dropdown-item" href="showCategory?cNum=02">티셔츠</a>
						<a class="dropdown-item" href="showCategory?cNum=03">맨투맨</a>
						<a class="dropdown-item" href="showCategory?cNum=04">후드</a>
					</div>
				</li>
				
				
				
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">하의</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="showCategory?cNum=05">청바지</a>
						<a class="dropdown-item" href="showCategory?cNum=06">반바지</a>
						<a class="dropdown-item" href="showCategory?cNum=07">와이드 팬츠</a>
						<a class="dropdown-item" href="showCategory?cNum=08">스커트</a>
					</div>
				</li> 
				
				
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">원피스</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="showCategory?cNum=09">롱 원피스</a>
						<a class="dropdown-item" href="showCategory?cNum=10">숏 원피스</a>
						<a class="dropdown-item" href="showCategory?cNum=11">민소매 원피스</a>
					</div>
				</li>
				
				
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">아우터</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="showCategory?cNum=12">코트</a>
						<a class="dropdown-item" href="showCategory?cNum=13">자켓</a>
						<a class="dropdown-item" href="showCategory?cNum=14">가디건</a>
						<a class="dropdown-item" href="showCategory?cNum=15">패딩</a>
					</div>
				</li>
				
				
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">악세사리</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="showCategory?cNum=16">가방</a>
						<a class="dropdown-item" href="showCategory?cNum=17">신발</a>
						<a class="dropdown-item" href="showCategory?cNum=18">모자</a>
					</div>
				</li>    
				
				
			</ul> 
		</div> 
	</nav>
	<!-- 네비게이션 바 끝 -->
</body>
</html>