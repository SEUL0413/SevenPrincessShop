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
</head>
<body>

	<p>select문 예시</p>
	가입한 회원 idx : ${vo.client_idx}<br/>
	가입한 회원 id : ${vo.client_id}<br/>
	가입한 회원 pw : ${vo.client_password}<br/>
	가입한 회원 name : ${vo.client_name}<br/>
	가입한 회원 birthday : ${vo.client_birthday}<br/>
	가입한 회원 address : ${vo.client_address}<br/>
	가입한 회원 phoneNum : ${vo.client_phoneNumber}<br/>
	가입한 회원 registerD : ${vo.client_registerDate}<br/>
	
</body>
</html>