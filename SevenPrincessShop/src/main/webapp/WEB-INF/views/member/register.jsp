<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
	#joinEmail1, #joinEmail2{display: inline;}
	#phone1, #phone2, #phone3, #joinCode{display: inline;} 
	
	#joinView .container{
		margin-left: 33%;
	}
	
	.joinForm div{
		margin-bottom: 30px;
		margin-left: 0%;
	}
	.address input{
		margin-bottom: 10px;
	}
	
	.join{margin-top: 30px; margin-bottom: 20px;}
	
	.join input{
		width: 250px;
		
	}
	.joinPhone input{
		width: 250px;
		
	}
	.joinForm input{
		height: 38px;
		margin-right: 5px;
		margin-left: 5px;
	}
	
	.join_Btn{
		height: 38px;
		vertical-align: middle;
		text-align: center;
		font: 400 13.3333px Arial;
		margin-left: 10px;
		font-family: consolas;
		font-size: 15px;
	}
	
	
</style>
<script type="text/javascript">
function goPhone2() {
	$("#phone2").focus();
}

function emailSet(){
	
	let email = $("#e0 > option:selected").val();
	if(email!="직접입력"){
		$("#joinEmail2").val(email);
	}else{
		$("#joinEmail2").val("");
		$("#joinEmail2").focus();
	}
}







function sendCode() {
	var phoneNumber = $('#phone1').val()+$('#phone2').val()+$('#phone3').val();
	
	$.ajax({
		
		//setting
		type:"POST",
		url:"joinSendCode",
		data:{phoneNumber:phoneNumber},
		
		success:function(result){
			if(result.split("/")[0]=="noSend"){
				alert("이미 발송된 번호입니다 확인해주세요!");
				$("#code").attr("value",result.split("/")[1]);
			}
			else if(result=="overlap"){
				if(confirm('중복된 전화번호입니다 계정찾기 화면으로 이동하시겠습니까?')) {
					location.href='#';
				} else {
						location.href='#';
				}
			}
			else{
				alert("전송된 인증번호를 입력하세요");
				$("#code").attr("value",result);
			}
		},
		error:function(){
			alert("서버의 오류가 발생하였습니다 문의 010-4759-8517");
		}
		
	});
}




function checkId(el) {
	var id = $("#joinId").val();
	$.ajax({
		type:"POST",
		url:"searchId",
		data:{target:id},
		
		success:function(result){
			
			if(result=="pass"){
			
				var regId = RegExp(/^[A-Za-z0-9]{8,16}$/);
				if(!regId.test(el.value)){
					$("#joinId").focus();
					$("#idE").css('color', 'rgb(220, 53, 69)');
					$("#idE").html("아이디는 영문숫자 조합 8~16 자리로 입력해주세요!");
					$("#joinId").css('border-color', 'rgb(220, 53, 69)');
				}
				
			else{
				$("#idE").html("확인");
				$("#idE").css('color', 'green');
				$("#joinId").css('border-color', 'green');
			}
				
			}
			
			else{
				$("#joinId").focus();
				$("#idE").css('color', 'rgb(220, 53, 69)');
				$("#idE").html("중복된 아이디입니다!");
				$("#joinId").css('border-color', 'rgb(220, 53, 69)');
			}
			
		},
		
		error:function(){
			alert("서버의 오류가 발생하였습니다 문의 010-4759-8517");
		}
	});
	
	
	
}

function checkPw(pw) {
	var regPw = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\,.<>\/?]).{8,16}$/);
	if(!regPw.test(pw)){
		$("#pwE").css('color', 'rgb(220, 53, 69)');
		$("#pwE").html("비밀번호는 영문,숫자,특수문자 조합 8~16 자리로 입력해주세요!");
		$("#joinPassword").css('border-color', 'rgb(220, 53, 69)');
	}
	else{
		$("#pwE").html("확인");
		$("#pwE").css('color', 'green');
		$("#joinPassword").css('border-color', 'green');
	}
}

function checkRePw(re){
	var password = $("#joinPassword").val();
	if(password!=re){
		$("#reE").css('color', 'rgb(220, 53, 69)');
		$("#reE").html("비밀번호가 일치하지 않습니다!");
		$("#reJoinPassword").css('border-color', 'rgb(220, 53, 69)');
	}
	else{
		$("#reE").html("확인");
		$("#reE").css('color', 'green');
		$("#reJoinPassword").css('border-color', 'green');
	}
}

var flag = 0;
function codeCheck(){
	var code = $("#code").val();
	var inputCode = $("#joinCode").val();
	if(code!=inputCode){
		flag = 0;
		alert("인증번호가 일치하지 않습니다.");
		$("#joinCode").css('border-color', 'rgb(220, 53, 69)');
	}
	else if(code==inputCode && inputCode.length!=""){
		flag = 1;
		alert("일치합니다");
		$("#joinCode").css('border-color', 'green');
	}
	else{
		flag = 0;
		alert("인증번호가 일치하지 않습니다.");
		$("#joinCode").css('border-color', 'rgb(220, 53, 69)');
	}
}

function birthDayCheck(day) {
	 var datatimeRegexp = /[0-9]{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])/;
	 birth_day
	if(!datatimeRegexp.test(day)){
		$("#birth_day").css('border-color', 'rgb(220, 53, 69)');
		$("#errorBD").css('color', 'rgb(220, 53, 69)');
		$("#errorBD").html("생년월일을 입력해주세요!");
	}
	else{
		$("#birth_day").css('border-color', 'green');
		$("#errorBD").css('color', 'green');
		$("#errorBD").html("확인");
	}
}

function insertMember(){
	if(flag!=1){alert("핸드폰 인증을 완료해주세요.");}
	else if($("#joinName").val()==0 ){alert("이름을 입력해주세요!"); }
	else if($("#idE").text()!="확인"){alert("아이디 양식이 잘못되었습니다.");$("#joinId").focus();}
	else if($("#pwE").text()!="확인"){alert("비밀번호 양식이 잘못되었습니다.");$("#joinPassword").focus();}
	else if($("#reE").text()!="확인"){alert("비밀번호 재입력 이 잘못되었습니다.");$("#reJoinPassword").focus();}
	else if(($("#joinEmail1").val()).length==0){alert("이벤트소식 전달 및 계정찾기에 쓰일 이메일입니다 꼭 입력해주세요.");$("#joinEmail1").focus();}
	else if($("#errorBD").text()!="확인"){alert("생년월일을 입력해주세요.");$("#birth_day").focus();}
	else if($("#sample4_postcode").val().length==0){alert("주소가 입력되지 않았습니다.");}
	else if($("#sample4_roadAddress").val().length==0){alert("주소가 입력되지 않았습니다.");}
	else if($("#sample4_extraAddress").val().length==0){alert("주소가 입력되지 않았습니다.");$("#sample4_extraAddress").focus();}
	
	else{
		var form = $("#goInsert");
		form.attr('action','insertMember');
		form.submit();
	}
	
	
	
}


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<!-- 주소 API 끌어올 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<div id="joinView">
	<div class="container joinForm">
		<form id="goInsert" class="form-signin" action="">
		  	<div class="row join">
				<h1>SevenPrincessShop에 오신 것을 환영합니다!</h1><br/>
			</div>
				<h3>회원가입 후 다양한 이벤트 소식을 받아보세요!</h3>
			
		  	<div class="row join">
		  		<input type="text" id="joinName" name="client_name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		    	<span id="nameE" style="color: #d23535;"></span>
		    </div>
		  	
		  	
		  	<div class="row join">
		    	<input type="text" id="joinId" name="client_id" class="form-control" placeholder="아이디" required="required" autofocus="autofocus" onblur="checkId(this)">
		    	<br/><span id="idE" style="color: #d23535;"></span>
		    </div>
		    
		    <div class="row join">
		    	<input type="password" id="joinPassword" name="client_password" class="form-control" placeholder="비밀번호" required="required" onblur="checkPw(this.value)">
		  		<span id="pwE" style="color: #d23535;"></span>
		  	</div>
		  	
		  	<div class="row join">
		  		<input type="password" id="reJoinPassword" class="form-control" placeholder="비밀번호 재입력" required="required" onblur="checkRePw(this.value)">
		  		<span id="reE" style="color: #d23535;"></span>
		  	</div>
		  	
		  	
		  	<div class="row join">
				<input id="joinEmail1" name="client_email" type="text" class="form-control" style="width:150px;" placeholder="이메일주소">
				&nbsp;@&nbsp;
		    	<input id="joinEmail2" type="text" class="form-control" value="naver.com" style="width:150px;">
				<select id="e0" name="email2" onchange="emailSet()" class="custom-select" style="width:150px;">
					<option id="e1" value="naver.com" selected>naver.com</option>
					<option id="e2" value="google.com">google.com</option>
					<option id="e3" value="daum.net">daum.net</option>
					<option>직접입력</option>
				</select><br/>
			</div>
			
			
			  
			<div class="row join joinPhone">	    
				<select id="phone1" name="client_phoneNumber" class="custom-select input-lg" style="width:150px" onchange="goPhone2()">
					<option	 value="010">010</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="011">011</option>
				</select>
				 &nbsp;-&nbsp; 
				<input id="phone2" name="phone2" type="text" class="form-control input-lg" maxlength="4" style="width:150px"/>
				 &nbsp;-&nbsp;							
				<input id="phone3" name="phone3" type="text" class="form-control input-lg" maxlength="4" style="width:150px"/>
				
				<button class="btn btn-primary btn-inline join_Btn" type="button" onclick="sendCode()">번호인증</button><br/>
				
			</div>	
			<div class="row join">
				<input id="code" type="hidden" value="">
				<input id="joinCode" type="text" class="form-control input-lg" maxlength="7" style="width:150px" placeholder="인증번호입력"/> 
				<button class="btn btn-primary join_Btn" type="button" onclick="codeCheck()">인증</button><br/>
			</div>
			
			
		
			<div class="row join address">		    
				<table>
					<tr>
						<td width="160px"><input type="text" class="form-control input-lg" id="sample4_postcode" name="client_addressNumber" placeholder="우편번호" style="width:150px" readonly/></td>
						<td><input type="button" class="btn btn-primary join_Btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" class="form-control" id="sample4_roadAddress" name="client_address" placeholder="주소입력" style="width: 600px" readonly/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" class="form-control" id="sample4_extraAddress"  name="client_detailAddress" placeholder="상세주소 입력"  style="width: 600px"/></td>
					</tr>
					
				
				</table>
					 <div style="display: none">
                     <input type="text" id="sample4_postcode" placeholder="우편번호">
                     <input type="button" class="btn btn-myPage" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 130px"><br>
                     <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                     <span id="guide" style="color:#999;display:none"></span>
                     <input type="text" id="sample4_extraAddress" placeholder="참고항목">
       			  </div>
			</div> 
			
			
			<div class="row" style="margin-bottom: 5px;">
				<h6 style="font-weight: bold;">&nbsp;생년월일</h6>
			</div>
			
			
			<div class="row join" style="margin-top: 1px;">
				<input type="date" name="client_birthday" id="birth_day" max="${today}" onblur="birthDayCheck(this.value)"/><br/>
				<span id="errorBD" style="color: green;"></span>
			</div>
					  
				   		
		  	
		    <div class="row join">
			    <button class="btn btn-primary btn-inline join_Btn" type="button" onclick="insertMember()">가입하기</button>
			    <button class="btn btn-primary btn-inline join_Btn" type="button" onclick="history.back()">돌아가기</button>
		    </div>
		    <p class="mt-5 mb-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">© Develop by SPS Team</font></font></p>
			
		</form>
	</div>
</div>
</body>
</html>