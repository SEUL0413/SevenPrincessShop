	
	//바로 실행 코드
	$(function(){
		//휴대폰 010 / 2887 / 4951 식으로 3단 분리
		let phone2 = $("#phone2").val();
		
		$("#phone1").val(phone2.substring(0,3));
		$("#phone2").attr("value",phone2.substring(3,7));
		$("#phone3").attr("value",phone2.substring(7));
		
		//이메일 부분 세팅
		let email = $("#email1").val();
		$("#email1").attr("value",email.split("@")[0]);
		$("#email2").attr("value",email.split("@")[1]);
	});
	
	//이메일 select태그에 change 발생시 text에 적용해줄 메서드
	function emailSet(){
		
		let email = $("#e0 > option:selected").val();
		if(email!="직접입력"){
			$("#email2").val(email);
		}else{
			$("#email2").val("");
		}
	}
	
	//데이터 null값 체크후 submit
	function infoEdit(){
		let name = $("#name").val();
		let phone2 = $("#phone2").val();
		let phone3 = $("#phone3").val();
		
		let email1 = $("#email1").val();
		let email2 = $("#email2").val();
		let address = $("#sample4_roadAddress").val();
		
		let form = $("#infoEdit");
		
		if(name==null || name==""){
			alert("이름을 입력해주세요");
		}else if(phone2==null || phone2=="" || phone3==null || phone3==""){
			alert("연락처를 입력해주세요");
		}else if(email1==null || email1=="" || email2==null || email2==""){
			alert("이메일을 입력해주세요");
		}else if(address==null || address==""){
			alert("주소를 입력해주세요");
		}else{
			alert("회원가입 수정이 완료되었습니다!");
			form.attr("action", "updateMember");
			form.submit();
		}
	}
	
	//비밀번호 => 입력과 재입력 항목 일치 체크
	function pwEqualChk(){
		
		let pw = $("#pw").val();
		let re_pw = $("#re_pw");
		
		if(pw!=re_pw.val()){
			alert("비밀번호가 일치하지 않습니다")
			re_pw.val("");
			return false;
		}
		
	}
	
	//비밀번호 정규식 패턴 체크
	function patternChk(obj){
		pattern = new RegExp(
		"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,12}$");
		
		if (!pattern.test(obj.value.trim()) && obj.value.trim().len != 0) {
			alert("비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상 12자 이하로 입력해주세요");
			obj.value = "";
			return false;
		}
		return true;
	}
	
	//주소+우편번호 API 
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
	
	

	
	


	
	
	