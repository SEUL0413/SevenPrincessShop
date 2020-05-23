<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 카테고리 쇼 페이지입니다.</h1>
	<h1>넘어온 카테고리 넘버 : ${cNum}</h1>
	<h1>로그인을 하셨다면 유저의 정보 : ${nowUser.client_id }</h1>
	<a href="productInfo?product_idx=1">상품1</a>
</body>
</html>