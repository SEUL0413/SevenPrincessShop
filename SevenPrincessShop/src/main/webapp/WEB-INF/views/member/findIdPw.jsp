<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findIdPw.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
</head>
<body>
<div class='pageTitle'>아이디/패스워드 찾기</div>

<div class='pageSubTitle'>아이디 찾기</div>
<form action="findIdResult" name="findIdResult" method="post" accept-charset="utf-8">
<table class='tbl'>
	<tbody>
		<tr>
			<th>이름</th>
			<td><input type="text" id="client_name" name="client_name" required></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type='text' id="client_phoneNumber" name="client_phoneNumber" placeholder="숫자만 입력" required> 
			<span class='helpText ml10'>숫자만 입력하세요</span></td>
			<!-- onblur='fnSetTel($(this))' -->
		</tr>
	</tbody>
</table>

<div class='txtC mt20 mb50'>
	<input type='submit' class='btn btn-blue btn-lg mr20' value='아이디 찾기'>
</div>
</form>





<div class='pageSubTitle'>비밀번호 찾기</div>
<form action="findPwResult" name="findPwResult" method="post" accept-charset="utf-8">
<table class='tbl'>
	<tbody>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="client_id" name="client_id" required></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="client_email" name="client_email" required>
			</td>
		</tr>
	</tbody>
</table>



<div class='txtC mt20 mb50'>
	<input type='submit' class='btn btn-blue btn-lg mr20' value='비밀번호 찾기'>
</div>
</form>		


<!-- 
	<form action="findIdResult" method="post">
		<h3>아이디 찾기</h3>	
			
				이메일<input type="text" id="client_email" name="client_email" required>
				이름<input type="text" id="client_name" name="client_name" required>
				전화번호<input type="text" id="client_phoneNumber" name="client_phoneNumber" required>
				<input type="submit" value="아이디찾기">
	</form> -->
</body>
</html>