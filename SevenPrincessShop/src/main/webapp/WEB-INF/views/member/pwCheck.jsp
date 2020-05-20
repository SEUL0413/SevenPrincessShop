<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	//비밀번호 에러 처리
	let error = '${error}';
	
	if(error!="" && error!=null){
		alert(error);
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원정보 수정</h2>
	
	<form name="infoEdit" action="editChk">
		
		<input type="hidden" id="count" name="count" value="${count}"/>
		<div>
			<b>보안을 위해 비밀번호를 확인합니다.</b><br/>
			<b>현재 로그인 비밀번호를 입력해주세요.</b><br/>
			<input type="password" name="editPW" required=""/>
			<button type="sumbit">확인</button>
			<button onclick="history.back()">취소</button>
		</div>
	</form>
	
	
	
</body>
</html>