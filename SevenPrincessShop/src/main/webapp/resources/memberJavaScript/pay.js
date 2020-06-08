

// 동호 주소 api (내꺼에 맞게 적용했어용 수정하지 말아주세용 ㅠㅠ)
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
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
               /*  if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
 */
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
   


		//두번째 라디오 버튼을 선택한 경우
		
	// 핸드폰, 이메일 분할
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
	   



//	   카드 결제 or 핸드폰 결제 보여주거나 숨기기
	   function opt() {
		   var join = document.getElementById("join");
		   var join1 = document.getElementById("join1");
		   
		   join.style.display = 'block';
		   join1.style.display = 'none';
	   }

	   function opt2() {
		var join = document.getElementById("join");
		var join1 = document.getElementById("join1");
		
		join.style.display = 'none';
		join1.style.display = 'block';
	}
	   
//		인증번호 발송
	   function sendCode(){
	   	var phoneNumber = document.getElementById("phone_number");
	   if(phoneNumber.value !=""){
	   			alert("인증번호가 발송되었습니다.")
	   }
	   }
	   //인증번호 확인
	   function codeCheck() {
	   	var iCode = document.getElementById("inputCode");
	   	if(iCode.value != ""){
	   		alert("인증번호 확인")
	   	}
	   } 
	
	   