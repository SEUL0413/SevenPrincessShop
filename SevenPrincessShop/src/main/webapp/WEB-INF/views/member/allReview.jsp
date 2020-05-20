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
	
	$(function(){
	
	});

</script>

</head>
<body>

	<h2>내가 쓴 구매후기</h2>
	
	<c:set var="p" value="${products}"/>
	
	<c:forEach var="r" items="${reviews}" varStatus="status">
		<table border="1" width="400" cellpadding="5" cellspacing="0">
						<tr>
							<!--제품정보/별점 -->
							<th>${p.get(status.index).product_name}</th>  
						</tr>
						<tr>
							<!-- 내용/사진 -->
							<td>
								작성일 : ${r.review_writeDate}   
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
								<br/>
								${r.review_content}><br/>
								
								<!-- 이미지 등록을 한 경우에만 이미지 출력 -->
								<c:if test="${!empty r.review_imgPath}"> 
									<img width="200" height="200" src="${pageContext.request.contextPath}/resources/images/reviewImages/${r.review_imgPath}" alt="이미지 파일을 찾을 수 없습니다."/>
								</c:if>
							</td>
						</tr>
					</table><br/>
	</c:forEach>
	
	
</body>
</html>