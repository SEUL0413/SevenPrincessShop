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
<style type="text/css">

   img{
      border-radius:10px; 
   }
   
   .mainTitle{
      color:#ad8dae;
      font-size: 20px;
   }
   
   h2{
   	
   }
   
</style>


<body>

   <%@ include file="/WEB-INF/views/include/css_js_link.html"%>
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   <%@ include file="/WEB-INF/views/include/nav.jsp"%>

   <c:if test="${categoryNum eq 1}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">상의 - 블라우스</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 2}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">상의 - 티셔츠</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 3}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">상의 - 맨투맨</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 4}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">상의 - 후드</h2><br/>
      <hr/><br/>
   </c:if>
   
   <c:if test="${categoryNum eq 5}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">하의 - 청바지</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 6}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">하의 - 반바지</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 7}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">하의 - 와이드 팬츠</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 8}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">하의 - 스커트</h2><br/>
      <hr/><br/>
   </c:if>
   
   <c:if test="${categoryNum eq 9}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">원피스 - 롱원피스</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 10}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">원피스 - 숏원피스</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 11}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">원피스 - 민소매 원피스</h2><br/>
      <hr/><br/>
   </c:if>
   
   <c:if test="${categoryNum eq 12}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">아우터 - 코트</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 13}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">아우터 - 자켓</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 14}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">아우터 - 가디건</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 15}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">아우터 - 패딩</h2><br/>
      <hr/><br/>
   </c:if>
   
   <c:if test="${categoryNum eq 16}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">악세사리 - 가방</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 17}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">악세사리 - 신발</h2><br/>
      <hr/><br/>
   </c:if>
   <c:if test="${categoryNum eq 18}">
      <br/><h2 align="left" style="margin-left: 10%;margin-top: 5%">악세사리 - 모자</h2><br/>
      <hr/><br/>
   </c:if>

   <!-- 카테고리 넘버가 1이면 카테고리 넘버가 1인 모든 제품을 띄워주고 2이면 2인 제품들 3이면 3인 제품들을 띄워준다. -->
   <div class="contentArea">
      <div class="container">
         <div class="row">
            <!-- categoryNum 별 데이터를 불러와 이미지를 뿌려주기 -->
         <c:forEach var="vo" items="${pList}">
            <div class="col-sm">
               <div class="thumb" style="margin-top: 50px;margin-bottom: 50px">
               
               <!-- 상의 보여주는 코드 -->
               <c:if test="${categoryNum ge 1 and categoryNum le 4 and categoryNum eq vo.product_category}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               
               <div class="prdInfo">
                  <div class="Pname">
                     <div style="padding-top: 20px">
                        <span class="instock-icon">국내</span><br/>
                        <a href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                           ${vo.product_name}   
                        </a>
                     </div>
                  </div>
                  <hr style="margin-top: 5px;margin-bottom: 5px">
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></b> 원
                     </span>
                  </div>
               </div>
               </c:if>
               
               <!-- 하의 보여주는 코드 -->
               <c:if test="${categoryNum ge 5 and categoryNum le 8 and categoryNum eq vo.product_category}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               
               <div class="prdInfo">
                  <div class="Pname">
                     <div style="padding-top: 20px">
                        <span class="instock-icon">국내</span><br/>   
                        <a href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                           ${vo.product_name}   
                        </a>
                     </div>
                  </div>
                  <hr width="320px" align="left" style="margin-top: 5px;margin-bottom: 5px">
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></b> 원
                     </span>
                  </div>
               </div>
               </c:if>
               </forEach> 
              
               <!-- 원피스 보여주는 코드 -->
               <c:if test="${categoryNum ge 9 and categoryNum le 11 and categoryNum eq vo.product_category}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               
               <div class="prdInfo">
                  <div class="Pname">
                     <div style="padding-top: 20px">
                        <span class="instock-icon">국내</span><br/>   
                        <a href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                              ${vo.product_name}   
                        </a>
                     </div>
                  </div>
                  <hr style="margin-top: 5px;margin-bottom: 5px">
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></b> 원
                     </span>
                  </div>
               </div>
               </c:if>
               
               <!-- 아우터 보여주는 코드 -->
               <c:if test="${categoryNum ge 12 and categoryNum le 15 and categoryNum eq vo.product_category}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               
               <div class="prdInfo">
                  <div class="Pname">
                     <div style="padding-top: 20px">
                        <span class="instock-icon">국내</span><br/>
                        <a href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                              ${vo.product_name}   
                        </a>
                     </div>
                  </div>
                  <hr style="margin-top: 5px;margin-bottom: 5px">
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></b> 원
                     </span>
                  </div>
               </div>
               </c:if>
               
               <!-- 악세사리 보여주는 코드 -->
               <c:if test="${categoryNum ge 16 and categoryNum le 18 and categoryNum eq vo.product_category}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               
               <div class="prdInfo">
                  <div class="Pname">
                     <div style="padding-top: 20px">
                        <span class="instock-icon">국내</span><br/>
                        <a href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                              ${vo.product_name}   
                        </a>
                     </div>
                  </div>
                  <hr style="margin-top: 5px;margin-bottom: 5px">
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></b> 원
                     </span>
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