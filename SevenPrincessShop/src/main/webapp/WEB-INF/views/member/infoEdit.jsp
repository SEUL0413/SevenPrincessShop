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

<!-- css 위한 추가 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myPage/css/style.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>


<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myInfo.js"></script>
<!-- 주소 API 끌어올 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
	label{
		background-color: #f3e8e8;
		border-radius: 8px;
		text-align: center;
		font-family: inherit;
	}
	
	td{
		height:50px
	}

</style>

</head>
<body>

<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
		<!-- myPage 설정 -->
		<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5" >
			<!-- myPage top bar 설정 -->
			<%@ include file="/WEB-INF/views/include/myTopBar.jsp"%>
			<h2>나의 정보 수정</h2><hr/>
			<div style="width:700px;margin-left: 150px;margin-top:50px">
				
				<form id="infoEdit" action="" class="form" role="form">
				
				  <!-- 아이디 -->	
				  <div class="form-group row">
				    <label for="staticID" class="col-sm-2 col-form-label">아이디</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="id" name="client_id" value="${vo.client_id}" readonly >
				    </div>
				  </div>
				  
				   <!-- 비밀번호 -->	
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label" >비밀번호</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="pw" name="client_password" placeholder="비밀번호 변경" onblur="patternChk(this)">
				    </div>
				  </div>
				  
				  <!-- 비밀번호 확인-->
				  <div class="form-group row">
				    <label for="inputRe_Password" class="col-sm-2 col-form-label">확인</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="re_pw" name="re_password" onblur="pwEqualChk()" placeholder="비밀번호 재입력">
				    </div>
				  </div>
				  
				   <!-- 이름-->
				  <div class="form-group row">
				    <label for="client_name" class="col-sm-2 col-form-label">이름</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="name" name="client_name" value="${vo.client_name}"  pattern="^[가-힣]+$">
				   </div>
				  </div>
				  
				  
				   <!-- 이메일-->
				  <div class="form-group row">
				   		 <label for="client_name" class="col-sm-2 col-form-label">이메일</label>
				    
				    	 <div class="row" style="margin-left: 15px">
				    	 
					    	<div class="form-group col-xs-3">
					      		<input type="text" class="form-control" name="email1" id="email1" value="${vo.client_email}" style="width:150px" pattern="^([\w-]+(?:\.[\w-]+)*)">
					       </div>
					       
		     			    <div class="form-group col-xs-3">
						   		<button class="btn" disabled>@</button>
		     			   </div>
		     			   
					       <div class="form-group col-xs-3">
						   		<input type="text" class="form-control"  name="email2" id="email2" value="naver.com" style="width:150px" pattern="((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)">
		     			   </div>
		     		
		     			   <div class="form-group col-xs-3" style="margin-left: 30px">
			     			   <select id="e0" onchange="emailSet()" class="custom-select" style="width:150px">
									<option id="e1" value="naver.com" selected>naver.com</option>
									<option id="e2" value="google.com">google.com</option>
									<option id="e3" value="daum.net">daum.net</option>
									<option>직접입력</option>
							  </select>
						  </div>
						  
				   		</div>
				   		
				  </div>
				  
				   <!-- 연락처 -->
				  <div class="form-group row">
					    <label for="client_name" class="col-sm-2 col-form-label">연락처</label>
					    
					    <div class="row" style="margin-left: 17px">
					    
						     <div class="form-group col-xs-3">
							    <select id="phone1" name="phone1" class="custom-select input-lg" style="width:150px">
													<option	 value="010">010</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="011">011</option>
								</select>
							</div>
							
							 <div class="form-group col-xs-3">
						   		<button class="btn" disabled>-</button>
		     			   </div>
							
							<div class="form-group col-xs-3" style="margin-left: 4px">
								<input type="text" class="form-control input-lg" id="phone2" name="phone2" value="${vo.client_phoneNumber}" maxlength="4" pattern="^[0-9]{4}" style="width:150px"/>
							</div>
							
							 <div class="form-group col-xs-3">
						   		<button class="btn" disabled>-</button>
		     			   </div>
							
							<div class="form-group col-xs-3">
								<input type="text" class="form-control input-lg" id="phone3" name="phone3" maxlength="4" pattern="^[0-9]{4}" style="width:150px"/>
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
						    			<td width="160px"><input type="text" class="form-control input-lg" id="sample4_postcode" name="client_addressNumber" placeholder="우편번호" value= "${vo.client_addressNumber}" style="width:150px" readonly/></td>
						    			<td><input type="button" class="btn btn-myPage" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:130px"></td>
						    		</tr>
						    		<tr>
						    			<td colspan="2"><input type="text" class="form-control" id="sample4_roadAddress" name="client_address" value= "${vo.client_address}" placeholder="주소입력" style="width: 600px" readonly/></td>
						    		</tr>
						    		<tr>
						    			<td colspan="2"><input type="text" class="form-control" id="sample4_extraAddress"  name="client_detailAddress" value= "${vo.client_detailAddress}" placeholder="상세주소 입력"  style="width: 600px"/></td>
						    		</tr>
						    	
						    	</table>
					   		</div>
					   </div>
				   
				  </div>
				  
				  <div align="center">
				  	<button type="submit" class="btn btn-secondary" onclick="infoEdit()">수정하기</button>
				  	<button type="button" class="btn btn-secondary" onclick="history.back()">취소하기</button>
				  </div>
				  
				</form> 
			
			</div>
			<div style="display: none">
				<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" class="btn btn-myPage" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 130px"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
			</div>
			
		</div>
	</div>

	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>