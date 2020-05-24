<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- jstl 사용하기위한 태그입니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css3.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디/비밀번호 찾기 결과</title>
</head>
<body>
<div class="col-xs-12 col-lg-8 contentArea">
		<div class='findResultBox'>
	<div class='ttl'>아이디찾기</div>
	
	<div class='resultMsg'>
	
					찾으시는 아이디는 <span>${id}</span> 입니다.
			</div>
	
	<div class='resultMenu'>
		<input type='button' class='btn  loginBtn mb20' style='float:left;' value='돌아가기' onclick='history.back();'>
		
				<input type='button' class='btn btn-skyblue loginBtn mb20' value='로그인' onclick="location.href='login'">
			</div>
</div>
		</div>

</body>
</html>