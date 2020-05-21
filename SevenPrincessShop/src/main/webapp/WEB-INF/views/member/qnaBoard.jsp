<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>

<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- 부트스트랩 사용하기 위한 코드 -->
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myBoard.js"></script>

</head>

<body>

	<!-- header / nav 설정 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="wrapper d-flex align-items-stretch">
	<!-- myPage 설정 -->
	<%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
		
		<div id="content" class="p-4 p-md-5">
		   <h2>1:1 문의</h2><br/>
		   
		    <!-- 페이지 번호 사용하기 위해 qboardList 세팅 --> 
			<c:set var="info" value="${info}" />
			<!-- 질문 정보 사용하기 위한 QboardList.qboardList 세팅--> 
		   	<c:set var="list" value="${qboardList}" />
			<!-- 대답 리스트 이용하기 위한 aboardList 세팅--> 
		   	<c:set var="list2" value="${aboardList}" />
			<!-- controller로부터 받은 답변 상태 뿌려주기 위한 answer 세팅 --> 
		   	<c:set var="answer" value="${answer}" />
		
		   <div class="container hiDiv">
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
		            <jsp:useBean id="date" class="java.util.Date" />
		            <c:forEach var="vo" items="${list}" varStatus="status">
		               <tr onclick="selectQ(this)" id="${vo.qboard_idx}">
		                  <td>${vo.qboard_idx}</td>
		                  <td>${vo.qboard_type}</td>
		                  <td>${vo.qboard_title}</td>
		                  <td>${vo.qboard_date}</td>
		                  <td>${answer.get(status.index)}</td>
		               </tr>
		               <!-- 클릭시 내용 보여주고 숨기는 flag 역할 -->
		               <input id="flag${vo.qboard_idx}" type="hidden" value="0" />
		               <tr id="show${vo.qboard_idx}" style="display: none;">
		                  <td colspan="5">
		                     <!-- 상세 내용 부분 -->
		                     <div>
		                        <p>${vo.qboard_content}</p>
		                     </div> <!-- 답변 부분 -->
		                     <div>
		                        <!-- 가져온 답변 리스트-->
		                        <c:forEach var="vo2" items="${list2}" varStatus="status">
		                           <c:if test="${vo.qboard_idx == vo2.aboard_qboard_idx}">
		                              <h4>${vo2.aboard_title}</h4>
		                              <span>${vo2.aboard_date}</span>
		                              <P>${vo2.aboard_content}</P>
		                           </c:if>
		                        </c:forEach>
		                     </div>
		                  </td>
		               </tr>
		            </c:forEach>
		         </c:if>
		         
		         <!-- 글쓰기 페이지로 이동하는 버튼 -->
		         <tr>
		         	<td colspan="5" align="right">
					   	<button id="hiBtn" class="btn btn-success" type="button" onclick="location.href='qnaInsert'">글쓰기</button>
		         	</td>
		         </tr>
		         
		      </table>
		   </div>
		   
		
		
		   <!-- 페이지 이동 버튼 -->
		   <div align="center">
		      <c:forEach var="i" begin="${info.startPage}" end="${info.endPage}" step="1">
		
		         <c:if test="${i == info.currentPage}">
		            <input class="button button2" type="button" value="${i}" disabled="disabled" />
		         </c:if>
		
		         <c:if test="${i != info.currentPage}">
		            <input class="button button1" type="button" value="${i}"
		               onclick="location.href='?currentPage=${i}'" title="${i}페이지로 이동합니다." />
		         </c:if>
		
		      </c:forEach>
		   </div>
		  </div>
		 </div>
		 
		 <!-- footer 설정 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>