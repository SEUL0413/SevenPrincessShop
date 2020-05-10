<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 로그인 페이지 입니다.</h1>
	<p>로그인 테스를 하겠습니다<br/>Test 내용 매퍼맵핑 셋팅/세션 vo 객체 저장</p>
	<form method="post" action="loginCheck">
		아디 : <input type="text" name="client_id">
		비번 : <input type="text" name="client_pw">
		<input type="submit" value="제출">
	</form>
</body>
</html>