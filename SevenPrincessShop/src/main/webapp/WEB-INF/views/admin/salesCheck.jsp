<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<script type="text/javascript">
    $(document).ready(function(){
        setDateBox();
    });    
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        var y = $("#YEAR").val();
       
        	$("#YEAR").append("<option value=''>년도</option>");
        
        
        // 올해 기준으로 -10년부터 보여준다.
        for(var y = (com_year-10); y <= (com_year); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        
        // 월 뿌려주기(1월부터 12월)
        var month = $("#MONTH").val();
      
        	$("#MONTH").append("<option value=''>월</option>");
    
        for(var i = 1; i <= 12; i++){
        	
            	$("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        	
        }
    }
    
    

    
	/*
	<input class="button button1" type="button" value="${i}" 
	onclick="location.href='?
	currentPage=${i}&searchKey=${joinList.searchKey}&searchValue=${joinList.searchValue}&startDate=${joinList.startDate}&
	endDate=${joinList.endDate}&year=${year}&month=${month}&product_name=${product_name}'"	
	title="${i}페이지로 이동합니다." />
	*/
	
    function goPage(currentPage){
		
    	$("#searchForm").attr("action",("salesTerm?currentPage="+currentPage));
    	$("#searchForm").submit();
    
    }
	
	function resetDateSearch(){
		$("#sDate").val('');
		$("#eDate").val('');
	}
	function resetRange(){
		$("#YEAR").val('');		
		$("#MONTH").val('');		
	}
	
	
</script>

<style type="text/css">

	table th{
		bgcolor="#ffffff";
	}

</style>
</head>


<body>
<!-- 관리자 header 설정 -->
<%@ include file="/WEB-INF/views/include/adminHeader/moneyCheck.jsp"%>
	  <!--main content start-->
	  <section id="main-content">
     		<section class="wrapper">

		<form id="searchForm" action="salesTerm" method="post">
			<h1>매출 조회</h1>
			
			<table border="1" class="table table-hover">
		 		<tr>
		 			<th>연도검색</th>
		 			<td> 
		 			
			 			<select name="YEAR" id="YEAR" title="년도" onblur="resetRange()">
			 				<c:if test="${!empty year}">
			 					<option value="${year}" selected="selected">${year}년</option>
			 				</c:if>
			 			</select>
			 			
		            	<select name="MONTH" id="MONTH" title="월" onblur="resetRange()">
		            		<c:if test="${!empty month}">
		            			<option value="${month}" selected="selected">${month}월</option>
		            		</c:if>
		            	</select>
					</td>
		 			<td rowspan="4" align="center" style="vertical-align: middle;"><input type="submit" value="검색" ></td>
		 		</tr>
		 		<tr>
				<th>기간검색</th>
					<td>
						<input id="sDate" type="date" name="startDate" value="${sDate}" onblur="resetDateSearch()"> 
						&nbsp;&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;&nbsp;
						<input id="eDate" type="date" name="endDate" value="${eDate}" onblur="resetDateSearch()">
					</td>
				</tr>
				<tr>
					<th>회원검색</th>
					<td><select id="searchKey" name="searchKey" onchange="changeSelect()">
				 			 <option id="1" value="client_id ">ID</option>
				 			 <option id="2" value="client_name ">이름</option>
				 			 <option id="3" value="client_email  ">이메일</option>
				  			 <option id="4" value="client_phoneNumber ">번호</option>
				  			 <option id="5" value="client_birthday ">생일</option>
				  			 <option id="6" value="client_address ">주소</option>
						</select> 
					
						<input type="text" name="searchValue" id="searchValue">
					</td>
				</tr>
				<tr>
					<th>제품검색</th>
					<td><input type="text" name="product_name"></td>
				</tr>							
			</table>	
		</form> 	
	<br/>
						
						
	<c:set var="list" value="${joinList.joinList}"/>
						
		<!-- 테이블에 글이 없으면 없다고 출력한다. -->
		<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5" align="center">매출 내역이 없습니다.</td><br/>
			</tr>
		</c:if>
		
		<!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
		<c:if test="${list.size() != 0}">	
				
		<table border="1" class="table table-hover">
			<tr>
				<th bgcolor="#ffffff" width="15%">주문건수</th>
				<td width="25%">${count}건</td>
				<th bgcolor="#ffffff" width="15%">총매출액</th>
				<td width="35%"><fmt:formatNumber value="${totalSales}" pattern="#,###"/>원</td>
			</tr>
		</table>
		
		</c:if>
			
		
		
		<br/>	
		<table border="1" class="table table-hover">
			<tr>
				<th bgcolor="#ffffff">상품</th>
				<th bgcolor="#ffffff">상품명</th>
				<th bgcolor="#ffffff">아이디</th>
				<th bgcolor="#ffffff">주문일자</th>
				<th bgcolor="#ffffff">금액</th>
			</tr>
			<c:forEach var="sales" items="${list}">
				<tr>
				
					<td>${sales.productVO.product_imgPath}</td>
					<td>${sales.productVO.product_name}</td>
					<td>${sales.clientVO.client_id}</td>
					<td>${sales.orderListVO.orderList_orderDate}</td>
					<td><fmt:formatNumber value="${sales.productVO.product_price}" pattern="#,###"/>원
					</td>
				</tr>
			</c:forEach>
		
		
		<!-- 페이지 이동 버튼 -->
				<tr>
					<td align="center" colspan="5">
						<!-- 처음으로, 10페이지 앞으로 --> 
						<c:if test="${joinList.startPage > 1}">
							<input type="button" class="btn btn-secondary" value="&lt;&lt;" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다." />
							<input type="button" class="btn btn-secondary" value="&lt;" onclick="location.href='?currentPage=${joinList.startPage - 1}'" title="이전 10 페이지로 이동합니다." />
						</c:if> 
						<c:if test="${joinList.startPage <= 1}">
							<input type="button" class="btn btn-secondary" value="&lt;&lt;" disabled="disabled" title="이미 첫 페이지 입니다." />
							<input type="button" class="btn btn-secondary" value="&lt;" disabled="disabled" title="이전 10 페이지가 없습니다." />
						</c:if> 
						
						
						<!-- 페이지 이동 --> 
						<c:forEach var="i" begin="${joinList.startPage}" end="${joinList.endPage}" step="1">
							
							<c:if test="${i!=0 && i == joinList.currentPage}">
								<input class="button button2 btn btn-secondary"  type="button" value="${i}" disabled="disabled" />
							</c:if>

							<c:if test="${i!=0 && i != joinList.currentPage}">
								
									<input class="button button1 btn btn-secondary" type="button" value="${i}" 
									 onclick="goPage(this.value)"/>
									
							</c:if>
						</c:forEach> 
						
						<!-- 마지막으로, 10페이지 뒤로 --> 
						<c:if test="${joinList.endPage < joinList.totalPage}">
							<input type="button" value="&gt;" class="btn btn-secondary"
								onclick="location.href='?currentPage=${joinList.endPage + 1}'"
								title="다음 10 페이지로 이동합니다." />
							<input type="button" value="&gt;&gt;" class="btn btn-secondary"
								onclick="location.href='?currentPage=${joinList.totalPage}'"
								title="마지막 페이지로 이동합니다." />
						</c:if> 
						<c:if test="${not empty joinList.currentPage && joinList.endPage >= joinList.totalPage}">
							<input type="button" class="btn btn-secondary" value="&gt;" disabled="disabled"
								title="다음 10 페이지가 없습니다." />
							<input type="button" class="btn btn-secondary" value="&gt;&gt;" disabled="disabled"
								title="이미 마지막 페이지 입니다." />
						</c:if>
					</td>
				</tr>
			</table>
		
		</section>
	</section>
	<!-- 관리자 footer 설정 -->
	<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>

</body>
</html>		
		

