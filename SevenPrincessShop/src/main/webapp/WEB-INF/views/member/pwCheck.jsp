<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	//비밀번호 에러 처리
	let error = '${error}';
	
	if(error!="" && error!=null){
		alert(error);
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 위한 추가 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myPage/css/style.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

</head>
<body>

	<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
	<!-- myPage 설정 -->
	<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5">
			<!-- myPage top bar 설정 -->
			<%@ include file="/WEB-INF/views/include/myTopBar.jsp"%>

			<h2>회원정보 수정</h2><hr/>
			
			<form name="infoEdit" action="editChk">
				<input type="hidden" id="count" name="count" value="${count}"/><br/>
			
				<table style="text-align: center;margin-left:150px;margin-top:30px; background-color:#F2F2F2;width:450px;height:250px;border-radius: 10px">
				
					<tr style="background-color: #676767" height="40px"><td></td></tr>
					<tr height="120px">
						<td>
							<h5>보안을 위해 비밀번호를 확인합니다.</h5>
							<h5>현재 로그인 비밀번호를 입력해주세요.</h5>
						</td>
					</tr>
					<tr>
						<td>
							 <div class="col-sm-10" style="margin-left:100px">
				     			 <input type="password" class="form-control" name="editPW" style="width:200px" placeholder="비밀번호" required>
				   			 </div>
						</td>
					</tr>
					<tr height="100px">
						<td>
							 <button type="submit"  class="btn btn-secondary">확인</button>
							<button class="btn btn-secondary" onclick="history.back()">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>