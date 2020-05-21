<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 부트스트랩 사용하기 위한 코드 -->   
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 위한 추가 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myPage/css/style.css">

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myInfo.js"></script>

<script type="text/javascript">
	//회원정보 삭제 
	let error = '${error}';
	let con = '${confirm}';
	
	//error가 들어왔을때 처리
	if(error!="" && error!=null){
		alert(error);
	}
	
	//confirm이 들어왔을때 처리
	if(con!="" && con!=null){
		
		let result = confirm(con);
		if(result){
			location.href="deleteMember";
		}
	}
</script>
</head>
<body>

<!-- 입력이 안됐을때 처리  => 입력해주세요 alert -->
<!-- vo에서 내 정보 가져와서 세팅 -->
<!-- controller에서 xml 파일 쿼리 연결해서 delete-->
<!-- 회원 탈퇴 완료되었습니다 alert -->

	<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
	<!-- myPage 설정 -->
	<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5">
			<h2>회원 탈퇴</h2><hr/><br/>
			<form action="delChk">
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${nowUser.client_id}" readonly/></td>
				</tr>	
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required/></td>
				</tr>
		  		<tr>
		  			<td colspan="2" align="center"> 
						<button type="submit" class="btn btn-secondary">탈퇴하기</button>
						<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
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