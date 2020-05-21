<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<!-- jstl 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

</head>
<body>
	
	<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
	<!-- myPage 설정 -->
	<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5">
			<h2>구매후기 쓰기</h2>
			<hr/>
		
			<c:set var="o" value="${order}"/> 			<!-- 주문리스트vo -->
			<c:set var="product" value="${product}"/>  <!-- 상품정보 vo -->
	
			<c:forEach var="p" items="${product}" varStatus="status" > 
					<div style="margin-top:60px; width:600px; border:1px solid black">
						<img src="${p.product_imgPath}.jpg"  style="width: 100%; max-width: 100px; vertical-align: middle"/>
						<strong>${p.product_name}</strong>
						<ul>
							<li><span>사이즈 : ${o.get(status.index).orderList_size}</span></li>
							<li><span>색상 : ${o.get(status.index).orderList_color}</span></li>
							<li><span>수량 : ${o.get(status.index).orderList_stock} 개</span></li>
						</ul>
						<div align="right"><button class="btn btn-secondary" type="button" onclick="location.href='reviewInsert?idx=${o.get(status.index).orderList_idx}'">구매후기 작성하기</button></div>
					</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
			
</body>
</html>