<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
</head>


<style type="text/css">
	label{font-size: 18px;}
</style>

<script type="text/javascript">
	function insertAnswer(){
		//content 추출
		let content= $("#exampleFormControlTextarea1").val();
		//title 추출
		let title = $("input[name=title]").val();
		location.href="insertAnswer?content="+content+"&title="+title+"&q_idx="+${q_idx};
	}
</script>

<body>
	<!-- 관리자 header 설정 -->
	<%@ include file="/WEB-INF/views/include/adminHeader/board.jsp"%>
	
	 <!--main content start-->
      <section id="main-content">
     		<section class="wrapper">
     			<form class="container gs" name="form1" style="margin-top: 50px">
				<h2 style="margin-bottom: 60px;">답변 작성하기</h2>
					<div style="width:60%">
			        	<div class="form-group">
			        		<label>질문글 번호</label>
			        		<input type="text" name="q_idx" class="form-control" value="${q_idx}" readonly/>
			        	</div>
			       		<div class="form-group">
			              <label for="exampleFormControlInput1">제목</label>
			           	  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요." size="100px" required>
			          	</div>

			          <div class="form-group">
			            <label for="exampleFormControlTextarea1">내용</label>
			            <textarea class="form-control"  maxlength="300" id="exampleFormControlTextarea1" name="content" rows="10" required></textarea>
			          </div>

			          <div align="center">
			        	<button class="btn btn-secondary" type="button" onclick="insertAnswer()">등록하기</button>
			       		<button type="button" class="btn btn-secondary" onclick="history.back()">목록보기</button>
		   		 	 </div>
		   		 	 
		   		</div>
			  </form>
		</section>
	</section>
    <!-- 관리자 footer 설정 -->
	<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>
</body>
</html>