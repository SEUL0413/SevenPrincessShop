<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<!-- css 적용 코드 -->
<link href="${path}/resources/css/header.css" rel="stylesheet"/>

</head>
<body>

<!-- header 1 -->
<div class="topBar">
	<ul class="topBarMenu pull-right">
		<li><a href="/home">HOME</a></li>
		<li><a href="/member/join" style="position:relative">조인</a></li>
		<li><a href="/login/">LOGIN</a></li>
		<li><a href="/cart/">CART</a></li>
	</ul>
</div>

<!-- header 2 -->
<div class="col-xs-12 topArea">
	<div class="contentLimit">
		<div class="col-xs-12 col-lg-8 col-lg-offset-2 ">
			<div class="col-xs-12 col-sm-6 col-sm-offset-3 text-center topCI">
			<center>
				<a class="" href="/"><img src="images/maravillosaLogo.png"></a>
			</center>
			</div>
			<div class="col-xs-12 col-sm-3">
				<form action="/product/search" method="get" name="searchForm" accept-charset="utf-8">
					<div class="input-group input-group-sm searchArea">						
						<input type="text" name="key" id="key" class="form-control" value="" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn"><i class="glyphicon glyphicon-search"></i></button>
						</span>
					</div>
				</form>
			</div>
		</div>		
	</div>
</div>

</body>
</html>