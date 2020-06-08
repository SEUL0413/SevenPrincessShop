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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>


<!-- jstl 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myOrder.js"></script>

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
			<c:set var="o" value="${orderVO}"/>
			<c:set var="p" value="${productVO}"/>
			
			<h1>주문 상세</h1>
		 	<b>주문일 : ${o.orderList_orderDate} /  주문번호 : ${o.orderList_idx+ 1000000}</b>
		 	<hr/>
		 	<table  border="2" bordercolor="#D8D8D8" style="text-align: center" width="800px" style="border:1px solid black">
		 		<tr style="height:250px">
		 			<td>
		 				<img width="200" height="200" src="${p.product_imgPath}_1.jpg"/>
		 		 	</td>
		 		 	<td align="center">
		 		 		<h3>${p.product_name}</h3>
		 		 		${o.orderList_color} , ${o.orderList_size} SIZE<br/>
		 		 		/ ${o.orderList_stock}개
					</td>
					<!-- 7.주문 상태 -->
					<td>
						<h3>
							<c:if test="${o.orderList_status eq 'send'}">
								<c:out value="배송완료"/>
								
								<!-- 리뷰 작성 여부 체크  -->
								<c:if test="${count == 0}">
									<br/><button type="button" onclick="location.href='reviewInsert?idx=${o.orderList_idx}'" class="btn btn-secondary">리뷰 쓰기</button>
								</c:if>
								<c:if test="${count == 1}">
									<br/><button type="button" onclick="location.href='allReview'" class="btn btn-secondary">내 리뷰보기</button>
								</c:if>
							
							</c:if>
							<c:if test="${o.orderList_status eq 'payOK'}">
								<c:out value="결제완료"/><br/>
								<button type="button"  onclick="orderCheck(this.value)" value="${o.orderList_idx}" class="btn btn-secondary">주문 취소</button>
							</c:if>
							<c:if test="${o.orderList_status eq 'cxl'}">
								<c:out value="주문취소"/>
							</c:if>
						</h3>
				</tr>
		 	</table>
		 	
		 	<br/><br/><h3>받는사람 정보</h3>
		 	<hr/>
		 	<table>
		 		<tr>
		 			<td width="100">받는사람</td>
		 			<td>${nowUser.client_name}</td>
		 		</tr>
		 		<tr>
		 			<td>연락처</td>
		 			<td>${nowUser.client_phoneNumber}</td>
		 		</tr>
		 		<tr>
		 			<td>받는주소</td>
		 			<td>${o.orderList_address} ${o.orderList_detailAddress}</td>
		 		</tr>
		 	</table>
		 	<hr/>
		 	
		 	<br/><br/><h3>결제정보</h3>
		 	<hr/>
		 	<table>
		 		<tr>
		 			<td width="130">총 상품 가격</td>
		 			<td>
		 				<fmt:formatNumber value="${o.orderList_stock*p.product_price}" pattern="#,###" />원
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>배송비</td>
		 			<td>
						<c:set var ="delivery" value="2500"/>
						<c:if test="${o.orderList_stock*p.product_price>=80000 || o.orderList_stock*p.product_price==0}"> 
							<c:set var="delivery" value="0"/>
						</c:if>
						<fmt:formatNumber value="${delivery}" pattern="#,###" />원<br/>
					</td>
		 		</tr>
		 		<tr>
		 			<td>총 결제금액</td>
		 			<td>
		 				<h2><fmt:formatNumber value="${delivery+o.orderList_stock*p.product_price}" pattern="#,###" />원</h2>
		 			</td>
		 		</tr>
		 	</table>
		 	<hr/><br/>
		 	<button type="button" class="btn btn-secondary" onclick="history.back()">주문목록 돌아가기</button>
		 	<br/>
		 </div>
		</div>
		<!-- footer 설정 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>