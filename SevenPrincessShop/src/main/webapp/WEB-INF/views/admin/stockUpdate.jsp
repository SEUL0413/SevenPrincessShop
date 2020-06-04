<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 목록 수정</title>
<script type="text/javascript">
   function delOption(stock_idx) {
      if (${stockArray.size() == 1}) {
         alert("옵션이 1개입니다. 상품 삭제를 이용해주세요.")
         return false;
      }
      var selOption = $("input[name='" + stock_idx + "/stock_size']").val() + "/" + $("input[name='" + stock_idx + "/stock_color']").val();

       var confirmFlag = confirm(selOption + " 옵션을 삭제하시겠습니까?");
       if (!confirmFlag) {
         return false;
      }
      alert(selOption + "옵션을 삭제했습니다.");
      
      
       window.location.href='deleteOption?idx=' + stock_idx +"&product_idx=" + ${idx};
   }

</script>

<style type="text/css">
   th{
      background-color: #e9d0d0;
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
               <h2 style="margin-bottom: 60px;">상품 수정</h2>
                  <table class="table" style="width: 80%" align="center" cellpadding="5" cellspacing="0">
                        <tr>
                           <th width="10%">인덱스</th>
                           <th width="50%">이름</th>
                           <th width="20%">가격</th>
                           <th width="10%">카테고리</th>
                           <th width="10%">총 재고</th>
                        </tr>
                        <tr>
                           <td><input type="text" class="form-control" name="product_idx" value="${idx}" readonly="readonly"/></td>
                           <td><input type="text" class="form-control" name="product_name" value="${vo.product_name}"/></td>
                           <td><input type="text" name="product_price" class="form-control" value="${vo.product_price}"/></td>
                           <td><input type="text" name="product_category"  class="form-control" value="${vo.product_category}" readonly="readonly"/></td>
                           <td><input type="text" name="product_stock" class="form-control" value="${vo.product_stock}" readonly="readonly"/></td>
                        </tr>


                     </table>
                     <table class="table" style="width: 80%" align="center" cellpadding="5" cellspacing="0">
                        <tr>
                           <th>사이즈</th>
                           <th>컬러</th>
                           <th>재고</th>
                           <th></th>
                        </tr>
                        <c:forEach var="stockArray" items="${stockArray}">
                        <tr>
                           <td style="vertical-align: middle;"><input type="text" class="form-control" name="${stockArray.stock_idx}/stock_size" value="${stockArray.stock_size}" readonly="readonly"/></td>
                           <td style="vertical-align: middle;"><input type="text" class="form-control" name="${stockArray.stock_idx}/stock_color" value="${stockArray.stock_color}" readonly="readonly"/></td>
                           <td style="vertical-align: middle;"><input type="text" class="form-control" name="${stockArray.stock_idx}/stock_stock" value="${stockArray.stock_stock}"/></td>
                           <td style="vertical-align: middle;"><input type="button" value="삭제" onclick="delOption(${stockArray.stock_idx});"/></td>
                        </tr>
                        </c:forEach>
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