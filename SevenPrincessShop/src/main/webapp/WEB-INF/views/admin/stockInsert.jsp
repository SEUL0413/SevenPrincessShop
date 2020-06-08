<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<!-- 부트스트랩 사용하기 위한 코드 -->
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<meta charset="UTF-8">
<title>재고 추가</title>
</head>
<body>

	<!-- 관리자 header 설정 -->
	<%@ include file="/WEB-INF/views/include/adminHeader/stock.jsp"%>
	<section id="main-content">
		<section class="wrapper">
			<h2>재고 목록 Insert</h2>
			
			<form action="stockInsertOK" method="post">
			<table width="500" align="center" border="1" cellpadding="5" cellspacing="0">
				<tr><th colspan="2">재고 관리 Insert</th></tr>
				<tr>
					<td width="100">이름</td>
					<td width="400"><input type="text" name="product_name"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="product_price"/></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><input type="text" name="product_category"/></td>
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="text" name="product_stock"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장하기"/>
						<input type="reset" value="다시쓰기"/>
						<input type="button" value="돌아가기" onclick="history.back()"/>
					</td>
				</tr>
			</table>
			</form>
			
		</section>
	</section>
		
	
	<!-- 관리자 footer 설정 -->
	<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>

</body>
</html>