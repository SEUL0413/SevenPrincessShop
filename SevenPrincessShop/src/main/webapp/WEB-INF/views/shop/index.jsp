 <%@page import="jason.stdlib.include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SevenPrincessShop</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>

<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<h1>여기는 메인 Index 페이지 입니다.</h1>
<h1>로그인을 하셨다면 유저의 정보 : ${nowUser.client_id }</h1>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>
<h1>content</h1><br/>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>