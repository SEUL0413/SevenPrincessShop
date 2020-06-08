<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--myPage css 위한 추가 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myPage/css/style.css">
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/script/myCart.js"></script>

</head>

<script type="text/javascript">

   function allOrder(sizeCountIdx){
         //주문 목록 개수
         var size = sizeCountIdx.split("*")[0];
         //품절 목록 개수
         var count = sizeCountIdx.split("*")[1]; 
         //품절 목록 idx
         var idxs = sizeCountIdx.split("*")[2].substring(1);
         //alert(idxs);
         
         if(size==count){
            alert("주문 가능한 상품이 없습니다");
         }else{
            location.href='updateStatus?idxs='+idxs;
         }
         
         
         
   }
  // pay.jsp에서 뒤로왔을때 ready를 cart로 바꿔준다.
   window.onpageshow = function (event){
	      if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	         location.href ="backtothehead"; 
	      }
	   }

</script>

<body>

   <!-- header / nav 설정 -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   <%@ include file="/WEB-INF/views/include/nav.jsp"%>

   <div class="wrapper d-flex align-items-stretch">
   <!-- myPage 설정 -->
   <%@ include file="/WEB-INF/views/include/myCategory.jsp"%>
      
      <div id="content" class="p-4 p-md-5">
         <!-- myPage top bar 설정 -->
         <%@ include file="/WEB-INF/views/include/myTopBar.jsp"%>
         <h2>장바구니</h2><hr/><br/>
         <form>
            <table style="width:80%; cellpadding:5; cellspacing:0;" align="center">
               <tr height="50px" style="background-color: #F2F2F2">
                  <th width="80" align="center"><input type="checkbox" name="all" id="all" onclick="allChk(this.checked)"></th> <!-- 클릭시 전체 선택 -->
                  <th width="300" align="center"></th> <!-- 상품 이미지 --> 
                  <th width="600" align="center">주문 상품 정보</th> <!-- 상품 타이틀 + 선택 옵션 + 옵션변경 버튼  --> 
                  <th width="300" align="center">수량</th>
                  <th width="200" align="center">가격</th>
                  <td width="80" align="center"></td>  <!-- 취소 버튼 -->
               </tr>
               
               <c:set var="list1" value="${listO}"/>  <!-- 주문리스트vo -->
               <c:set var="p" value="${listP}"/>     <!-- 상품정보 vo -->
               <c:set var="s" value="${stocks}"/> <!-- 상품 옵션별 stock 개수 -->
               
               <!-- 주문금액 합계를 위한 변수 선언 -->
               <c:set var = "sum" value="0"/>
               <!-- 품절 목록 개수 count 변수 -->
               <c:set var="soldOutCount" value="0"/>
                <!-- 품절 목록 idx체크 변수 -->
               <c:set var="soldOutIdx" value=""/>
               
               <!-- 리스트에 글이 하나도 없을시 table에 아래 멘트 기재 -->
               <c:if test="${list1.size() == 0}">
                  <tr>   
                     <td colspan="5" align="center">
                        <h5>장바구니에 저장된 상품이 없습니다.</h5>
                     </td>
                  </tr>
               </c:if>
               
               <c:if test="${list1.size() !=0}">
                  <c:forEach var = "o" items="${list1}" varStatus="status">
                     <!-- 건별 결제금액 세팅 -->
                     <c:if test ="${p.get(status.index).product_stock eq 0}">
                           <c:set var="amount" value="0"/>   
                     </c:if>
                     <c:if test ="${p.get(status.index).product_stock!=0}">
                        <c:set var="amount" value="${o.orderList_stock*p.get(status.index).product_price}"/>
                     </c:if>
                     
                     <tr height="220px">
                        <!-- 1.항목 체크박스 -->
                        <td align="center">
                           <c:if test ="${s.get(status.index) <=0}">
                              <input type="checkbox" name="chk" class="chk" value="${o.orderList_idx}" disabled/>
                           </c:if>
                           
                           <c:if test ="${s.get(status.index)>0}">
                              <input type="checkbox" name="chk" class="chk" value="${o.orderList_idx}"/>
                           </c:if>
                        </td>
                        <!-- 2.상품 이미지 -->
                        <td align="center">
                           <img src="${p.get(status.index).product_imgPath}_1.jpg" width="160px" height="160px"/>
                        </td>
                        
                        
                        <!-- 3.상품 이름 -->
                        <td align="center">
                           <a href="productInfo?product_idx=${p.get(status.index).product_idx}" class="aLink-myPage" style="font-size:22px">${p.get(status.index).product_name}</a><br/><br/>
                           <!--4.옵션(색상/사이즈) -->
                           <span>${o.orderList_color}</span> / <span>${o.orderList_size}</span> SIZE
                           
                        </td>
                        
                        <!--5.상품 주문개수 -->
                        <td align="center">
                           <div class="row" style="margin-left: 20px">
                                 <c:if test ="${s.get(status.index)>0}">
                                    <div class="form-group col-xs-3" style="margin-left: 15px">
                                    
                                       <c:set var="s_stock" value="${s.get(status.index)}"/>
                                       <c:set var="o_stock" value="${o.orderList_stock}"/>
                                       
                                       <select name="amount" id="${status.current.orderList_idx}" value="${o.orderList_stock}" class="form-control" style="width:75px">
                                             <!-- 잔여 재고보다 주문개수가 적은 경우 -->
                                             <c:if test="${s_stock>=o_stock}">
                                                   <!-- 4 3 잔여재고가 5보다 작을 경우 -->
                                                 <c:if test="${s_stock<5}">
                                                      <c:forEach var="i" begin="1" end="${s_stock}">
                                                         <option value="${i}" <c:if test="${o_stock eq i}">selected</c:if>>${i}</option> 
                                                      </c:forEach>
                                                  </c:if>
                                                  
                                                   <!-- 10 2 잔여재고가 5보다 클 경우  -->
                                                  <c:if test="${s_stock>=5}">
                                                      <c:forEach var="i" begin="1" end="5">
                                                          <option value="${i}" <c:if test="${o_stock eq i}">selected</c:if>>${i}</option> 
                                                      </c:forEach>
                                                   </c:if>
                                               </c:if>
                                               
                                                <!-- 잔여 재고보다 주문개수가 많은 경우  -->
                                             <!-- 3 4 -->
                                             <c:if test="${s_stock  < o_stock}">
                                                <c:forEach var="i" begin="1" end="${s_stock}">
                                                    <option value="${i}" <c:if test="${o_stock eq i}">selected</c:if>>${i}</option> 
                                                </c:forEach>
                                             </c:if> 
                                               
                                     </select>
                                     
                                 </div>
                                 <div class="form-group col-xs-3">
                                       <!-- c:forEach의 varStatus 속성 이용 => 버튼의 value 값을 해당 턴의 idx로 세팅  -->
                                       <button type="button" class="btn btn-secondary" onclick="stockChange(this.value)" value="${status.current.orderList_idx}">적용</button>
                                   </div>
                                   
                                   <!-- 주문하고자 하는 상품의 재고수가 부족할떄 남은 재고수 띄어주기 -->
                                   <c:if test="${o.orderList_stock>s.get(status.index)}">
                                      <span style="margin-left: 25px">
                                         <button class="btn" style="background-color: #8a7385a1;color: white;border-radius: 10px" disabled>품절임박</button>&nbsp;&nbsp;&nbsp;
                                      </span>
                                   </c:if>
                               </c:if>
                                 
                                 <!-- 품절인 상품일 경우 품절 아이콘 띄어주기 -->
                                 <c:if test ="${s.get(status.index) <=0}">
                                    <c:set var="soldOutCount" value="${soldOutCount+1}"/>
                         
                                    <div style="margin-left:70px">
                                         <button class="btn" style="background-color: #8a7385a1;color: white;border-radius: 10px" disabled>품절</button>&nbsp;&nbsp;&nbsp;
                                    </div>
                                 </c:if>
                                 <c:if test ="${s.get(status.index)>0}">
                            <c:set var="soldOutIdx" value="${soldOutIdx}_${o.orderList_idx}"/>
                                 </c:if>
                              </div>
                           
                        </td>
                        <!--6.상품 총 가격-->
                        <td align="center">
                           <b><fmt:formatNumber value="${amount}" pattern="#,###" />원</b>
                        </td>
                        <td>
                        <!--7.취소 버튼(X) -->
                           <button type="button" class="btn btn-basic" name="cxl" onclick="boxCxl(this.value)" value="${o.orderList_idx}">X</button>
                        </td>
                     </tr>
                     <!-- 총 결제 금액 계산 : sum 변수에 상품 가격을 반복해서 합산한다. -->
                     
                     <c:set var = "sum" value="${sum+amount}"/>
                  </c:forEach>
               </c:if>
               
               <tr>
                  <td colspan="6" align="right">
                     <input type="button" class="btn btn-secondary" onclick="chkCount()" value="선택상품 삭제"/>
                     <input type="button" class="btn btn-secondary" onclick="deleteAll()" value="전체상품 삭제"/>
                  </td>
               </tr>
            </table>
            
            <hr/>
            
            <div align="center" style="height: 300px;margin-top: 60px">
               <!-- 총 결제금액 천단위 구분자(,) 형식 지정-->
                  총 상품가격 
               <b style="font-size: 36px">
                  <fmt:formatNumber value="${sum}" pattern="#,###" />
               </b> 원
               <button class="btn btn-light" style="font-size: 20px;border: 2;background-color: #E6E6E6" disabled>+</button>
               <!-- 배송비 : 8만원 이상 구매시 배송비 무료 --> 
               <c:set var ="delivery" value="2500"/>
               <c:if test="${sum>=80000 || sum==0}"> 
               <c:set var="delivery" value="0"/>
               </c:if>
                  총 배송비 <b style="font-size: 36px"><fmt:formatNumber value="${delivery}" pattern="#,###"/></b> 원
               <button class="btn btn-light" style="font-size: 20px;border: 2;background-color: #E6E6E6" disabled>=</button>
                  총 주문금액 
               <b style="font-size: 36px">
                  <fmt:formatNumber value="${sum+delivery}" pattern="#,###" />
               </b> 원<br/><br/><br/>
               
               
               <!-- 현재 유저 idx(session)=> DB에 있는 orderList='cart'인 목록 다 가지고 와서 뿌리고 결제 진행 -->
               <c:if test="${list1.size()!=0}">
                  <button type="button" class="btn btn-secondary" onclick="allOrder(this.value)" value="${list1.size()}*${soldOutCount}*${soldOutIdx}">전체상품 주문하기</button>
               </c:if>
               
               <!-- 만약 장바구니 내역이 없다면 alert 띄어주기 -->
               <c:if test="${list1.size()==0}">
                  <button type="button"  class="btn btn-secondary" onclick="alert('장바구니 내역이 존재하지 않습니다.')">전체상품 주문하기</button>
               </c:if>
               
               <!-- 선택된 주문idx(내가 넘겨주는 값)=> vo 하나씩 select해서 arrayList에 담아서 뿌리고 결제 진행 -->
               <button type="button" class="btn btn-secondary" onclick="selectOrder(this.value)" value="1">선택상품 주문하기</button>
            
            </div>
         </form>
      </div>
   </div>
   <!-- footer 설정 -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>