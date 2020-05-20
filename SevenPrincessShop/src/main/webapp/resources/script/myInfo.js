	
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
		let address = $("#id").val();
		
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
	


	
	
	