<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<!-- 결제 완료 페이지 -->
<form action="/controller">
<div>
  <div style="width: 900px;margin-left: 300px;margin-top: 50px">
       <h2>결제완료</h2><hr/>
  </div>

   <!-- 주문 결제 상단 아이콘 -->
   <div style="margin-left: 450px;margin-bottom: 20px">
      <img style="width:700px"src="./resources/images/icon/pay2.png"/><br/>
   </div>   
    <div style="margin-left: 600px">
       <b style="font-size: 30px">주문이 완료되었습니다!</b><br/>
   </div>
   <div  style="margin-left: 680px;margin-top: 50px">
      <button class="btn btn-secondary" onclick="">메인으로 돌아가기</button>
   </div><br/><br/>
   
</div>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>