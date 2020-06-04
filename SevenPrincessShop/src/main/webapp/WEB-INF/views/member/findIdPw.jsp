<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
</head>
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findIdPw.css"/>
<body>
<!-- header / nav 설정 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	
<div class='pageTitle'><h1 style="font-family: d2coding;margin-bottom: 5%;margin-left:18%;margin-top: 5% ">아이디/패스워드 찾기</h1></div>
<div align="center" style="margin-top: 5%">

<form action="findIdResult" name="findIdResult" method="post" accept-charset="utf-8">
<table class='tbl'>
	<tbody>
		<tr style="height: 45px"><td colspan="2" style="text-align: center;background-color: #A4A4A4"><h4>아이디 찾기</h4></td></tr>
		<tr>
			<th style="font-size: 15px;">이름</th>
			<td><input class="form-control" type="text" id="client_name" name="client_name" style="width:80%" required></td>
		</tr>
		<tr>
			<th style="font-size: 15px;">연락처</th>
			<td><input class="form-control" type='text' id="client_phoneNumber" name="client_phoneNumber" style="width:80%" placeholder="숫자만 입력" required> 
			<!-- onblur='fnSetTel($(this))' -->
		</tr>
	</tbody>
</table>

<div class='txtC mt20 mb50' style="margin-bottom: 5%;margin-top: 2%">
	<input type='submit' class='btn btn-blue btn-lg mr20' value='아이디 찾기'>
</div>
</form>





<form action="findPwResult" name="findPwResult" method="post" accept-charset="utf-8">
<table class='tbl'>
	<tbody>
		<tr style="height: 45px"><td colspan="2" style="text-align: center;background-color: #A4A4A4" ><h4>비밀번호 찾기</h4></td></tr>
		<tr>
			<th style="font-size: 15px;">아이디</th>
			<td><input type="text" class="form-control" id="client_id" name="client_id" style="width:80%" required></td>
		</tr>
		<tr>
			<th style="font-size: 15px;">이메일</th>
			<td>
				<input type="text" class="form-control" id="client_email" style="width:80%" name="client_email" required>
			</td>
		</tr>
	</tbody>
</table>



<div class='txtC mt20 mb50' style="margin-bottom: 5%;margin-top:2%">
	<input type='submit' class='btn btn-blue btn-lg mr20' value='비밀번호 찾기'>
</div>
</form>		
</div>


<!-- 
	<form action="findIdResult" method="post">
		<h3>아이디 찾기</h3>	
			
				이메일<input type="text" id="client_email" name="client_email" required>
				이름<input type="text" id="client_name" name="client_name" required>
				전화번호<input type="text" id="client_phoneNumber" name="client_phoneNumber" required>
				<input type="submit" value="아이디찾기">
	</form> -->
	
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>