<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/productInfo.css">
<script type="text/javascript">

var count = 0;
var sizeList = new Array();
var colorList = new Array();
var stockList = new Array();
var optionFlag = false;
//   부분 품절 및 옵션 불러오기

function showOption(size){
   $.ajax({
      //setting
      async : false,
      type: "POST",
      url: "getOptionValues",
      dataType:"json",
      data: {param:size, param2:"${productVO.product_idx}"},
      
      
      //success
      success: function(result){
         var c = 0;
         $("#colorSel").find("option").remove().end().append("<option id='none2' value='colorIsNone'>옵션 선택</option>");
         $.each(result, function(i){
            $("#colorSel").append("<option id='option" + i +"'value='"+result[i]+"'>"+result[i]+"</option>")
            c++;
         }); 
            
            //set Disible
            for (var i = 0; i < c; i++) {
               var el = $("#option"+i);
               if(el.val().split("[")[1]=="품절]"){
                  $(el).attr('disabled','disabled');
               }
            }
      },
      
      //Exception
      error: function (jqXHR, textStatus, errorThrown) {
         alert("오류가 발생하였습니다.");
      }   
        
   });
}

//   옵션 선택 삭제
   function deleteOption(btnClass) {
         
         var del = $(btnClass).attr("class");
         sizeList[del] = "";
         colorList[del] = "";
         stockList[del] = "";
         
         $('#' + del).empty();
         $('#' + del).remove();
         
         var total = 0;
         
         for (var i = 0; i < stockList.length; i++) {
            if(stockList[i] != ""){
            total = total + parseInt(stockList[i]);
            }
         }
         $("#total").html(total*'${productVO.product_price}'); 
         total = 0;
   }
   
//   옵션 선택
   function selectOptionend() {
       try{
             color = $("#colorSel option:selected").val().split(" ")[0];
          }catch(e){
             color = $("#colorSel option:selected").val();
          }
      for (var i = 0; i < sizeList.length; i++) {
         if(sizeList[i] == $("#sizeSel option:selected").val() && colorList[i] == color){
         
         $("#check").attr("name", "select");
         $('#colorSel option:eq(0)').attr('selected', 'selected');
         $('#sizeSel option:eq(0)').attr('selected', 'selected');
         $('#colorSel option:eq(0)').removeAttr('selected');
         $('#sizeSel option:eq(0)').removeAttr('selected');
         $('#colorSel option:not(option:first)').remove();
         alert("이미 선택된 옵션입니다.");
         return false;
      }
   }
      if($("#colorSel option:selected").val() != ""){

               sizeList.push($("#sizeSel option:selected").val());
               colorList.push(color);
               stockList.push(1);
               
               var options = $("#sizeSel option:selected").val() + " / " + color;
               var stockOption= "";
               
               var cc;

              try{
                 cc = $("#colorSel option:selected").val().split(" : ")[1].split(")")[0];
              }
               catch (e) {
                  cc=5;
            }
                 
              
               

               

                  for (var i = 1; i <= cc; i++) {
                         stockOption =   stockOption +"<option value='" + i + "'>"+ i +"</option>";
                      }
      
               
               
               
               
               
               $("#orderOption").append("<tr id = '" + count 
                     + "' class='selOption')><td class='optionTabletd1'>"
                     + options  
               +"</td><td class='optionTabletd2'><select id=" + count +" onchange='totalPrice(this.id)'>" 
               + stockOption + "</select></td><td class='optionTabletd3'><a href='#'><span class = '" 
               + count 
               + "' onclick='deleteOption(this)'> x </span></a><td></tr>");
            
            $("#check").attr("name", "select");
            $('#colorSel option:eq(0)').attr('selected', 'selected');
            $('#sizeSel option:eq(0)').attr('selected', 'selected');
            $('#colorSel option:eq(0)').removeAttr('selected');
            $('#sizeSel option:eq(0)').removeAttr('selected');
            $('#colorSel option:not(option:first)').remove();
            count = count + 1;
      }
      var total = 0;
      
      for (var i = 0; i < stockList.length; i++) {
         if(stockList[i] != ""){
         total = total + parseInt(stockList[i]);
         }
      }
      $("#total").html(total*'${productVO.product_price}'); 
      total = 0;
   }
   
   
//   수량 재선택, 총합
   function totalPrice(stockID) {
      stockList[stockID] = $("#"+ stockID + " option:selected").val();
       
      var total = 0;
      
      for (var i = 0; i < stockList.length; i++) {
         if(stockList[i] != ""){
         total = total + parseInt(stockList[i]);
         }
      }
      $("#total").html(total*'${productVO.product_price}'); 
      total = 0;
   }

//   옵션 중 컬러 먼저 선택
   function selectOption() {
      
      //상위 사이즈 선택 창의 현재 select 벨류가 sizeIsNone 이면 사이즈 선택 알렛
      if($("#check").attr("name") == "noneSelect"){
         if($("#sizeSel option:selected").val() == "sizeIsNone"){
   
            alert("사이즈를 먼저 선택해주세요.");
         
         }
      }
      $("#check").attr("name", "noneSelect");

   }
   
   var sendCode = "";
   var client =  "${nowUser.client_id}";
   
//   장바구니 클릭
    function cart(){
   if (client==""){
         alert("로그인이 필요합니다.");
         return false; 
    }else if("${nowUser.client_registerDate}" == "0000-00-00 00:00"){
       alert("관리자 모드에서는 주문이 불가능합니다.");
        return false; 
   }else if($('.selOption').length == 0){
         alert("선택된 상품이 없습니다.");
         return false; 
      }
      alert("상품 "+ $('.selOption').length + "개가 장바구니에 담겼습니다.");
      
      for (var i = 0; i < sizeList.length; i++) {
         if(sizeList[i]!=""|| colorList[i]!="" || stockList[i]!=""){
            sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
         }
      }
      var confirmFlag = confirm("장바구니로 이동하시겠습니까?");
         var idx = ${productVO.product_idx};
         location.href = "insertCart?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode+"&confirmFlag="+confirmFlag;
   }
   
    var idx = ${productVO.product_idx};
//   바로 결제 클릭
    function pay(){
       if (client==""){
         alert("로그인이 필요합니다.");
         return false;
       }else if("${nowUser.client_registerDate}" == "0000-00-00 00:00"){
          alert("관리자 모드에서는 주문이 불가능합니다.");
           return false; 
      }else if($('.selOption').length == 0){
         alert("선택된 상품이 없습니다.");
         return false; 
      }
      for (var i = 0; i < sizeList.length; i++) {
            if(sizeList[i]!=""|| colorList[i]!="" || stockList[i]!=""){
                 sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
              }      
         }
         var idx = ${productVO.product_idx};
         location.href = "dPay?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode;
   }





</script>
</head>
<body>
   
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   <%@ include file="/WEB-INF/views/include/nav.jsp"%>

   <div id="contents">
      <!-- 상품 선택 -->
      <span id="check" style="display: none;" name="noneselect"></span>
      <div id="mainContents">
         <!-- 이미지 -->
         <div class="imgDiv">
            <img src="${productVO.product_imgPath}_1.jpg">
         </div>

         <!-- 상품 전체 품절 -->
         <c:if test="${productVO.product_stock == 0}">
            <div class="explainDiv">
               <div class="nameDiv">${productVO.product_name}<img style="margin-left: 5px;" src="./resources/images/icon/soldOut.gif"></div>
               <hr/>
               <div style="border: 1px solid #d4c8cc; padding: 15px;border-radius: 10px;">품절된 상품입니다.</div>
            </div>
         </c:if>



         <fmt:parseNumber var="sizeNum" type="number"
            value="${fn:length(size)}" />
         <fmt:parseNumber var='colorNum' type='number'
            value='${fn:length(color)}' />


         <!-- 상품 정보 -->
         <div class="explainDiv">

            <c:if test="${productVO.product_stock != 0}">
               <div class="nameDiv">${productVO.product_name}</div>
               <hr/>
               
               <table id="optionTable">
                  <tr>
                     <th>PRICE</th>
                     <td class="price">${productVO.product_price}원</td>
                  </tr>
                  <tr>
                     <th>SIZE</th>
                     <td class="size">
                     
                     <select id="sizeSel" onclick="sizeOptionDelete()" onchange="showOption(this.value);">
                        <option id="none" value="sizeIsNone">옵션 선택</option>
                        <c:if test="${sizeNum > 0}">
                           <c:forEach var="i" begin="0" end="${sizeNum-1}" step="1">
                              <option value="${size[i]}">${size[i]}</option>
                           </c:forEach>
                        </c:if>
                     </select>
                     </td>
                  </tr>
                  <tr>
                     <th>COLOR</th>
                     <td class="color" id="colorSelDiv">
                        <select id="colorSel" name="option" onchange="selectOptionend()">
                        <option id="none2" value="colorIsNone">옵션 선택</option>
                     </select>
                     </td>
                  </tr>
               </table>
               
               <table id="orderOption">
               
               </table>
               
               <!-- 선택된 상품의 총합 -->
               <div id="totalPrice">
                  총 상품 금액<span id="total">0</span>
               </div>
               <div class="btnDiv">
                     <button id="cartBtn" class="btn btn-secondary" onclick="cart()">장바구니</button>
                     <button id="payBtn" class="btn btn-secondary" onclick="pay()">바로결제</button>
               </div>
            </c:if>


         </div>
      </div>


 <div class="infoDiv">
      <hr id="PRODUCTDETAIL"/>
      <ul>
         <li><a style="color: #d4c8cc;">PRODUCT DETAIL</a></li>
         <li><a href="#SHOPPINGGUIDE">SHOPPING GUIDE</a></li>
         <li><a href="#REVIEW">REVIEW</a></li>
      </ul>

      <!-- 상품 사진 -->
<c:if test="${productVO.product_imgPathStock> 0}">
   <c:forEach var="i" begin="2" end="${productVO.product_imgPathStock}" step="1">
      <div class="infoImg" style="margin: 4%;">
         <img id="infoImg" src= "${productVO.product_imgPath}_${i}.jpg">
      </div>
   </c:forEach>
</c:if>
</div>
<hr id="SHOPPINGGUIDE"/>
      <ul>
         <li><a href="#PRODUCTDETAIL">PRODUCT DETAIL</a></li>
         <li><a style="color: #d4c8cc;">SHOPPINGGUIDE</a></li>
         <li><a href="#REVIEW">REVIEW</a></li>
      </ul>
<div class="SHOPPINGGUIDE">


<span class="infoTitle">상품발송 </span>
<br/>
저희 쇼핑몰은 평일 오후 2시 이전 결제완료건에 한하여, 당일 발송을 원칙으로 합니다.<br/>
단, 주문상품의 입고지연 및 주문제작 상품 경우, 발송기간이 2~3일 가량 지연될 수 있습니다.<br/>
<br/>
<br/>
평일(월~금) 주문건 오후 2시 이전 결제 → 당일 발송. 오후 6시 상품 출고<br/>
<br/>
<br/>
평일(월~금) 주문건 오후 2시 이후 결제건 → 익일 발송. 다음날 오후 6시 상품 출고<br/>
<br/>
<br/> 
토/일/공휴일 결제건 → 다음 영업일 기준 오후 6시 상품 출고<br/>
<br/>
<span class="infoTitle">배송기간</span><br/>
<br/>
<i>국내 상품</i>은 상품발송일로 부터, 택배사의 사정에 따라 1일~3일 가량 소요될 수 있습니다.<br/>
<br/>
<i>해외 상품</i>은 상품발송일로 부터, 택배사의 사정에 따라 12일~15일 가량 소요될 수 있습니다.<br/>
<br/>
<i>주말/공휴일</i>을 포함하거나, 도선산간 지역일 경우 추가적인 배송지연이 발생할 수 있습니다.<br/>
<br/>
<span class="infoTitle">배송요금</span><br/>
<br/>
8만원 이하 결제건 : 배송비 2,500원 (주문 결제시, 부담)<br/>
<br/>
<i>8만원 이상 결제건 : 무료 배송</i><br/>
<br/>
단, 아래와 같은 경우 별도의 추가 배송비(도선료)가 발생 됩니다.<br/>
<br/>
- 도서산간/제주도 : 추가요금 500원<br/>
<br/>
- 국내 기타/섬 지역 : 4,500원<br/>
<br/>
- 해외 발송 : 전화문의<br/>
<br/>
<span class="infoTitle">배송조회</span><br/>
<br/>
우체국 택배<br/>
<br/>
배송조회는 택배사의 홈페이지 또는 전화문의를 이용 하시거나,<br/>
쇼핑몰 내 마이페이지 > 배송조회를 통해 확인하실 수 있습니다.<br/>
</div>

<hr id="REVIEW"/>
   <ul>
         <li><a href="#PRODUCTDETAIL">PRODUCT DETAIL</a></li>
         <li><a href="#SHOPPINGGUIDE">SHOPPING GUIDE</a></li>
         <li><a style="color: #d4c8cc;">REVIEW</a></li>
   </ul>
 
<!-- REVIEW -->
<b style="margin:10px;">총 ${reviewList.totalCount}개의 리뷰가 있습니다.</b>

   <c:set var="list" value="${reviewList.reviewList}"/>
   
   <!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
<table id="reviewTable">
   <c:if test="${list.size() != 0}">
   <c:set var="idx" value="${(currentPage-1)*5}"/>
   
   
   <c:forEach  var="i" begin="0" end="${list.size()-1}" step="1">
   <tr style="background-color: #f3e8e8;">
      <td align="center" width="10%">${reviewList.totalCount-idx}</td>
   <c:set var="idx" value="${idx+1}"/>
      <td align="center" width="20%">
         <c:set var="review_client_name" value="${fn:replace(fn:trim(list[i].review_client_name), '<', '&lt;')}"/>
         <c:set var="review_client_name" value="${fn:replace(review_client_name, '>', '&gt;')}"/>
         ${review_client_name}
      </td>
      <td align="left">
         <c:forEach  var="j" begin="0" end="${list[i].review_productGrade-1}" step="1">
            <span style="color: orange;">★</span>
         </c:forEach>
         
         <c:if test="${list[i].review_productGrade != 5}">
         <c:forEach  var="j" begin="0" end="${4-list[i].review_productGrade}" step="1">
            <span style="color: orange;">☆</span>
         </c:forEach>
         </c:if>
         

      
      </td>
      <td align="center"  width="20%">
            ${list[i].review_writeDate}
      </td>
   </tr>
   <tr>

      <td colspan="4">
         <c:set var="review_content" value="${fn:replace(fn:trim(list[i].review_content), '<', '&lt;')}"/>
         <c:set var="review_content" value="${fn:replace(review_content, '>', '&gt;')}"/>
         <c:if test="${list[i].review_imgPath !=''}">
            <img class="imgTag" src="${pageContext.request.contextPath}/resources/images/reviewImages/${list[i].review_imgPath}" alt="이미지 파일을 찾을 수 없습니다."/><br/>
        </c:if> 
            ${list[i].review_content}
      </td>
   </tr>
  
      <tr><td colspan="4"></td></tr>
   </c:forEach>
            
   
   
   
   </c:if>
   </table>
   <div id="pagingBtn">
   <!-- 페이지 이동 버튼 -->

      
      <!-- 처음으로, 10페이지 앞으로 -->
      <c:if test="${reviewList.startPage > 1}">
         <button class="btn btn-secondary" onclick="location.href='?product_idx=${productVO.product_idx}&currentPage=1#REVIEW'" title="첫 페이지로 이동합니다.">&lt;&lt;</button>
         <button class="btn btn-secondary" onclick="location.href='?product_idx=${productVO.product_idx}&currentPage=${reviewList.startPage - 1}#REVIEW'" 
               title="이전 5페이지로 이동합니다.">&lt;</button>
      </c:if>


      <!-- 페이지 이동 -->
      <c:forEach var="i" begin="${reviewList.startPage}" end="${reviewList.endPage}" step="1">
      
         <c:if test="${i == reviewList.currentPage}">
            <button class="btn btn-secondary" disabled="disabled">${i}</button>
         </c:if>
         
         <c:if test="${i != reviewList.currentPage}">
            <button class="btn btn-secondary" onclick="location.href='?product_idx=${productVO.product_idx}&currentPage=${i}#REVIEW'" title="${i}페이지로 이동합니다." >${i}</button>
         </c:if>
      
      </c:forEach>
      
      <!-- 마지막으로, 10페이지 뒤로 -->
      <c:if test="${reviewList.endPage < reviewList.totalPage}">
         <button class="btn btn-secondary" onclick="location.href='?product_idx=${productVO.product_idx}&currentPage=${reviewList.endPage + 1}#REVIEW'" title="다음 5페이지로 이동합니다.">&gt;</button>
         <button class="btn btn-secondary" onclick="location.href='?product_idx=${productVO.product_idx}&currentPage=${reviewList.totalPage}#REVIEW'" title="마지막 페이지로 이동합니다.">&gt;&gt;</button>
      </c:if>


   </div>

   

   




   </div>
 <%@ include file="/WEB-INF/views/include/footer.jsp"%> 
</body>
</html>