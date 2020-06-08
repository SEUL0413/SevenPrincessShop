<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<h2>마이페이지</h2>
		</div>
	</div>


<!-- footer 설정 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>