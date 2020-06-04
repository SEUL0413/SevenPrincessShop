<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <!-- jstl 사용하기위한 태그입니다. 추후 include 파일로 만들것-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findIdPw.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- header / nav 설정 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="col-xs-12 col-lg-8 contentArea">
		<div class='findResultBox'>
	<div class='ttl'>비밀번호찾기</div>
	
	<div class='resultMsg'>
	
					
			임시비밀번호가 <span>${email }</span>으로 발급되었습니다.
			<br>이메일을 확인해 주세요.
				
			</div>
	
	<div class='resultMenu'>
		<input type='button' class='btn  loginBtn mb20' style='float:left;' value='돌아가기' onclick='history.back();'>
		
				<input type='button' class='btn btn-skyblue loginBtn mb20' value='로그인' onclick=onclick="location.href='login'">
			</div>
		</div>
	</div>
	
<!-- footer 설정 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>