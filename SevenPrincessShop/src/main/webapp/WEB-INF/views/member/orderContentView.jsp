<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jstl 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	
	<c:set var="o" value="${orderVO}"/>
	<c:set var="p" value="${productVO}"/>
	
	<h1>주문 상세</h1>
 	주문일 : ${o.orderList_orderDate} /  주문번호 : ${o.orderList_idx+ 1000000}
 	<hr/>
 	<table width="800px" style="border:1px solid black">
 		<tr>
 			<td>
 				<img src="${p.product_imgPath}.jpg"/>
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
							<br/><button type="button" onclick="location.href='reviewInsert?idx=${list1.orderList_idx}'">구매후기 쓰기</button>
						</c:if>
						<c:if test="${count == 1}">
							<br/><button type="button" onclick="location.href='allReview'">내 리뷰보기</button>
						</c:if>
					
					</c:if>
					<c:if test="${o.orderList_status eq 'payOK'}">
						<c:out value="결제완료"/>
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
 			<td>${nowUser.client_address} ${nowUser.client_detailAddress}</td>
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
 	<button type="button" onclick="history.back()">주문목록 돌아가기</button>
 	<br/>
</body>
</html>