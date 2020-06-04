<%@page import="jason.stdlib.include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SevenPrincessShop</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
</head>
<style type="text/css">
   .mainTitle{
      color:#ad8dae;
      font-size: 20px;
   }
   
</style>


<body>



<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

   <!-- BEST ITEM입니다~~~!!!! -->
   <div style="margin-top: 100px;margin-bottom: 100px"><h2 align="center">BEST ITEM</h2></div>
   <hr/><br/>
   
   <div class="contentArea" id="bestItem">
      <div class="container">
         <div class="row">
         <c:forEach var="vo" items="${bestList}">
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
                  <a href="productInfo?product_idx=${vo.product_idx}">
                     <img style="border-radius:10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
                  </a>
               </div>
            <!-- 상품 이름 -->
            <div class="prdInfo">
               <div class="Pname">
                  <div style="padding-top: 20px">
                     <span class="instock-icon">국내</span><br/>
                        <a  href="productInfo?product_idx=${vo.product_idx}" class="mainTitle">
                           ${vo.product_name}
                        </a>
                  </div>
                  <hr style="margin-top: 5px;margin-bottom: 5px">
                  <div style="padding-bottom: 100px">                        
                     
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                        <c:if test="${vo.product_stock eq 0}">
                           <img alt="일시품절" src="./resources/images/icon/soldOut.gif" id="soldOut"/>
                        </c:if>
                     </span>
                  </div>
               </div>
               </div>
            </div>
         </c:forEach>
         </div>
      </div>
   </div>
   
   <!-- 상의입니다!!!!! -->
   <div style="margin-top: 200px;margin-bottom: 100px"><h2 align="center">상의</h2></div>
   <hr/><br/>
   <div class="contentArea" id="topItem">
      <div class="container">
         <div class="row">
         <%-- <c:set var="i" value="1"/> --%>
         <c:forEach var="vo" items="${topList}">
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
               <c:if test="${vo.product_category ge 1 and vo.product_category le 4}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img style="border-radius: 10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               </c:if>
               <%-- imgPath:${vo.product_imgPath}
               category:${vo.product_category} --%>
               </div>
            <!-- 상품 이름 -->
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
               <div  style="padding-bottom: 100px">   
                  
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                     </span>
                     <c:if test="${vo.product_stock eq 0}">
                        <img alt="일시품절" src="./resources/images/icon/soldOut.gif"/>
                     </c:if>
                  </div>
               </div>
            </div>
            </div>
         </c:forEach>
         </div>
      </div>
   </div>
      
   
    <div style="margin-top: 200px;margin-bottom: 100px"><h2 align="center">하의</h2></div>
   <hr/><br/>
   <div class="contentArea" id="bottomItem">
      <div class="container">
         <div class="row">
         <c:forEach var="vo" items="${bottomList}">
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
               
               <!-- 카테고리 8이 8_6까지 밖에 없기에 if로 오류를 잡아줬다.(7도 마찬가지) -->
               <c:if test="${vo.product_category ge 5 and vo.product_category le 8}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img style="border-radius: 10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               </c:if>
               </div>
            <!-- 상품 이름 -->
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
               <div  style="padding-bottom: 100px">   
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                     </span>
                     <c:if test="${vo.product_stock eq 0}">
                        <img alt="일시품절" src="./resources/images/icon/soldOut.gif"/>
                     </c:if>
                  </div>
               </div>
            </div>
         </div>
         </c:forEach>
         </div>
      </div>
   </div>
   
   <div style="margin-top: 200px;margin-bottom: 100px"><h2 align="center">원피스</h2></div>
   <hr/><br/>
   <div class="contentArea" id="onePieceItem">
      <div class="container">
         <div class="row">
         <c:forEach var="vo" items="${onePieceList}">
         
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
               <c:if test="${vo.product_category ge 9 and vo.product_category le 11}">
                  <a href="productInfo?product_idx=${vo.product_idx}">
                     <img style="border-radius: 10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
                  </a>
               </c:if>
               </div>
            <!-- 상품 이름 -->
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
               <div  style="padding-bottom: 100px">   
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                     </span>
                     <c:if test="${vo.product_stock eq 0}">
                        <img alt="일시품절" src="./resources/images/icon/soldOut.gif"/>
                     </c:if>
                  </div>
               </div>
               </div>
            </div>
         </c:forEach>
         </div>
      </div>
   </div>
   
   <div style="margin-top: 200px;margin-bottom: 100px"><h2 align="center">아우터</h2></div>
   <hr/><br/>
   <div class="contentArea" id="outerItem">
      <div class="container">
         <div class="row">
         <c:forEach var="vo" items="${outerList}">
         
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
               <c:if test="${vo.product_category ge 12 and vo.product_category le 15}">
               <a href="productInfo?product_idx=${vo.product_idx}">
                  <img style="border-radius: 10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
               </a>
               </c:if>
               </div>
            <!-- 상품 이름 -->
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
               <div  style="padding-bottom: 100px">   
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                     </span>
                     <c:if test="${vo.product_stock eq 0}">
                        <img alt="일시품절" src="./resources/images/icon/soldOut.gif"/>
                     </c:if>
                  </div>
                  </div>
               </div>
            </div>
         </c:forEach>
         </div>
      </div>
   </div>
   
   <div style="margin-top: 200px;margin-bottom: 100px"><h2 align="center">악세사리</h2></div>
   <hr/><br/>
   <div class="contentArea" id="acsItem">
      <div class="container">
         <div class="row">
         <c:forEach var="vo" items="${acsList}">
         
            <!-- 상품 이미지 -->
            <div class="col-sm">
               <div class="thumb">
               <c:if test="${vo.product_category ge 16 and vo.product_category le 18}">
                  <a  href="productInfo?product_idx=${vo.product_idx}">
                     <img style="border-radius: 10px" alt="상품" src="${vo.product_imgPath}_1.jpg" width="250px" height="250px"/>
                  </a>
               </c:if>
               </div>
            <!-- 상품 이름 -->
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
               <div  style="padding-bottom: 100px">   
                  <div class="Pprice">
                     <span class="price">
                        <b style="font-size: 20px"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></b> 원
                     </span>
                        
                     <c:if test="${vo.product_stock eq 0}">
                        <img alt="일시품절" src="./resources/images/icon/soldOut.gif"/>
                     </c:if>
                  </div>
               </div>
            </div>
         </div>
         </c:forEach>
         </div>
      </div>
   </div><br/><br/>
   
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>