<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
			<!-- myPage -->
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/myPage/images/sample.png);"></a>
	            <div align="center">
	            	<b style="color:white;font-size:1.5em">${nowUser.client_name} 님</b>&nbsp;&nbsp;
	            	<input type="button" class="btn btn-edit" value="수정" onclick="location.href='pwCheck'">
	            </div><br/><br/>
	        
	         <ul class="list-unstyled components mb-5">
	          
	          
	          <li>
	              <a href="myOrderView">주문목록 조회</a>
	          </li>
	          
	          <li class="active">
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">정보관리</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="pwCheck">정보수정</a>
                </li>
                <li>
                    <a href="infoDel">회원탈퇴</a>
                </li>
	            </ul>
	          </li>
	          
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">리뷰관리</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="addReview">구매후기 쓰기</a>
                </li>
                <li>
                    <a href="allReview">내가 쓴 구매후기</a>
                </li>
              </ul>
	          </li>
	          
	          <li>
              	<a href="qnaBoard">고객센터</a>
	          </li>
	          
	          <li>
             	 <a href="cartView">장바구니</a>
	          </li>
	        </ul>

	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>
    
      
      
    <script src="${pageContext.request.contextPath}/resources/myPage/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/myPage/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/myPage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/myPage/js/main.js"></script>
      


</body>
</html>