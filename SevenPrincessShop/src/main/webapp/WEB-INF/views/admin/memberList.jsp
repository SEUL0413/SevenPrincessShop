<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPS 관리자 </title>
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
         
         //박스 전체에 클릭이 되면 all 버튼 check! 하나라도 클릭 해제되면 all버튼 check 해제하기 
         let boxs = $("input[name=chk]")
         boxs.click(function(){
            if(boxs.length == $("input[name=chk]:checked").length){
               $("input[name=all]").prop("checked",true);
            }else{
               $("input[name=all]").prop("checked",false);
            }
         });
   };
   
   function changeSelect() {
      
      var opt = document.getElementById("searchKey");
      var optText = opt.options[opt.selectedIndex].text;

      document.getElementById("searchValue").value = '';
   
   }
   </script>
   
   <!-- 외부 스크립트 파일 지정 태그입니다. -->
	<script src="${pageContext.request.contextPath}/resources/script/adminMember.js"></script>
	<!-- jquery 추가 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<!-- 관리자 header 설정 -->
<%@ include file="/WEB-INF/views/include/adminHeader/member.jsp"%>
     <!--main content start-->
      <section id="main-content">
           <section class="wrapper">
      

         <form action="memberList" method="post" class="container gs" style="margin-top: 50px">
            <h2>회원목록</h2>
            
               <div class="row" >
                  <div class="col-xs-2 fc">
                     <select id="searchKey" name="searchKey" class="form-control" onchange="changeSelect()" style="width: 160px;height:33px ">
                          <option id="1" value="client_idx ">회원 번호</option>
                          <option id="2" value="client_id ">ID</option>
                          <option id="3" value="client_name ">이름</option>
                          <option id="4" value="client_email  ">이메일</option>
                           <option id="5" value="client_phoneNumber ">번호</option>
                           <option id="6" value="client_birthday ">생일</option>
                           <option id="7" value="client_address ">주소</option>
                     </select> 
                  </div>
                  
                  <div class="col-xs-2">
                     <input type="text" name="searchValue" class="form-control" id="searchValue" value="${value}">
                  </div>
                  <div class="row col-xs-2 sf">      
                     <input class="btn btn-default"  type="submit" value="검색"> 
                  </div>   
               </div>
            </form> 
      
         <div class="tm">
            <div class="container">
               <table class="table table-hover">
                  <tr>
                     <td colspan="10" align="right">
                        ${clientList.totalCount}(${clientList.currentPage}/${clientList.totalPage})
                     </td>
                  </tr>
                  <tr>
                  	 <th><input type="checkbox" name="all" id="all" onclick="allChk(this.checked)"/></th>
                     <th>회원 번호</th>
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
                        <td colspan="10" align="center" style="vertical-align: middle;">테이블에 저장된 글이 없습니다.</td>
                     </tr>
                  </c:if>
                  
                  <!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
                  <c:if test="${list.size() != 0}">   
                     <c:forEach var="client" items="${list}">
                        <tr>
                     		<td><input type="checkbox"  name="chk" class="chk" value="${client.client_idx}"/></td>
                           <td align="center" style="vertical-align: middle;">${client.client_idx}</td>
                           <td align="center" style="vertical-align: middle;">${client.client_name}
                              <c:if test="${client.client_registerDate eq '0000-00-00 00:00'}">
                                 </br>(관리자)
                              </c:if>
                           </td>
                           <td align="center" style="vertical-align: middle;">${client.client_id}</td>
                           <td align="center" style="vertical-align: middle;">${client.client_birthday}</td>
                           <td align="center" style="vertical-align: middle;">${client.client_email}</td>
                           <td align="center" style="vertical-align: middle;">${client.client_phoneNumber }</td>
                           <td align="center" style="vertical-align: middle;">${client.client_address } ${client.client_detailAddress}</td>
                           <td align="center" style="vertical-align: middle;">
                           		<c:if test="${client.client_registerDate ne '0000-00-00 00:00'}">
                           			${client.client_registerDate}
                           		</c:if>
                           	</td>
                           <td align="center" style="vertical-align: middle;">
                              <c:if test="${client.client_registerDate ne '0000-00-00 00:00'}">
                                 
                           <input type="button" class="btn btn-default"value="주문내역"
                              onclick="location.href='clientOrderList?client_idx=${client.client_idx}'">
                              </c:if>
                           </td>
                        </tr>
                     </c:forEach>         
                  </c:if>
         
         
                  <!-- 페이지 이동 버튼 -->
                  <tr>
                     <td align="center" colspan="10">               
                     <!-- 처음으로, 10페이지 앞으로 -->
                     <c:if test="${clientList.startPage > 1}">
                        <input type="button" value="&lt;" class="btn btn-secondary" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
                        <input type="button" value="&lt;&lt;"  class="btn btn-secondary"
                              onclick="location.href='?currentPage=${clientList.startPage - 1}'" 
                              title="이전 10 페이지로 이동합니다."/>
                     </c:if>
                     
                     <c:if test="${clientList.startPage <= 1}">
                        <input type="button" value="&lt;"  class="btn btn-secondary" disabled="disabled" title="이미 첫 페이지 입니다."/>
                        <input type="button" value="&lt;&lt;" class="btn btn-secondary" disabled="disabled" title="이전 10 페이지가 없습니다."/>
                     </c:if>
                     
                     <!-- 페이지 이동 -->
                     <c:forEach var="i" begin="${clientList.startPage}" end="${clientList.endPage}" step="1">
                        <c:if test="${i == clientList.currentPage}">
                           <input class="button button2 btn btn-secondary" type="button" value="${i}" disabled="disabled"/>
                        </c:if>                  
                        <c:if test="${i != clientList.currentPage}">
                           <input class="button button1 btn btn-secondary" type="button" value="${i}" 
                           onclick="location.href='?currentPage=${i}&searchKey=${clientList.searchKey}&searchValue=${clientList.searchValue}'" title="${i}페이지로 이동합니다."/>
                        </c:if>               
                     </c:forEach>
                     
                     <!-- 마지막으로, 10페이지 뒤로 -->
                     <c:if test="${clientList.endPage < clientList.totalPage}">
                        <input type="button" value="&gt;"  class="btn btn-secondary"
                              onclick="location.href='?currentPage=${clientList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
                        <input type="button" value="&gt;&gt;"  class="btn btn-secondary"
                              onclick="location.href='?currentPage=${clientList.totalPage}'" title="마지막 페이지로 이동합니다."/>
                     </c:if>
                     <c:if test="${clientList.endPage >= clientList.totalPage}">
                        <input type="button" value="&gt;" class="btn btn-secondary"  disabled="disabled" title="다음 10 페이지가 없습니다."/>
                        <input type="button" value="&gt;&gt;" class="btn btn-secondary"  disabled="disabled" title="이미 마지막 페이지 입니다."/>
                     </c:if>
                     </td>
                  </tr>
               </table>
               <c:if test="${nowUser.client_idx == 0}">
	               <div style="margin-left:80%">
		               <button class="btn btn-default" onclick="chkCount(this.value)" value="1">관리자 지정</button>
		               <button class="btn btn-default" onclick="chkCount(this.value)" value="2">관리자 해제</button>
	            	</div>
            	</c:if>
            </div>
         </div>      
      </section>
   </section>
   <!-- 관리자 footer 설정 -->
   <%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>
</body>
</html>
