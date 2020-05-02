<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>

<!-- css 적용 코드 -->
<link href="${path}/resources/css/nav.css" rel="stylesheet"/>
</head>
<body>

<!-- header 3 - nav -->
<div class="col-xs-12 mainMenuContainer">			
	<div class="contentLimit">	
		<div class="col-xs-12 col-lg-8 col-lg-offset-2 ">			
			<div class="row">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="/product/40" class="dropdown-toggle" data-toggle="dropdown">상의
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/41" target="_self">블라우스</a>
									</li>
									<li>
										<a href="/product/39" target="_self">티셔츠</a>
									</li>
									<li>
										<a href="/product/38" target="_self">맨투맨</a>
									</li>
									<li>
										<a href="/product/10" target="_self">후드</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/37" class="dropdown-toggle" data-toggle="dropdown">하의
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/36" target="_self">청바지</a>
									</li>
									<li>
										<a href="/product/9" target="_self">반바지</a>
									</li>
									<li>
										<a href="/product/35" target="_self">레깅스</a>
									</li>
									<li>
										<a href="/product/34" target="_self">와이드팬츠</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/33" class="dropdown-toggle" data-toggle="dropdown">스커트
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/32" target="_self">롱스커트</a>
									</li>
									<li>
										<a href="/product/8" target="_self">미니스커트</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/31" class="dropdown-toggle" data-toggle="dropdown">원피스
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/30" target="_self">롱원피스</a>
									</li>
									<li>
										<a href="/product/29" target="_self">숏원피스</a>
									</li>
									<li>
										<a href="/product/28" target="_self">민소매원피스</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/27" class="dropdown-toggle" data-toggle="dropdown">아우터
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/26" target="_self">코트</a>
									</li>
									<li>
										<a href="/product/25" target="_self">자켓</a>
									</li>
									<li>
										<a href="/product/24" target="_self">가디건</a>
									</li>
									<li>
										<a href="/product/23" target="_self">패딩</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/7" class="dropdown-toggle" data-toggle="dropdown">코디세트
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/22" target="_self">팬츠코디</a>
									</li>
									<li>
										<a href="/product/21" target="_self">스커트코디</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/20" class="dropdown-toggle" data-toggle="dropdown">수영복
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/6" target="_self">비키니</a>
									</li>
									<li>
										<a href="/product/5" target="_self">모노키니</a>
									</li>
									<li>
										<a href="/product/19" target="_self">비치웨어</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="/product/18" target="_self">셀프웨딩</a>
							</li>
							<li class="dropdown">
								<a href="/product/17" class="dropdown-toggle" data-toggle="dropdown">가방
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/16" target="_self">클러치백</a>
									</li>
									<li>
										<a href="/product/4" target="_self">토트백</a>
									</li>
									<li>
										<a href="/product/15" target="_self">크로스백</a>
									</li>
									<li>
										<a href="/product/14" target="_self">백팩</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/13" class="dropdown-toggle" data-toggle="dropdown">신발
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/12" target="_self">슬립온</a>
									</li>
									<li>
										<a href="/product/11" target="_self">펌프스</a>
									</li>
									<li>
										<a href="/product/3" target="_self">단화</a>
									</li>
									<li>
										<a href="/product/2" target="_self">샌들</a>
									</li>
									<li>
										<a href="/product/1" target="_self">부츠</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>			
</div>

</body>
</html>