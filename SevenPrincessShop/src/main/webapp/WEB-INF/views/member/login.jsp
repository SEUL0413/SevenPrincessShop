<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<style type="text/css">
	#qawrqwi{
	border-color: #d9534f;
	}
</style>
<script type="text/javascript">
	function goLogin() {
		var id = $("#inputId").val();
		var password = $("#inputPassword").val();

		$.ajax({
			//setting
			type :"POST",
			url: "goLogin",
			data: {id:id, password:password},
			
			//success
			success: function(result) {
				if(result == "notMember"){
					$('#idE').html("일치하는 아이디가 존재하지 않습니다.");
					$('#inputId').css('border-color', '#d9534f')
				}
				else if(result == "discord"){
					$('#pwE').html("비밀번호가 일치하지 않습니다.");
					$('#inputPassword').css('border-color', '#d9534f');
				}
				
				else{
					alert("환영합니다!");
					location.href='/controller/';
				}
				
			},
			
			
			error: function (jqXHR, textStatus, errorThrown) {
				alert("서버의 오류가 발생하였습니다 문의 010-4759-8517");
			}
			
			
		});
	}
	
	
	function reSelect() {
		$('#inputId').css('border-color', '#ced4da');
		$('#idE').html('');
		$('#inputId').val('');
	}
	function reSelect_p() {
		$('#inputPassword').css('border-color', '#ced4da');
		$('#pwE').html('');
		$('#inputPassword').val('');
	}
</script>


</head>
<body class="text-center">
<div>
	<a href="/controller"><img style="width: 500px;" height="450px;" src="./resources/images/pageImages/LoginLogo3.png" alt="logo-imges" data-at2x="./resources/images/pageImages/LoginLogo3.png"></a>
</div>
	<div class="loginForm">
		<form id="goLogin" class="form-signin">
		    <input type="text" id="inputId" class="form-control" placeholder="아이디" required="required" autofocus="autofocus" onclick="reSelect()"/>
		    <span id="idE" style="color: #d23535;"></span>
		    <input type="password" id="inputPassword" class="form-control" placeholder="암호" required="required" onclick="reSelect_p()"/>
		  	<span id="pwE" style="color: #d23535;"></span>
		    <button class="btn btn-lg btn-primary btn-block loginBtn" type="button" onclick="goLogin()">로그인</button>
		    <button class="btn btn-lg btn-primary btn-inline ch_Btn" type="button" onclick="location.href='goJoinMember'">회원가입</button>
		    <button class="btn btn-lg btn-primary btn-inline ch_Btn" type="button" onclick="location.href='findIdPw'">계정 찾기</button>
		    <p class="mt-5 mb-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">© Develop by SPS Team</font></font></p>
		</form>
	</div>
</body>
</html>





