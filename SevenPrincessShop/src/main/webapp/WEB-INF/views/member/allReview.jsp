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

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js">
</script>


<style type="text/css">

	span{
		font-size: 20px;
		color:orange;
	}
</style>


</head>
<body>
	<input id="re" name="re" type="hidden" value="0"/>
	<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
	<!-- myPage 설정 -->
	<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5">
			<!-- myPage top bar 설정 -->
			<%@ include file="/WEB-INF/views/include/myTopBar.jsp"%>
			<h2>내가 쓴 구매후기</h2><hr/><br/>
			
			<c:set var="p" value="${products}"/>
			
			<div align="center">
			
			<c:if test="${reviews.size()==0}">
				<h5>작성된 리뷰가 없습니다.</h5>
			</c:if>
			
			<c:if test="${reviews.size()!=0}">
				<c:forEach var="r" items="${reviews}" varStatus="status">
					<table style="text-align: center;border:2px solid #D8D8D8;width: 600px">
						<tr style="height:60px;border:2px solid #D8D8D8;width: 600px">
							<th width="100px">
								주문번호 
								<a href="orderContentView?idx=${r.review_orderList_idx}" class="aLink-myPage">
									${r.review_orderList_idx+1000000}
								</a>
							</th>
							<th>
								<!-- 제품 사진 -->
								<img src="${p.get(status.index).product_imgPath}_1.jpg" width="45px" height="45px"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!--제품정보/별점 -->
								<a href="productInfo?product_idx=${r.review_product_idx}" class="aLink-myPage"><b style="font-size: 18px;font-family: inherit">${p.get(status.index).product_name}</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${r.review_productGrade==1}">
										<span>★</span>
									</c:when>
									<c:when test="${r.review_productGrade==2}">
										<span>★★</span>
									</c:when>
									<c:when test="${r.review_productGrade==3}">
										<span>★★★</span>
									</c:when>
									<c:when test="${r.review_productGrade==4}">
										<span>★★★★</span>
									</c:when>
									<c:when test="${r.review_productGrade==5}">
										<span>★★★★★</span>
									</c:when>
								</c:choose>
							</th>  
						</tr>
						<tr style="height:100px">
							<!-- 내용/사진 -->
							<td colspan="2">
								<b>작성일 : ${r.review_writeDate}</b>   
								
								<br/><br/>
								${r.review_content}<br/><br/>
								
								<!-- 이미지 등록을 한 경우에만 이미지 출력 -->
								<c:if test="${!empty r.review_imgPath}"> 
									<img width="400px" height="300px" src="${pageContext.request.contextPath}/resources/images/reviewImages/${r.review_imgPath}" alt="이미지 파일을 찾을 수 없습니다."/>
								</c:if><br/><br/>
							</td>
						</tr>
					</table><br/><br/>
				</c:forEach>
			</c:if>
		</div>
	  </div>
	</div>
	
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
	
	
</body>
</html>