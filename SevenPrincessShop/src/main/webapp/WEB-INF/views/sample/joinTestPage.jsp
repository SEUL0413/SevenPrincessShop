<!-- 추후 삭제하세요 프레임 참고용 가입페이지입니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl 사용하기위한 태그입니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/memberJavaScript/testScriptJoinCheck.js"></script>
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/joinSample.css"/>

</head>
<body>
	<h1>Join Test Exercise</h1>
	<form name = "join" id="join" action = "" method="post">
	<div>	
	<h3>아이디</h3> 
	<input id="id" type="text" name="client_id"  onblur="regCheck1()" value="${vo.client_id }"/><br/>
	<span id="errorId" style="color: red;"></span>
	
	<h3>비밀번호</h3>
	<input id="password" type="password" name="client_password" value="${vo.client_password }" onblur="regCheck2()"/><br/>
	<span id="errorPw" style="color: red;"></span>
	
	<h3>비밀번호 재확인</h3>
	<input type="password" id="password_re" name="password_re" onblur="rePwCheck()"/><br/>
	<span id="errorRePw" style="color: red;"></span>
	</div>
	
	<h3>이름</h3>
	<input type="text" name="client_name" id="name" value="${vo.client_name }" onblur="nameCheck()"  maxlength="17"/><br/>
	<span id="checkName" style="color: green;"></span>
	
	<h3>생년월일</h3>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<fmt:formatDate var="today" value="${now }" pattern="yyyy-MM-dd"/>
	<input type="date" name="client_birthday" id="birth_day" onblur="regCheck4()" value="${vo.client_birthday }" max="${today }"/><br/>
	<span id="errorBD" style="color: green;"></span>
	
	<h3>전화번호</h3>
	<input class="phone" type="text" id="phone_number" name="client_phoneNumber" value="${vo.client_phoneNumber }" maxlength="11" onblur="regCheck3()"/>
	
	
	<button class="sendMessage" id="sendMessage" onclick="sendCode()" >인증</button><br/>
	
	
	<span id="errorPhoneNumber" style="color: red;"></span><br/>
	
	<input type="text" id="inputCode" maxlength="6" size="6" placeholder="인증번호"/>
	<input type="hidden" id="code" value="${code}" >
	<input type="hidden" name="flag" id="flag" value="${flag}"/>
	<button class="sendMessage" type="button" id="sendButton" onclick="checkCode()">확인</button><br/>
	<span id="errorCode" style="color: red;"></span>
	
	
	<a onclick="joinMember()">가입하기</a>
	
	
	</form>
</body>
</html>