<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript">
	   window.onload = function(){
	      var k = "${key}";
	      if(k=="client_idx"){
	         document.getElementById("1").setAttribute("selected", "selected");
	      }else if(k=="client_id"){
	          document.getElementById("2").setAttribute("selected", "selected");
	      }else if(k=="client_name"){
	          document.getElementById("3").setAttribute("selected", "selected");
	      }else if(k=="client_email"){
	          document.getElementById("4").setAttribute("selected", "selected");
	      }else if(k=="client_phoneNumber"){
	          document.getElementById("5").setAttribute("selected", "selected");
	      }else if(k=="client_birthday"){
	          document.getElementById("6").setAttribute("selected", "selected");    
	      }else if(k=="client_address"){
	          document.getElementById("7").setAttribute("selected", "selected");
	      }    
	};
	</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/css_js_link.html"%>


	<form action="memberList" method="post" class="container gs">
		<h2>회원목록</h2>
		
			<div class="row" >
				<div class="col-xs-2 fc">
					<select id="searchKey" name="searchKey" class="form-control">
			 			 <option id="1" value="client_idx ">client_idx</option>
			 			 <option id="2" value="client_id ">ID</option>
			 			 <option id="3" value="client_name ">이름</option>
			 			 <option id="4" value="client_email  ">이메일</option>
			  			 <option id="5" value="client_phoneNumber ">번호</option>
			  			 <option id="6" value="client_birthday ">생일</option>
			  			 <option id="7" value="client_address ">주소</option>
					</select> 
				</div>
				
				<div class="col-xs-2">
					<input type="text" name="searchValue" class="form-control" value="${value}">
				</div>
				<div class="row col-xs-2 sf">		
					<input class="btn btn-default"  type="submit" value="전송"> 
				</div>	
			</div>
		</form> 

	<div class="tm">
		<div class="container">
			<table class="table table-hover">
				<tr>
					<td colspan="9 align="right">
						${clientList.totalCount}(${clientList.currentPage}/${clientList.totalPage})
					</td>
				</tr>
				<tr>	
					<th>client_idx</th>
					<th>이름</th>
					<th>ID</th>
					<th>생일</th>
					<th>이메일</th>
					<th>번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>회원 주문 내역</th>		 
				</tr>
	
				<!-- request 영역의 clientList 객체에서 1페이지 분량의 글이 저장된 ArrayList(clientList)의 내용만 얻어내서 별도의 변수에 저장한다. -->
				<c:set var="list" value="${clientList.clientList}"/>
				
				<!-- 테이블에 글이 없으면 없다고 출력한다. -->
				<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="9" align="center">테이블에 저장된 글이 없습니다.</td>
					</tr>
				</c:if>
				
				<!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
				<c:if test="${list.size() != 0}">	
					<c:forEach var="client" items="${list}">
					
						<tr>
						
							<td align="center">${client.client_idx}</td>
							<td align="center">${client.client_name}</td>
							<td align="center">${client.client_id}</td>
							<td align="center">${client.client_birthday}</td>
							<td align="center">${client.client_email}</td>
							<td align="center">${client.client_phoneNumber }</td>
							<td align="center">${client.client_address } ${client.client_detailAddress}</td>
							<td align="center">${client.client_registerDate }</td>
							<td align="center"><input type="button" class="btn btn-default"value="주문내역"
								onclick="location.href='clientOrderList?client_idx=${client.client_idx}'">
							</td>
						</tr>
					</c:forEach>			
				</c:if>
	
	
				<!-- 페이지 이동 버튼 -->
				<tr>
					<td align="center" colspan="9">					
					<!-- 처음으로, 10페이지 앞으로 -->
					<c:if test="${clientList.startPage > 1}">
						<input type="button" value="start page" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
						<input type="button" value="-10 page" 
								onclick="location.href='?currentPage=${clientList.startPage - 1}'" 
								title="이전 10 페이지로 이동합니다."/>
					</c:if>
					
					<c:if test="${clientList.startPage <= 1}">
						<input type="button" value="start page" disabled="disabled" title="이미 첫 페이지 입니다."/>
						<input type="button" value="-10 page" disabled="disabled" title="이전 10 페이지가 없습니다."/>
					</c:if>
					
					<!-- 페이지 이동 -->
					<c:forEach var="i" begin="${clientList.startPage}" end="${clientList.endPage}" step="1">
						<c:if test="${i == clientList.currentPage}">
							<input class="button button2" type="button" value="${i}" disabled="disabled"/>
						</c:if>						
						<c:if test="${i != clientList.currentPage}">
							<input class="button button1" type="button" value="${i}" 
							onclick="location.href='?currentPage=${i}&searchKey=${clientList.searchKey}&searchValue=${clientList.searchValue}'" title="${i}페이지로 이동합니다."/>
						</c:if>					
					</c:forEach>
					
					<!-- 마지막으로, 10페이지 뒤로 -->
					<c:if test="${clientList.endPage < clientList.totalPage}">
						<input type="button" value="+10 page" 
								onclick="location.href='?currentPage=${clientList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
						<input type="button" value="end page" 
								onclick="location.href='?currentPage=${clientList.totalPage}'" title="마지막 페이지로 이동합니다."/>
					</c:if>
					<c:if test="${clientList.endPage >= clientList.totalPage}">
						<input type="button" value="+10 page" disabled="disabled" title="다음 10 페이지가 없습니다."/>
						<input type="button" value="end page" disabled="disabled" title="이미 마지막 페이지 입니다."/>
					</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>		
</body>
</html>

