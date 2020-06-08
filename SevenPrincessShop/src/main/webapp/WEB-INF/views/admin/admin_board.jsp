<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jstl 사용하기 위한 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 부트스트랩 사용하기 위한 코드 -->
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myCart.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/myBoard.js"></script>


<script type="text/javascript">

	//바로 실행 코드 : alert 메시지 띄우기용
	window.onload = function(){
		var insert_msg = '${insert_msg}';
		var delete_msg = '${delete_msg}';
	
		//문의 게시글 답변 insert 완료 메세지
		if(insert_msg!=null && insert_msg!=""){
			alert(insert_msg);
			location.href="allBoard";
		}
		
		//게시글 delete 완료 메세지
		if(delete_msg!=null && delete_msg!=""){
			alert(delete_msg);
			location.href="allBoard";
		}
	}	
</script>

<style type="text/css">
	th{
		background-color: #dddbdb;
	}
</style>
</head>
<body>
	<!-- 관리자 header 설정 -->
	<%@ include file="/WEB-INF/views/include/adminHeader/board.jsp"%>
	 		
	
	 <!--main content start-->
      <section id="main-content">
     	<section class="wrapper">
     		<form class="container gs" style="margin-top: 50px">
				<h2>문의 게시글 목록</h2><br/>
				
				<!-- 페이지 번호 사용하기 위해 qboardList 세팅 --> 
				<c:set var="info" value="${info}" />
				<!-- 질문 정보 사용하기 위한 QboardList.qboardList 세팅--> 
			   	<c:set var="list" value="${qboardList}" />
				<!-- 대답 리스트 이용하기 위한 aboardList 세팅--> 
			   	<c:set var="list2" value="${aboardList}" />
				<!-- controller로부터 받은 답변 상태 뿌려주기 위한 answer 세팅 --> 
			   	<c:set var="answer" value="${answer}" />
				
				 <div class="container hiDiv">
			      <table class="table table-hover" style="text-align: center;width:1200;align:center;cellpadding:5;cellspacing:0">
					 <tr>
					 	<!-- 게시글 개수 -->
					 	<td colspan="6" style="text-align:left">
					 		<strong style="font-size: 19px">오늘 등록된 새글 <b style="color:#c095a4">${count}</b> 건 
					 		(총 <b style="color:#c095a4">${totalCount}</b> 건)</strong>
					 	</td>
					 	<td>
					 		<button type="button" class="btn btn-default" onclick="selectOrder(this.value)" value="2">삭제</button>
					 	</td>
					 </tr>
			         <tr>
			         	<!-- 클릭시 전체 선택 -->
			         	<th><input type="checkbox" name="all" id="all" onclick="allChk(this.checked)"></th> 
			            <th width="80" align="center">번호</th>
			            <th width="100" align="center">분류</th>
			            <th width="600" align="center">제목</th>
			            <th width="200" align="center">날짜</th>
			            <th width="100" align="center">답변상태</th>
			            <th width="120" align="center">답변하기</th>
			         </tr>
			
			
			         <!-- 테이블에 글이 없으면 없다고 출력한다. -->
			         <c:if test="${list.size() == 0}">
			            <tr>
			               <td colspan="5" align="center">저장된 문의글이 없습니다.</td>
			            </tr>
			         </c:if>
			
			         <!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
			         <c:if test="${list.size() != 0}">
			         
			            <!-- 컴퓨터 시스템의 현재 날짜와 시간을 기억하는 Date 클래스 객체를 만든다. -->
			            <jsp:useBean id="date" class="java.util.Date" />
			            
			            <c:forEach var="vo" items="${list}" varStatus="status">
			              
			               <tr>
			               	  <!-- 1. 항목 체크박스 : 박스에 전체 클릭이 되면 상단 all버튼 check! 하나라도 해제시 check 풀림!-->
			              	  <td><input type="checkbox" name="chk" class="chk" value="${vo.qboard_idx}"/></td>
			              	  
			              	  <!-- 아래 5개 항목 클릭시 상세내용 아래에 띄우는 함수 실행 -->
			                  <td onclick="selectQ(this)" id="${vo.qboard_idx}">${vo.qboard_idx}</td>   <!-- 2. 질문글 번호 -->
			                  <td onclick="selectQ(this)" id="${vo.qboard_idx}">${vo.qboard_type}</td>  <!-- 3. 질문글 분류 -->
			                  <td onclick="selectQ(this)" id="${vo.qboard_idx}">${vo.qboard_title}</td> <!-- 4. 질문글 제목 -->
			                  <td onclick="selectQ(this)" id="${vo.qboard_idx}">${vo.qboard_date}</td>  <!-- 5. 질문글 날짜 -->
			                  <td onclick="selectQ(this)" id="${vo.qboard_idx}">${answer.get(status.index)}</td> <!-- 6.질문글 답변상태 -->
			                  
			                  <td>
			                  	<!-- [답변대기] 상태일 경우 답변하기 버튼 삽입, 아닐경우 "-" 출력 -->
			                  	<c:if test="${answer.get(status.index) eq '답변완료'}">
			                  		-
			                  	</c:if>
			                  	<c:if test="${answer.get(status.index) eq '답변대기'}">
			                  		<button type="button" class="btn btn-default" onclick="location.href='insertBoardView?qboard_idx=${vo.qboard_idx}'">답변하기</button>
			                  	</c:if>
			                  </td>
			               </tr>
			               
			               <!-- 클릭시, 내용 보여주고 숨기는 flag 역할 -->
			               <input id="flag${vo.qboard_idx}" type="hidden" value="0" />
			               <tr id="show${vo.qboard_idx}" style="display: none;">
			                  <td colspan="7">
			                     <!-- 상세 내용 부분 -->
			                    <div style="height:100px">
					                 <b>${vo.qboard_content}</b>
					             </div> 
					              
					              <!-- 답변 부분 시작-->
			                     <div> 
			                        <!-- 가져온 답변 리스트-->
			                        <c:forEach var="vo2" items="${list2}" varStatus="status">
			                           <c:if test="${vo.qboard_idx == vo2.aboard_qboard_idx}">
			                               <div style="background-color:#F2F2F2;margin-top: 60px;height:200px;text-align: center">
					                     		<div style="margin-bottom: 40px">
						                     		<span class="bg">답변</span>
						                     		<b style="font-size: 18px">▶ 관리자</b><span>(${vo2.aboard_date})</span>
			                  					 </div>
					                         	<div><b>${vo2.aboard_content}</b></div>
					                        </div>
			                           </c:if>
			                        </c:forEach>
			                     </div>
			                     
			                  </td>
			               </tr>
			            </c:forEach>
			         </c:if>
			      </table>
			   </div>
			  
			
			   <!-- 페이지 이동 버튼 -->
			  <div align="center">
					<c:if test="${info.startPage > 1}">
						<input type="button" class="btn btn-secondary" value="&lt;&lt;" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
						<input type="button" class="btn btn-secondary" value="&lt;" 
								onclick="location.href='qnaBoard?currentPage=${info.startPage - 1}'" 
								title="이전 10 페이지로 이동합니다."/>
					</c:if>
					
					<c:if test="${info.startPage == 1}">
						<input type="button" class="btn btn-secondary" value="&lt;&lt;" disabled="disabled" title="이미 첫 페이지 입니다."/>
						<input type="button" class="btn btn-secondary" value="&lt;" disabled="disabled" title="이전 10 페이지가 없습니다."/>
					</c:if>
					
					<!-- 페이지 이동 -->
					<c:forEach var="i" begin="${info.startPage}" end="${info.endPage}" step="1">
					
						<c:if test="${i == info.currentPage}">
							<input class="btn btn-secondary" type="button" value="${i}" disabled="disabled"/>
						</c:if>
						
						<c:if test="${i != info.currentPage}">
							<input class="btn btn-secondary" type="button" value="${i}" onclick="location.href='?currentPage=${i}'" 
								title="${i}페이지로 이동합니다."/>
						</c:if>
					
					</c:forEach>
					
					<!-- 마지막으로, 10페이지 뒤로 -->
					<c:if test="${info.endPage < info.totalPage}">
						<input type="button" value="&gt;"  class="btn btn-secondary"
								onclick="location.href='?currentPage=${info.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
						<input type="button" value="&gt;&gt;" class="btn btn-secondary"
								onclick="location.href='?currentPage=${info.totalPage}'" title="마지막 페이지로 이동합니다."/>
					</c:if>
			
					<c:if test="${info.endPage >= info.totalPage}">
							<input type="button" value="&gt;" disabled="disabled" class="btn btn-secondary" title="다음 10 페이지가 없습니다."/>
						<input type="button" value="&gt;&gt;" class="btn btn-secondary" disabled="disabled" title="이미 마지막 페이지 입니다."/>
					</c:if>
				</div><br/><br/>
			</form>
		</section>
	</section>
	<!-- 관리자 footer 설정 -->
	<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>
	
	
</body>
</html>