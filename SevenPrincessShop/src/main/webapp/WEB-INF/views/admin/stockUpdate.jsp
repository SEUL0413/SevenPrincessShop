<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 목록 수정</title>


<style type="text/css">
	th{
		background-color: #e9d0d0;
		width:100px;
		text-align: center;
		font-size:15px;
	}
	td{
		height: 70px;
	}
	
</style>


</head>
<body>
<!-- 관리자 header 설정 -->
<%@ include file="/WEB-INF/views/include/adminHeader/stock.jsp"%>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<form action="stockUpdateOK" method="post"  class="container gs">
				<div style="margin-top:100px">
					<h2 style="margin-bottom: 60px;">재고 수정</h2>
						<table class="table" style="width: 50%" align="center" cellpadding="5" cellspacing="0">
								<tr>
									<th width="100">인덱스</th>
									<td width="400"><input type="text" class="form-control" name="product_idx" value="${idx}" readonly="readonly"/></td>
								</tr>
								<tr>
									<th width="100">이름</th>
									<td width="400"><input type="text" class="form-control" name="product_name" value="${vo.product_name}"/></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type="text" name="product_price" class="form-control" value="${vo.product_price}"/></td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td><input type="text" name="product_category"  class="form-control" value="${vo.product_category}"/></td>
								</tr>
								<tr>
									<th>재고</th>
									<td><input type="text" name="product_stock" class="form-control" value="${vo.product_stock}"/></td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<input type="submit" class="btn btn-secondary" value="수정하기"/>
										
										<input type="button" class="btn btn-secondary"  value="돌아가기" onclick="history.back()"/>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</section>
		</section>
		<!-- 관리자 footer 설정 -->
		<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>

</body>
</html>