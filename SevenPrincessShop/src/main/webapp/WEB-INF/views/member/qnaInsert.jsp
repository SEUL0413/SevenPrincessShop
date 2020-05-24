<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 위한 추가 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myPage/css/style.css">
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>


<style>
	body {
	  margin: 10px;
 	 font-size: 14px;
	}

	select {
	  width: 120px;
	  padding: .3em .3em;
	  font-family: inherit;
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border: 1px solid #999;
	  border-radius: 0px;
}

	select::-ms-expand {
	  /* for IE 11 */
	  display: none;
}

</style>

</head>
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
			<h2 style="margin-bottom: 30px;">고객센터</h2><hr/>
			
			<div style="width:60%">
				<form action="insertQ" method="post">
			        <div class="form-group">
			            <label for="exampleFormControlInput1">분류</label>
			            &nbsp;&nbsp;
			            <select name="type">
			            	<option>배송문의</option>
			            	<option>환불문의</option>
			            	<option>상품문의</option>
			            	<option>주문변경</option>
			            	<option>기타문의</option>
			            </select>
			          </div>
			        <div class="form-group">
			              <label for="exampleFormControlInput1">제목</label>
			            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요." required>
			          </div>
			          <div class="form-group">
			            <label for="exampleFormControlTextarea1">내용</label>
			            <textarea class="form-control"  maxlength="300" id="exampleFormControlTextarea1" name="content" rows="10" required></textarea>
			          </div>
			        <input type="submit" class="btn btn-secondary" value="등록하기">
			        <button type="button" class="btn btn-secondary" onclick="history.back()">목록으로</button>
			    </form>
		    </div>
		   </div>
		  </div>
		  
		<!-- footer 설정 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		  

</body>
</html>