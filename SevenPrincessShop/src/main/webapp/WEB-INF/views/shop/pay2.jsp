<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- jstl 사용하기위한 태그입니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<!-- css파일 링크 -->
<link rel="stylesheet" href="./resources/css/pay2.css">

<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 외부 스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberJavaScript/pay.js"></script>
<script type="text/javascript">





// 라디오 버튼 선택시 주문정보 설정   
function chk2(f) {
   // 첫번째 라디오 버튼을 선택한 경우 세션 정보 불러오기
   if(f.order[0].checked == true){
      
      var el = document.getElementsByClassName('input-text');
      el[0].value = '${nowUser.client_name}';
      el[1].value = '${nowUser.client_phoneNumber}'.substring(0,3);
      el[2].value = '${nowUser.client_phoneNumber}'.substring(3,7);
      el[3].value = '${nowUser.client_phoneNumber}'.substring(7);
      el[4].value = '${nowUser.client_email}'.split("@")[0];
      el[5].value = '${nowUser.client_email}'.split("@")[1];
      el[6].value = '${nowUser.client_addressNumber}';
      el[7].value = '${nowUser.client_address}';
      el[8].value = '${nowUser.client_detailAddress}';
   }
   // 두번째 라디오 버튼을 선택한 경우 텍스트필드 클린
   if(f.order[1].checked == true){
      
      
      var el = document.getElementsByClassName('input-text');
      for(var i=0; i<el.length; i++){

         el[i].value = '';          
   }
}
}

//바로구매 카드 결제 시 공백이 있는지 확인하고 안에 들어있는 값을 dPay3로 넘겨준다.   
function chk1() {         
   
   let name = $("#orderRec").val();
    let phone1 = $("#phone1").val();
    let phone2 = $("#phone2").val();
    let phone3 = $("#phone3").val();
    
    let email1 = $("#email1").val();
    let email2 = $("#email2").val();
    let addressNumber = $("#sample4_postcode").val();
    let address = $("#sample4_roadAddress").val();
    
   var form = document.getElementById("join1");
   var cardNum = $('input[name=cardN]').is(':checked');
   var card = document.getElementById("c1");
   var card = document.getElementById("c2");
   var card = document.getElementById("c3");
   var card = document.getElementById("c4");
   var yy = document.getElementById("YY");
   var mm = document.getElementById("MM");
   var cvc = document.getElementById("cvc");
   var cardPw = document.getElementById("cardPw");
   var options = '${selectCode}';

      if(name==null || name==""){
       alert("수령인을 입력해주세요");
     }else if(phone1==null || phone1=="" || phone2==null || phone2=="" || phone3==null || phone3==""){
       alert("연락처를 입력해주세요");
     }else if(email1==null || email1=="" || email2==null || email2==""){
       alert("이메일을 입력해주세요");
     }else if(addressNumber==null || addressNumber=="" || address==null || address==""){
       alert("배송 주소를 입력해주세요");
     }else if(cardNum == ""){
         alert("은행선택");
      }else if(card.value.length != "4"){
         alert("카드번호를 다시 입력 해주세요")
      }else if(yy.value.length != "2"){
         alert("YY를 다시 입력 해주세요");
      }else if(mm.value.length != "2"){
         alert("MM를 다시 입력 해주세요");
      }else if(cvc.value.length != "3"){
         alert("cvc를 다시 입력 해주세요");
      }else if(cardPw.value.length !="2"){
         alert("비밀번호 앞두자리를 다시 입력 해주세요")
      }else{
         alert("결제 완료");
         
         form.setAttribute("action","dPay3?orderOptions=" + options +"&address="+$("#sample4_roadAddress").val()+
               "&detailAddress="+$("#sample4_detailAddress").val()+
               "&addressNumber="+$("#sample4_postcode").val() );
         form.submit();
      }
               
}

//핸드폰 결제 인증번호 체크
var flag = 0;
function codeCheck(){
	var code = $("#code").val();
	var inputCode = $("#inputCode").val();
	if(code!=inputCode){
		flag = 0;
		alert("인증번호가 일치하지 않습니다.");
		$("#inputCode").css('border-color', 'rgb(220, 53, 69)');
	}
	else if(code==inputCode && inputCode.length!=""){
		flag = 1;
		alert("일치합니다");
		$("inputCode").css('border-color', 'green');
	}
	else{
		flag = 0;
		alert("인증번호가 일치하지 않습니다.");
		$("#inputCode").css('border-color', 'rgb(220, 53, 69)');
	}
}


//바로구매 핸드폰      
function phonePay1() {
   
      let name = $("#orderRec").val();
       let phone1 = $("#phone1").val();
       let phone2 = $("#phone2").val();
       let phone3 = $("#phone3").val();
       
       let email1 = $("#email1").val();
       let email2 = $("#email2").val();
       let addressNumber = $("#sample4_postcode").val();
       let address = $("#sample4_roadAddress").val();
    
         var phon = $('input[name=phon]').is(':checked');
       var form = document.getElementById("join");
        var phoneNumber = document.getElementById("phone_number");
         var iCode = document.getElementById("inputCode");
        var sCode = document.getElementById("sendButton");
        var options = '${selectCode}';
         
        if(name==null || name==""){
            alert("수령인을 입력해주세요");
          }else if(phone1==null || phone1=="" || phone2==null || phone2=="" || phone3==null || phone3==""){
            alert("연락처를 입력해주세요");
          }else if(email1==null || email1=="" || email2==null || email2==""){
            alert("이메일을 입력해주세요");
          }else if(addressNumber==null || addressNumber=="" || address==null || address==""){
            alert("배송 주소를 입력해주세요");
          }else if(phon == ""){
         alert("통신사를 선택해주세요")
         }else if(phoneNumber.value.length != "11"){
            alert("전화번호를 올바르게 입력해주세요")
         }else if(iCode.value.length != "6"){
            alert("인증번호를 올바르게 입력해주세요")   
         }else if(flag!=1){
        	 alert("핸드폰 인증을 완료해주세요.");
        }else{
            alert("결제완료")
            form.setAttribute("action","dPay3?orderOptions=" + options +"&address="+$("#sample4_roadAddress").val()+
                  "&detailAddress="+$("#sample4_detailAddress").val()+
                  "&addressNumber="+$("#sample4_postcode").val() );
            form.submit();
            
         }
         
      }
      
function sendCode() {
	var phoneNumber = $('#phone_number').val();
	var phon = $('input[name=phon]').is(':checked');
	 var phoneN = document.getElementById("phone_number");
	if(phon == ""){
        alert("통신사를 선택해주세요")
	}else if(phoneN.value.length != "11"){
        alert("전화번호를 올바르게 입력해주세요")
	}
	
	if(phon != ""  && phoneN.value.length == "11"){
	$.ajax({
		
		//setting
		type:"POST",
		url:"SendCode",
		data:{phoneNumber:phoneNumber},
		
		success:function(result){
			
			if(result.split("/")[0]=="noSend"){
				alert("이미 발송된 번호입니다 확인해주세요!");
				$("#code").attr("value",result.split("/")[1]);
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
}


</script>


<style>
   th{
      background-color:  #e7d6d6;
   }
   
   label{
      background-color: #faf3f3;
      border-radius: 5px
   }
   
   <!-- 테이블 스타일 설정 -->


#payr td, tr{
   border-right:none;
   border-left:none;
   border-top:none;
   border-bottom:none;

}

.orderPhone{
   width: 50px;
}
.textsize{
   width: 30px;
}
.paysize{
   width: 131px;
}
#sample4_roadAddress{
   width: 300px;
}
#sample4_detailAddress{
   width: 300px;
}

.paysize{
   width: 131px;
}

.cardtt{
width:70px;
}
.cardpass{
width: 70px;
}
.YY{
width: 55px;
}
.MM{
width: 55px;
}

#orderPhon{
   width: 50px;
}

#Numchk{
   width: 70px;
}

.paysize{
   width: 131px;
}

th{
   background-color: #e7d6d6;
}

label{
   background-color: #faf3f3;
   border-radius: 5px
}

   
</style>



</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<!-- 바로구매 주문 상품 정보 테이블 -->
 <div class="contents">
     <div style="width: 900px;margin-left: 300px;margin-top: 50px">
          <h2>주문/결제하기</h2><hr/>
         </div>
          
       <!-- 주문 결제 상단 아이콘 -->
       <div style="margin-left: 350px;margin-bottom: 100px">
          <img style="width:900px"src="./resources/images/icon/pay.png"/>
       </div>   
    
     <div style="width: 900px;margin-left: 300px;margin-top: 50px">
         <h4>주문하실 상품</h4><hr/><br/>
         <table style="width:1000px;text-align: center" class="orderTable" align="center">
            <tr style="height: 50px">
               <th colspan="2">주문 상품 정보</th> <!-- 상품 타이틀 + 선택 옵션 + 옵션변경 버튼  --> 
               <th>옵션</th>
               <th>개수</th>
               
            </tr>
            
            <!-- 주문금액 합계를 위한 변수 선언 -->
            <c:set var = "sum" value="0"/>
            <fmt:parseNumber var="sizeNum" type="number" value="${fn:length(size)}" />
            <c:forEach var="i" begin="0" end="${sizeNum-1}" step="1">
                     <tr style="height: 150px;border:1px solid #E6E6E6;border-radius: 10px" class="orderClass">
                        <!-- 1.상품 이미지 -->
                        <td id="productImg">
                           <img style="width:100px;height:100px" src="${productVO.product_imgPath}_1.jpg"/>
                        </td>
                        <!-- 2.상품 이름 -->
                        <td id="productName">
                           <strong>${productVO.product_name}</strong><br/>
                        <!--3.옵션(색상/사이즈) -->
                        </td>
                        <td id="productOption">
                           <span>${size[i]}</span> / <span>${color[i]}</span>
                           
                        </td>
                        <!--4.상품 주문개수 -->
                        <td id="productStock">
                          ${stock[i]}
                        <c:set var = "sum" value="${sum + stock[i]}"/>
                        </td>
                     </tr>
   
               </c:forEach>
         </table>
       </div>
       
   <div id="totalPrice" style="margin-left: 700px">
             <b style="font-size:30px"> 총 합계 금액  : <span id="total">${sum*productVO.product_price}원</span> </b>
    </div>
    </div>
 

            
    

   <div style="width: 900px;margin-left: 300px;margin-top: 100px">
      <h4>결제 정보</h4><hr/>
      <div style="margin-left:50px">
         <form action="" name="f" id="oderpay">
         
                   <!-- 입력방식 -->   
                    <div class="form-group row">
                      <label for="name" class="col-sm-2 col-form-label">입력방식</label>
                      <div class="col-sm-10">
                         <input type = "radio" name="order" checked="checked" onclick="chk2(this.form)">주문자와 동일&nbsp;&nbsp;
                          <input type = "radio" name="order" onclick="chk2(this.form)">직접입력<br/>
                      </div>
                    </div>
                             
                    <!-- 수령인 -->   
                    <div class="form-group row">
                      <label for="name" class="col-sm-2 col-form-label">수령인</label>
                      <div class="col-sm-10">
                        <input type="text" class="input-text form-control" value="${nowUser.client_name}" name="orderRec" id="orderRec" pattern="^[가-힣]+$" required="required" placeholder="한/영" style="width:200px">
                      </div>
                    </div>
                    
                     <!-- 수령인 연락처 -->
                    <div class="form-group row">
                         <label for="client_name" class="col-sm-2 col-form-label">수령인 연락처</label>
                         
                         <div class="row" style="margin-left: 17px">
                         
                             <div class="form-group col-xs-3">
                               <input type="text" id="phone1" value="${nowUser.client_phoneNumber}"  class="input-text form-control input-lg" name="orderPhon" class="orderPhone" pattern="^[0-9]{3}" required="required" maxlength="4" style="width:150px"/>
                           </div>
                           
                            <div class="form-group col-xs-3">
                                 <button class="btn btn-link" disabled>-</button>
                             </div>
                           
                           <div class="form-group col-xs-3" style="margin-left: 4px">
                              <input type="text" id="phone2" value="${nowUser.client_phoneNumber}"  class="input-text form-control input-lg" name="orderPhon" class="orderPhone" pattern="^[0-9]{4}" required="required" maxlength="4" style="width:150px"/>
                           </div>
                           
                            <div class="form-group col-xs-3">
                                 <button class="btn btn-link" disabled>-</button>
                             </div>
                           
                           <div class="form-group col-xs-3">
                              <input type="text" id="phone3" value="${nowUser.client_phoneNumber}"  class="input-text form-control input-lg" name="orderPhon" class="orderPhone" pattern="^[0-9]{4}" required="required" maxlength="4" style="width:150px"/>
                              </div>
                        
                       </div>
                     
                   </div>
                    
                     <!-- 이메일-->
                    <div class="form-group row">
                           <label for="client_name" class="col-sm-2 col-form-label">이메일</label>
                           <div class="row" style="margin-left: 15px">
                          
                            <div class="form-group col-xs-3">
                               <input type="text" class="input-text form-control" name="email1" id="email1" value="${nowUser.client_email}" pattern="^([\w-]+(?:\.[\w-]+)*)" required="required"  style="width:150px"/>
                            </div>
                            
                              <div class="form-group col-xs-3">
                                 <button class="btn btn-link" disabled>@</button>
                             </div>
                             
                            <div class="form-group col-xs-3">
                                 <input type="text" class="input-text form-control" name="email2" id="email2" value="${nowUser.client_email}" pattern="((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)" value="naver.com" required="required" style="width:150px" />
                             </div>
                       
                             <div class="form-group col-xs-3" style="margin-left: 30px">
                               <select id="e0" onchange="emailSet()" class="custom-select" style="width:150px">
                                        <option selected>직접입력</option>
                                       <option id="e1" value="naver.com">naver.com</option>
                                       <option id="e2" value="gmail.com">gmail.com</option>
                                       <option id="e3" value="daum.net">daum.net</option>
                             </select>
                          </div>
                          
                           </div>
                           
                    </div>
                    
                    
                    
                      <!-- 주소 + 상세주소-->
                       <div class="form-group row">
                           <label for="client_name" class="col-sm-2 col-form-label">주소</label>
                         
                         <div class="form-group row">
                            <div style="margin-left: 30px">
                               <table>
                                  <tr>
                                     <td width="160px"><input type="text" class="input-text form-control input-lg" id="sample4_postcode" value="${nowUser.client_addressNumber}" style="width:150px" placeholder="우편번호" readonly></td>
                                     <td><input type="button" class="btn btn-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:130px"></td>
                                  </tr>
                                  <tr>
                                     <td colspan="2"><input type="text" class="input-text form-control" id="sample4_roadAddress" value="${nowUser.client_address}" placeholder="도로명주소" readonly/></td>
                                  </tr>
                                  <tr>
                                     <td colspan="2"><input type="text" class="input-text form-control" id="sample4_detailAddress" value="${nowUser.client_detailAddress}" placeholder="상세주소"/></td>
                                  </tr>
                               
                               </table>
                              </div>
                        </div>
                        <div style="display: none">
                        <input type="text" id="sample4_postcode" placeholder="우편번호">
                        <input type="button" class="btn btn-myPage" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 130px"><br>
                        <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="sample4_detailAddress" placeholder="상세주소">
                    
         </div>
                     
                    </div>
                    
                    <!-- 결제방법 -->   
                    <div class="form-group row">
                      <label for="name" class="col-sm-2 col-form-label">결제방법</label>
                      <div class="col-sm-10">
                           <input type = "radio" name="card"  checked="checked" onclick="opt()">핸드폰결제&nbsp;&nbsp;
                             <input type = "radio" name="card" onclick="opt2()">카드결제
                      </div>
                    </div>
                  </form> 
               </div>
            </div>
            
            
            
            <!-- 핸드폰 결제 테이블 -->
            <div style="width: 900px;margin-left: 300px;margin-top: 50px">
               <h4>결제 방식</h4><hr/>
                  <div style="margin-left:50px">
                     <form  method="post" role="form" id="join">
                         <!-- 통신사 선택 -->   
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">통신사 선택</label>
                            <div class="col-sm-10">
                              <input id="p1" type = "radio" name="phon" value="SKT" required="required">SKT&nbsp;&nbsp;
                              <input id="p2" type = "radio" name="phon" value="LG" required="required">LG&nbsp;&nbsp;
                              <input id="p3" type = "radio" name="phon" value="KT" required="required">KT&nbsp;&nbsp;
                            </div>
                          </div>
                                   
                          <!-- 전화번호 -->   
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">전화번호</label>
                            <div class="col-sm-10">
                               <table>
                                  <tr>
                                     <td>
                                        <input class="phone form-control input-lg" type="text" id="phone_number" maxlength="11"  required="required" placeholder="- 없이 입력" pattern="^[0-9]{11}" style="width:150px"/></td>
                                    <td><button type="button" class="sendMessage btn btn-secondary" id="sendMessage" onclick="sendCode()" >인증번호 발송</button><br/></td>
                                  </tr>   
                               </table>
                            </div>
                          </div>
                          
                           <!-- 인증번호 확인 -->
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">인증번호 확인</label>
                            <div class="col-sm-10">
                            <input id="code" type="hidden" value=""/>
                               <table>
                                  <tr>
                                     <td><input type="text" class="form-control input-lg"  id="inputCode" maxlength="6" size="6" required="required" placeholder="인증번호" style="width:150px"/></td>
                                    <td><button class="sendMessage btn btn-secondary" type="button" id="sendButton" onclick="codeCheck()">인증번호 확인</button><br/></td>
                                  </tr>   
                               </table>
                            </div>
                          </div>
                          
                          <!-- 결제 버튼 -->   
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">결제</label>
                            <div class="col-sm-10">
                              <button onclick="phonePay1()" class="btn btn-secondary" value="결제하기" >결제하기</button>
                              <button type="button" class="pay-cancle btn btn-secondary" onclick="location.href='pay'">결제취소</button>
                            </div>
                          </div>
                        </form> 
                     </div>
                  </div>
                  
                  
                  <!-- 카드 결제 테이블 -->
                  <div style="width: 900px;margin-left: 300px;">
                     <!-- <h3>결제 방식</h3><hr/> -->
                        <div style="margin-left:50px">
                           <form role="form" method="post" id="join1" style="display: none;">
                               <!-- 은행선택 -->   
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">은행선택</label>
                                  <div class="col-sm-10">
                                    <input type = "radio" name="cardN" required="required">기업&nbsp;&nbsp;
                                      <input type = "radio" name="cardN" required="required">우체국&nbsp;&nbsp;
                                      <input type = "radio" name="cardN" required="required">신한&nbsp;&nbsp;
                                      <input type = "radio" name="cardN" required="required">농협&nbsp;&nbsp;
                                      <input type = "radio" name="cardN" required="required">국민&nbsp;&nbsp;
                                  </div>
                                </div>
                                
                                <!-- 카드번호 입력 -->
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">카드번호 입력</label>
                                  <div class="col-sm-10">
                                    <input type="text" value="" id="c1" name="card" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
                                    <input type="text" value="" id="c2" name="card" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
                                    <input type="text" value="" id="c3" name="card" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
                                    <input type="text" value="" id="c4" name="card" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>      
                                  </div>
                                </div>
                                
                                <!-- YYMM -->
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">YYMM</label>
                                  <div class="col-sm-10">
                                    <input type="text" value="" id="YY" name="YY" class="YY" required="required" pattern="^[0-9]{2}" maxlength="2"/>-
                                    <input type="text" value="" id="MM" name="MM" class="MM" required="required" pattern="^[0-9]{2}" maxlength="2"/>   
                                  </div>
                                </div>
                                
                                <!-- CVC -->
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">CVC</label>
                                  <div class="col-sm-10">
                                    <input type="text" value="" id="cvc"name="cvc" class="MM" required="required" pattern="^[0-9]{3}" maxlength="3"/>
                                  </div>
                                </div>
                                
                                
                                 <!-- 카드 비밀번호 -->
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">카드 비밀번호</label>
                                  <div class="col-sm-10">
                                    <input type="password" value="" id="cardPw" name="cardPw" class="cardpass" required="required" pattern="^[0-9]{2}" maxlength="2" placeholder="앞두자리"/>  ●●
                                  </div>
                                </div>
                                      
                                <!-- 결제 버튼 -->   
                                <div class="form-group row">
                                  <label for="name" class="col-sm-2 col-form-label">선택</label>
                                  <div class="col-sm-10">
                                    <button class="pay btn btn-secondary" onclick="chk1()">결제하기</button>
                                    <button type="button" class="pay-cancle btn btn-secondary" onclick="location.href='pay'">결제취소</button>
                                  </div>
                                </div>
                              </form> 
                           </div>
                        </div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
 
</body>
</html>