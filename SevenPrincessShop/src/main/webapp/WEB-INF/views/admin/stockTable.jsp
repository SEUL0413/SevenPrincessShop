<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>

<!-- 부트스트랩 사용하기 위한 코드 -->
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

   function selectP(obj) {
      //클릭한 행의 qboardList_idx 
      let idx = $(obj).attr("id");
      
      var f = document.getElementById("flag" + idx);   // 토글 스위치
      var s = document.getElementById("show" + idx);   // 쇼 엘리멘트
      
      if(f.value == 0){
         f.setAttribute("value", "1");   // 토글스위치끄기
         s.setAttribute("style", "");      //스타일 초기화
      }
      
      else{
         f.setAttribute("value", "0");   //토글스위치 끄기
         s.setAttribute("style", "display: none"); //화면끄기
      }
   }
   
   window.onload = function(){
      var k = "${key}";
      
      if(k =="product_idx") {
         document.getElementById("1").setAttribute("selected", "selected");
      }else if(k == "product_name"){
          document.getElementById("2").setAttribute("selected", "selected");
      }else if(k == "product_price"){
          document.getElementById("3").setAttribute("selected", "selected");
      }else if(k=="product_category"){
          document.getElementById("4").setAttribute("selected", "selected");
      }else if(k=="product_hit"){
          document.getElementById("5").setAttribute("selected", "selected");
      }else if(k=="product_stock"){
          document.getElementById("6").setAttribute("selected", "selected");    
      }
      
      
      
   };
   
   //체크박스 전체 클릭시 모든 박스 check하기 
   function allChk(bool){
      $(".chk").prop("checked",bool);
      
      //품절인 상품은 주문할수 없도록 체크박스 해제
      $("input[name=chk]:disabled").prop("checked",false);
   }
   
   //박스 전체에 클릭이 되면 all 버튼 check! 하나라도 클릭 해제되면 all버튼 check 해제하기 
   $(function(){
      let boxs = $("input[name=chk]")
      boxs.click(function(){
         if(boxs.length == $("input[name=chk]:checked").length){
            $("input[name=all]").prop("checked",true);
         }else{
            $("input[name=all]").prop("checked",false);
         }
      });
      
      //삭제 완료후 메시지 출력
      var msg = "${delete_msg}";
      if(msg!=null && msg!=""){
         alert(msg);
         location.href='stockTable';
      }
      
      var updateMsg = "${update_msg}";
      if(updateMsg!=null && updateMsg!=""){
         alert(updateMsg);
         location.href='stockTable';
      }
      
   });
   
   function selectProduct(){
      let chks = document.getElementsByName("chk");
      let idxs = "";
      if($("input[name=chk]:checked").length == 0){
         alert("한 개 이상 체크해주세요!!");
      }else{
         for(let i = 0; i < chks.length; i++) {
            if(chks[i].checked){  //체크된 항목인지 확인하는 조건문
               //chks[i].value: 결제할 장바구니 번호
               idxs += (chks[i].value + "_");
            }
         }
         if(confirm("상품을 삭제하시겠습니까?")){
            var url = "deleteP?idxs=" + idxs;
            location.href = url;
         }
      }
   }
   
   function selectUpdate(){
      
      let chks = document.getElementsByName("chk");
      let idx = "";
   
      if($("input[name=chk]:checked").length != 1){
         alert("한 개만 체크해주세요!!");
      }else{
         for(let i = 0; i < chks.length; i++) {
            if(chks[i].checked){  //체크된 항목인지 확인하는 조건문
               idx = chks[i].value;
            }
         }
         if(confirm("상품을 수정하시겠습니까?")){
            var url = "stockUpdate?idx=" + idx;
            location.href = url;
         }
      }
         
   }

</script>
</head>
<body>
   <!-- 관리자 header 설정 -->
   <%@ include file="/WEB-INF/views/include/adminHeader/stock.jsp"%>
   
   <!--main content start-->
   <section id="main-content">
      <section class="wrapper">
         <h2>상품 목록</h2><br/>
         
            <form action="stockTable" method="post" class="container gs" style="margin-top: 50px">
               <div class="row" >
                  <div class="col-xs-2 fc">
                     <select id="searchKey" name="searchKey" class="form-control" style="width: 160px; height:33px;">
                          <option id="1" value="product_idx">상품 번호</option>
                          <option id="2" value="product_name">이름</option>
                          <option id="3" value="product_price">가격</option>
                           <option id="4" value="product_category">카테고리</option>
                           <option id="5" value="product_hit">조회수</option>
                           <option id="6" value="product_stock">총 재고</option>
                     </select>
                  </div>
                  <div class="col-xs-2">
                     <input type="text" name="searchValue" class="form-control" value="${value}">
                  </div>
                  <div class="row col-xs-2 sf">      
                     <input class="btn btn-default" type="submit" value="검색"> 
                  </div>   
               </div>
            </form>
            
            <br>   
         
            <!-- 질문 정보 사용하기 위한 QboardList.qboardList 세팅--> 
               <c:set var="list" value="${productList.productList}"/>
            
            <div class="tm">
            <div class="container hiDiv">
               <table class="table table-hover" style="text-align: center; width:1200; align:center; cellpadding:5; cellspacing:0";>
                  <tr>
                     <!-- 게시글 개수 -->
                     <td colspan="7" style="text-align:left">
                        (총 <b style="color:#c095a4">${totalCount}</b>건)</strong>
                     </td>
                     <div align="right">
                        <button type="button" class="btn btn-default" onclick="selectUpdate();">수정</button>
                        <button type="button" class="btn btn-default" onclick="selectProduct();">삭제</button>
                     </div>
                  </tr>
                  <tr>
                     <!-- 클릭시 전체 선택 -->
                     <td width="8%"></td> 
                     <td width="12%" align="center">번호</td>
                     <td width="20%" align="center">이름</td>
                     <td width="10%" align="center">가격</td>
                     <td width="20%" align="center">카테고리</td>
                     <td width="15%" align="center">조회수</td>
                     <td width="15%" align="center">재고</td>
                  </tr>
                  
                  <!-- 테이블에 글이 없으면 없다고 출력한다. -->
                  <c:if test="${list.size() == 0}">
                     <tr>
                        <td colspan="7" align="center">저장된 게시글이 없습니다.</td>
                     </tr>
                  </c:if>
                  
                  <c:if test="${list.size() != 0}">
                  
                     <jsp:useBean id="date" class="java.util.Date"/>
                     <c:forEach var="vo" items="${list}">
                     <tr>
                        <td><input type="checkbox" name="chk" id="chk" class="chk" value="${vo.product_idx}"></td>      
                             <td onclick="selectP(this)">${vo.product_idx}</td>
                             <td onclick="selectP(this)">${vo.product_name}</td>
                             <td onclick="selectP(this)">${vo.product_price}</td>
                             <td onclick="selectP(this)">
                                <c:if test="${vo.product_category eq 1}">상의/블라우스</c:if>
                                <c:if test="${vo.product_category eq 2}">상의/티셔츠</c:if>
                                <c:if test="${vo.product_category eq 3}">상의/맨투맨</c:if>
                                <c:if test="${vo.product_category eq 4}">상의/후드</c:if>
                                <c:if test="${vo.product_category eq 5}">하의/청바지</c:if>
                                <c:if test="${vo.product_category eq 6}">하의/반바지</c:if>
                                <c:if test="${vo.product_category eq 7}">하의/와이트 팬츠</c:if>
                                <c:if test="${vo.product_category eq 8}">하의/스커트</c:if>
                                <c:if test="${vo.product_category eq 9}">원피스/롱원피스</c:if>
                                <c:if test="${vo.product_category eq 10}">원피스/숏원피스</c:if>
                                <c:if test="${vo.product_category eq 11}">원피스/민소매원피스</c:if>
                                <c:if test="${vo.product_category eq 12}">아우터/코트</c:if>
                                <c:if test="${vo.product_category eq 13}">아우터/자켓</c:if>
                                <c:if test="${vo.product_category eq 14}">아우터/가디건</c:if>
                                <c:if test="${vo.product_category eq 15}">아우터/패딩</c:if>
                                <c:if test="${vo.product_category eq 16}">악세사리/가방</c:if>
                                <c:if test="${vo.product_category eq 17}">악세사리/신발</c:if>
                                <c:if test="${vo.product_category eq 18}">악세사리/모자</c:if>
                             </td>
                             <td onclick="selectP(this)">${vo.product_hit}</td>
                             <td onclick="selectP(this)">

                             <c:if test="${vo.product_stock == 0}">
                                <b style="color: red;">${vo.product_stock}</b>
                             </c:if>
                             <c:if test="${vo.product_stock <= 5 && vo.product_stock ne 0}">
                                <b>${vo.product_stock}</b>
                             </c:if>
                             <c:if test="${vo.product_stock > 5}">
                                ${vo.product_stock}
                             </c:if>
                             
                             </td>
                     </tr>
                     </c:forEach>
                  </c:if>
                  
                  <!-- 페이지 이동 버튼 -->
                  <tr align="center">
                     <td align="center" colspan="33 69">               
                     <!-- 처음으로, 10페이지 앞으로 -->
                     <c:if test="${productList.startPage > 1}">
                        <input type="button" class="btn btn-secondary" value="&lt;&lt;" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
                        <input type="button" value="-10 page" class="btn btn-secondary" value="&lt;"
                              onclick="location.href='?currentPage=${productList.startPage - 1}'"
                              title="이전 10 페이지로 이동합니다."/>
                     </c:if>
                     
                     <c:if test="${productList.startPage <= 1}">
                        <input type="button" class="btn btn-secondary" value="&lt;&lt;" disabled="disabled" title="이미 첫 페이지 입니다."/>
                        <input type="button" class="btn btn-secondary" value="&lt;" disabled="disabled" title="이전 10 페이지가 없습니다."/>
                     </c:if>
                     
                    <!-- 페이지 이동 -->
                     <c:forEach var="i" begin="${productList.startPage}" end="${productList.endPage}" step="1">
                        <c:if test="${i == productList.currentPage}">
                           <input class="btn btn-secondary" type="button" value="${i}" disabled="disabled"/>
                        </c:if>                  
                        <c:if test="${i != productList.currentPage}">
                           <input class="btn btn-secondary" type="button" value="${i}" 
                           onclick="location.href='?currentPage=${i}&searchKey=${productList.searchKey}&searchValue=${productList.searchValue}'" title="${i}페이지로 이동합니다."/>
                        </c:if>               
                     </c:forEach>
                     
                     <!-- 마지막으로, 10페이지 뒤로 -->
                     <c:if test="${productList.endPage < productList.totalPage}">
                        <input type="button" value="&gt;" class="btn btn-secondary" 
                              onclick="location.href='?currentPage=${productList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
                        <input type="button" value="&gt;&gt;" class="btn btn-secondary" 
                              onclick="location.href='?currentPage=${productList.totalPage}'" title="마지막 페이지로 이동합니다."/>
                     </c:if>
                     <c:if test="${productList.endPage >= productList.totalPage}">
                        <input type="button" value="&gt;" class="btn btn-secondary" disabled="disabled" title="다음 10 페이지가 없습니다."/>
                        <input type="button" value="&gt;&gt;" class="btn btn-secondary444" disabled="disabled" title="이미 마지막 페이지 입니다."/>
                     </c:if>
                     </td>
                  </tr>
                  
               </table>
            </div>
            </div>
      </section>
   </section>
   
   
   <!-- 관리자 footer 설정 -->
   <%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>

</body>
</html>