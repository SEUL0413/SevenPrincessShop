<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head></head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myInfo.js"></script>

</head>
<body>
<!-- 입력이 안됐을때 처리  + 정규식!-->
<!-- vo에서 내 정보 가져와서 세팅 -->
<!-- controller에서 xml 파일 쿼리 연결해서 update-->
<!-- 수정이 완료되었습니다 alert -->

<!-- db 이메일 추가 / 정규식 넣기 -->
<h2>나의 정보 수정</h2>
<form id="infoEdit" action="">
	<table>
		<tr>
			<td><strong>아이디</strong></td>
			<td><input type="text" id="id" name="client_id" value="${vo.client_id}" readonly></td>
		</tr>
		<tr>
			<td><strong>새 비밀번호</strong></td>
			<td><input type="password" id="pw" name="client_password" onblur="regCheck2()"></td>
		</tr>
		<tr>
			<td><strong>비밀번호 확인</strong></td>
			<td><input type="password" id="re_pw" name="re_password"></td>
		</tr>
		<tr>
			<td><strong>이름</strong></td>
			<td><input type="text" id="name" name="client_name" value="${vo.client_name}"  ></td>
		</tr>
		<tr>
			<td><strong>연락처</strong></td>
			<td>
				<div id="phone">
					<select id="phone1" name="phone1">
						<option	 value="010">010</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="011">011</option>
					</select>
					-
					<input type="text" id="phone2" name="phone2" value="${vo.client_phoneNumber}" maxlength="4" style="width:50px"/>
					-
					<input type="text" id="phone3" name="phone3" maxlength="4" style="width:50px"/>
				</div>
			</td>
		</tr>
		<tr>
			<td><strong>이메일</strong></td>
			<td>
				<input type="text" name="email1" id="email1" value="${vo.client_email}"/>
				@
				<input type="text" name="email2" id="email2" value="naver.com"/>
				<select id="e0" onchange="emailSet()">
					<option id="e1" value="naver.com" selected>naver.com</option>
					<option id="e2" value="google.com">google.com</option>
					<option id="e3" value="daum.net">daum.net</option>
					<option>직접입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<!-- 주소 API -->
			<td><strong>주소</strong></td>
			<td><input type="text" id="address" name="client_address" value= "${vo.client_address}" name="address"></td>
		</tr>
		<tr>
  			<td colspan="2" align="center"> 
				<button type="submit" onclick="infoEdit()">수정하기</button>
				<button type="button" onclick="history.back()">취소</button>
  			</td>
  		</tr>

	</table>
</form>





</body>
</html>