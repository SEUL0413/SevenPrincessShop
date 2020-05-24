<%@page import="jason.stdlib.include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showCategory</title>

<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">

</head>
<body>

	<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<h1>여기는 카테고리 쇼 페이지입니다.</h1>
	<h1>넘어온 카테고리 넘버 : ${categoryNum}</h1>
	
	<!-- 카테고리 넘버가 1이면 카테고리 넘버가 1인 모든 제품을 띄워주고 2이면 2인 제품들 3이면 3인 제품들을 띄워준다. -->
	<div class="contentArea">
		<div class="container">
			<div class="row">
				<!-- categoryNum 별 데이터를 불러와 이미지를 뿌려주기 -->
			<c:forEach var="vo" items="${pList}">
				<div class="col-sm">
					<div class="thumb">
					
					<!-- 상의 보여주는 코드 -->
					<c:if test="${categoryNum ge 1 and categoryNum le 4 and categoryNum eq vo.product_category}">
					인덱스:${vo.product_idx}
					<a href="productInfo?product_idx=${vo.product_idx}">
						<img alt="상품" src="${vo.product_imgPath}_1.jpg" width="300px" height="300px"/>
					</a>
					
					<div class="prdInfo">
						<div class="Pname">
							<a href="productInfo?product_idx=${vo.product_idx }">
								<span class="instock-icon">국내</span>	
							</a>
						</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
					</c:if>
					
					<!-- 하의 보여주는 코드 -->
					<c:if test="${categoryNum ge 5 and categoryNum le 8 and categoryNum eq vo.product_category}">
					인덱스:${vo.product_idx}
					<a href="productInfo?product_idx=${vo.product_idx}">
						<img alt="상품" src="${vo.product_imgPath}_1.jpg" width="300px" height="300px"/>
					</a>
					
					<div class="prdInfo">
						<div class="Pname">
							<a href="productInfo?product_idx=${vo.product_idx }">
								<span class="instock-icon">국내</span>	
							</a>
						</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
					</c:if>
					
					<!-- 원피스 보여주는 코드 -->
					<c:if test="${categoryNum ge 9 and categoryNum le 11 and categoryNum eq vo.product_category}">
					인덱스:${vo.product_idx}
					<a href="productInfo?product_idx=${vo.product_idx}">
						<img alt="상품" src="${vo.product_imgPath}_1.jpg" width="300px" height="300px"/>
					</a>
					
					<div class="prdInfo">
						<div class="Pname">
							<a href="productInfo?product_idx=${vo.product_idx }">
								<span class="instock-icon">국내</span>	
							</a>
						</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
					</c:if>
					
					<!-- 아우터 보여주는 코드 -->
					<c:if test="${categoryNum ge 12 and categoryNum le 15 and categoryNum eq vo.product_category}">
					인덱스:${vo.product_idx}
					<a href="productInfo?product_idx=${vo.product_idx}">
						<img alt="상품" src="${vo.product_imgPath}_1.jpg" width="300px" height="300px"/>
					</a>
					
					<div class="prdInfo">
						<div class="Pname">
							<a href="productInfo?product_idx=${vo.product_idx }">
								<span class="instock-icon">국내</span>	
							</a>
						</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
					</c:if>
					
					<!-- 악세사리 보여주는 코드 -->
					<c:if test="${categoryNum ge 16 and categoryNum le 18 and categoryNum eq vo.product_category}">
					인덱스:${vo.product_idx}
					<a href="productInfo?product_idx=${vo.product_idx}">
						<img alt="상품" src="${vo.product_imgPath}_1.jpg" width="300px" height="300px"/>
					</a>
					
					<div class="prdInfo">
						<div class="Pname">
							<a href="productInfo?product_idx=${vo.product_idx }">
								<span class="instock-icon">국내</span>	
							</a>
						</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
					</c:if>
					
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>