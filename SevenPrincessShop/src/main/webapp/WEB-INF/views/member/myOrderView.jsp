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
<script type="text/javascript">
	function content(obj){
	 	location.href="orderContentView?idx="+$(obj).attr("id");
	}
	
	function orderCheck(idx){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="updateCxl?idx="+idx;
		}
	}
	
</script>
</head>
<body>

	<h2>주문목록 / 배송조회</h2>
	<hr/>
	
	<c:set var="list1" value="${listO}"/>  <!-- 주문리스트vo -->
	<c:set var="list2" value="${listP}"/>  <!-- 상품정보 vo -->
	<c:set var="counts" value="${counts}"/>  <!-- 리뷰가 작성된 글인지 판단할 데이터(count) 리스트 -->
	
	<form>
		<c:forEach var = "list1" items="${list1}" varStatus="status">
			<table border="1" width="800" cellpadding="5" cellspacing="0">
					<tr>
						<!-- 1.주문일 -->
						<th align="left" colspan="2">
							${list1.orderList_orderDate}
						</th>  
						<!-- 2.결제금액 -->
						<th align="right">
							<a href="#" onclick="content(this)" id="${status.current.orderList_idx}">
								<span><fmt:formatNumber value="${list1.orderList_stock*list2.get(status.index).product_price}" pattern="#,###" />원 ></span>
							</a>
						</th>
					</tr>
					<tr>
						<!-- 3.상품 이미지 -->
						<td>
							 <img src="${list2.get(status.index).product_imgPath}.jpg"/>
						</td>
						<!-- 4~6. 상품 이름 / 상품 옵션 /수량 -->
						<td>
							 <h3>${list2.get(status.index).product_name}</h3>
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
										<br/><button type="button" onclick="location.href='reviewInsert?idx=${list1.orderList_idx}'">구매후기 쓰기</button>
									</c:if>
									<c:if test="${data == 1}">
										<br/><button type="button" onclick="location.href='allReview'">내 리뷰보기</button>
									</c:if>
									
								</c:if>
								<c:if test="${list1.orderList_status eq 'payOK'}">
									<!-- 주문상태가 '결제완료(payOK)' 상태일 경우엔 주문취소 버튼 삽입 -->
									<c:out value="결제완료"/><br/>
									<button type="button" onclick="orderCheck(this.value)" value="${list1.orderList_idx}">주문 취소하기</button>
								</c:if>
								<c:if test="${list1.orderList_status eq 'cxl'}">
									<c:out value="주문취소"/>
								</c:if>
							</h3>
						</td>
					</tr>
				</table><br/>
			</c:forEach>
			
	</form>
</body>
</html>