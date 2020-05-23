<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h2 align="center">1:1 문의</h2>
<%-- 	<c:set var="info" value="${info}"/>
	<c:set var="list" value="${qboardList}"/>
	<c:set var="list2" value="${aboardList}"/>
	<c:set var="answer" value="${answer}"/> --%>


	<table class="table table-hover" style="text-align: center" width="1000" align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th width="80" align="center">번호</th>
			<th width="80" align="center">분류</th>
			<th width="600" align="center">제목</th>
			<th width="150" align="center">날짜</th>
			<th width="80" align="center">답변상태</th>
		</tr>
		
		
		<!-- 테이블에 글이 없으면 없다고 출력한다. -->
		<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5" align="center">저장된 글이 없습니다.</td>
			</tr>
		</c:if>
		
		<!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
		<c:if test="${list.size() != 0}">
		
			<!-- 컴퓨터 시스템의 현재 날짜와 시간을 기억하는 Date 클래스 객체를 만든다. -->
			<jsp:useBean id="date" class="java.util.Date"/>
			<c:forEach var="vo" items="${list}" varStatus="status">
			
					
					<!-- 가져온 답변 리스트-->
					<c:forEach var="vo2" items="${list2}" varStatus="status">
						
						<c:if test="${vo.qboard_idx eq vo2.aboard_qboard_idx}">
							
						<!-- 	
							<input id="t${vo2.aboard_qboard_idx}" type="hidden" value="${vo2.aboard_title}"/>
							<input id="t${vo2.aboard_qboard_idx}" type="hidden" value="${vo2.aboard_}"/>
							<input type="hidden" value="${vo2.aboard_title}"/>
						
						 	<c:set var="${vo2.aboard_qboard_idx}" value=""></c:set>
						 	<input type="hidden" value="${vo2}"/>
						  -->
						
						</c:if>
					
					</c:forEach>
				
				<tr onclick="selectQ(this)" id="${vo.qboard_idx}">		
					<td>${vo.qboard_idx}</td>
					<td>${vo.qboard_type}</td>
					<td >${vo.qboard_title}</td>
					<td>${vo.qboard_date}</td>
					<td>${answer.get(status.index)}</td>
				</tr>
				
				
			</c:forEach>
		</c:if>
	</table>
		
	<!-- 글쓰기 페이지로 이동하는 버튼 -->
	<div align="right"><button type="button" onclick="">글쓰기</button></div> 
		
	<!-- 페이지 이동 버튼 -->
	<div align="center">
		<c:forEach var="i" begin="${info.startPage}" end="${info.endPage}" step="1">
			
			<c:if test="${i == info.currentPage}">
				<input class="button button2" type="button" value="${i}" disabled="disabled"/>
			</c:if>
				
			<c:if test="${i != info.currentPage}">
				<input class="button button1" type="button" value="${i}" onclick="location.href='?currentPage=${i}'" 
					title="${i}페이지로 이동합니다."/>
			</c:if>
			
		</c:forEach>
	</div>
		
		

</body>
</html>