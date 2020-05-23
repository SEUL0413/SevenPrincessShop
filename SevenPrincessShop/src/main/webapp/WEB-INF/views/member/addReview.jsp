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

<style>
	table{
		width:700px;
		border: 2px solid #D8D8D8;
		margin-top:60px; 
		width:600px;
		border-radius: 20px
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
		
		<div id="content" class="p-4 p-md-5">
			<!-- myPage top bar 설정 -->
			<%@ include file="/WEB-INF/views/include/myTopBar.jsp"%>
			<h2>구매후기 쓰기</h2>
			<hr/>
		
			<c:set var="o" value="${order}"/> 			<!-- 주문리스트vo -->
			<c:set var="product" value="${product}"/>  <!-- 상품정보 vo -->
	
			<div style="margin-left:150px">
			
			<c:if test="${o.size()==0}">
				<h5>리뷰 작성할 주문 정보가 없습니다</h5>	
			</c:if>
			<c:forEach var="p" items="${product}" varStatus="status" > 
					<table style="width:800px">
						<tr style="background-color: #F2F2F2;height:50px">
							<th colspan="2" style="text-align: left">&nbsp;&nbsp;주문일 : ${o.get(status.index).orderList_orderDate}</th>
						</tr>
							<tr style="height:200px">
							<td style="width:400px">
								<div style="margin-left: 80px">
									<img src="${p.product_imgPath}_1.jpg"  style="width: 150px;weight:150px;"/>
								</div>
							</td>
							<td>
								<h4><a href="productInfo?product_idx=${p.product_idx}" class="aLink-myPage">${p.product_name}</a></h4>
								<ul>
									<li><span>사이즈 : ${o.get(status.index).orderList_size}</span></li>
									<li><span>색상 : ${o.get(status.index).orderList_color}</span></li>
									<li><span>수량 : ${o.get(status.index).orderList_stock} 개</span></li>
								</ul>
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<div style="margin-bottom: 30px">
									<button class="btn btn-secondary" type="button" onclick="location.href='reviewInsert?idx=${o.get(status.index).orderList_idx}'">구매후기 작성하기</button>
								</div>
							</td>
						</tr>
					</table>
			</c:forEach>
			</div>
		</div>
	</div>
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
			
</body>
</html>