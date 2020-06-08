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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
			<h2>주문목록 조회</h2>
			<hr/><br/>
			
			<c:set var="list1" value="${listO}"/>  <!-- 주문리스트vo -->
			<c:set var="list2" value="${listP}"/>  <!-- 상품정보 vo -->
			<c:set var="counts" value="${counts}"/>  <!-- 리뷰가 작성된 글인지 판단할 데이터(count) 리스트 -->
			
			<form>
			
			<c:if test="${list1.size()==0}">
				<h5 align="center">주문 목록이 없습니다.</h5>
			</c:if>
			
			<c:if test="${list1.size()!=0}">
				<c:forEach var = "list1" items="${list1}" varStatus="status"> 
					<table align="center" style="width:80%;border:2; bordercolor:#D8D8D8;text-align: center">
							<tr style="background-color: #F2F2F2;height:50px">
								<!-- 1.주문일 -->
								<th colspan="2" style="text-align: left">
									<span style="margin-left: 20px">주문일&nbsp; : &nbsp;${list1.orderList_orderDate}</span>
								</th>  
								<!-- 2.결제금액 -->
								<th>
									<a href="#" class="aLink-myPage" onclick="content(this)" id="${status.current.orderList_idx}">
										<span><fmt:formatNumber value="${list1.orderList_stock*list2.get(status.index).product_price}" pattern="#,###" />원 ></span>
									</a>
								</th>
							</tr>
							
							<tr style="height:250px">
								<!-- 3.상품 이미지 -->
								<td>
									 <img width="200" height="200" src="${list2.get(status.index).product_imgPath}_1.jpg"/>
								</td>
								<!-- 4~6. 상품 이름 / 상품 옵션 /수량 -->
								<td>
									 <h3><a href="productInfo?product_idx=${list1.orderList_product_idx}" class="aLink-myPage">${list2.get(status.index).product_name}</a></h3>
									 <span>${list1.orderList_color}</span> / 
									 <span>${list1.orderList_size}</span> SIZE /
									 <span>${list1.orderList_stock}개</span>
								</td>
								<!-- 7.주문 상태 -->
								<td>
									<h3>
										<c:if test="${list1.orderList_status eq 'send'}">
											<c:out value="배송완료"/>
											
											<!-- 리뷰 테이블에 주문번호가 없는 항목일 경우(count==0) 리뷰 미작성 상태 => "구매후기 쓰기" 버튼 삽입 -->
											<c:set var="data" value="${counts.get(status.index)}"/>
											<c:if test="${data == 0}">
												<br/><button type="button" class="btn btn-secondary" onclick="location.href='reviewInsert?idx=${list1.orderList_idx}'">리뷰 쓰기</button>
											</c:if>
											<c:if test="${data == 1}">
												<br/><button type="button" class="btn btn-secondary" onclick="location.href='allReview'">내 리뷰 보기</button>
											</c:if>
											
										</c:if>
										<c:if test="${list1.orderList_status eq 'payOK'}">
											<!-- 주문상태가 '결제완료(payOK)' 상태일 경우엔 주문취소 버튼 삽입 -->
											<c:out value="결제완료"/><br/>
											<button type="button" class="btn btn-secondary" onclick="orderCheck(this.value)" value="${list1.orderList_idx}">주문 취소</button>
										</c:if>
										<c:if test="${list1.orderList_status eq 'cxl'}">
											<c:out value="주문취소"/>
										</c:if>
									</h3>
								</td>
							</tr>
						</table><br/>
					</c:forEach>
				</c:if>
			</form>
		</div>
	</div>
	
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		
</body>
</html>