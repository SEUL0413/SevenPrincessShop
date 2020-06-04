<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
   function logout(){
      if(confirm('로그아웃 하시겠습니까?')) {
         location.href='logout';
      } else {
         location.href='#';
      }
   }
   
   function isLogin(flag){
      
      
      if(${nowUser==null}){
         alert("로그인 후 이용해주세요");
         location.href="login";
      }
      else if(flag=='1'){location.href="cartView";}
      else if(flag=='2'){location.href="qnaBoard";}
      
   }
</script>

</head>
<body>


   <!-- top bar -->

     <nav class="navbar fixed-top navbar-expand-sm navbar-light bg-light">
        <div class="container-fluid">
           <a class="navbar-brand" href="/controller/">SenvePrincessShop</a>
           
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
           </button>
           
           <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
             <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                   <div style="margin-right: 10px">
                      <c:if test="${empty sessionScope.nowUser}">
                         <a class="nav-link" href="goJoinMember" style="cursor:pointer">회원가입</a>
                      </c:if>
                      <c:if test="${not empty sessionScope.nowUser && sessionScope.nowUser.client_registerDate!='0000-00-00 00:00'}">
                         <!-- <button type="button" id="sidebarCollapse" class="btn btn-myPage" onclick="location.href='myPage'">MY</button> 혜인 원본 -->
                         <a class="nav-link" style="cursor:pointer" href="myPage">마이페이지</a>
                      </c:if>
                      <c:if test="${sessionScope.nowUser.client_registerDate=='0000-00-00 00:00'}">
                         <a class="nav-link" style="cursor:pointer" href="adminMain">관리자모드</a>
                      </c:if>
                   </div>
                </li>
                <li class="nav-item">
                   <c:if test="${empty sessionScope.nowUser}">
                       <a class="nav-link" href="login" style="cursor:pointer">로그인</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.nowUser}">
                       <a class="nav-link" onclick="logout()" style="cursor:pointer">로그아웃</a>
                    </c:if>
                </li>
                 <c:if test="${sessionScope.nowUser.client_registerDate!='0000-00-00 00:00'}">
                   <li class="nav-item">
                      <a class="nav-link" style="cursor:pointer" onclick="isLogin(this.id)" id="10">장바구니</a>
                   </li> 
                   <li class="nav-item">
                      <a class="nav-link" style="cursor:pointer" onclick="isLogin(this.id)" id="20">고객센터</a>
                   </li>
                </c:if>
                </ul>
           </div>
      </div>
   </nav>
   <!-- top bar 끝 -->
   
   
   
   <!-- 메인 배너 -->
   <div class="jumbotron text-center mb-0">
      <h1><br/>SEVEN PRINCESS SHOP</h1>
      <p>대한민국 No.1 여성의류 쇼핑몰</p>
   </div> 
   <!-- 메인 배너 끝-->







</body>
</html>