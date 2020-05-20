<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	<h2 align="center" style="margin-top: 60px; margin-bottom: 60px;">1:1 문의</h2>
	
	<div style="width:50%; margin-left:25%">
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
	            <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="10" required></textarea>
	          </div>
	        <input type="submit" class="btn btn-info" value="등록하기">
	        <button type="button" class="btn btn-secondary" onclick="history.back()">목록으로</button>
	    </form>
    </div>

</body>
</html>