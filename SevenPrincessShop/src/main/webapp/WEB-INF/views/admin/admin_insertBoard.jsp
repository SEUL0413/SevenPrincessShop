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

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height: 400,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: false,                 // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",			   // 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
		  
	});
	
	function insertAnswer(){
		//content 추출
		let content= $("p").text();
		content = content.substring(6,content.indexOf("Summernote")); //입력한 내용만 추출하기
		
		//title 추출
		let title = $("input[name=title]").val();
		location.href="insertAnswer?content="+content+"&title="+title+"&q_idx="+${q_idx};
	}
	
	
</script>

</head>
<body>
	
	<h2 align="center" style="margin-top: 60px; margin-bottom: 60px;">[관리자] 답변글 작성하기</h2>
	
	
	
	<form name="form1">
		<table style="margin:auto;text-align:center">
			<tr><th>질문글 번호 : ${q_idx}</th></tr>
			<!-- 1) 제목 -->
			<tr>
				<td style="margin-bottom: 30px">
					<input type="text" name="title" placeholder="제목을 입력하세요" size="100px" autofocus/>
				</td>
			</tr>
			<!-- 2) 내용 -->
			<tr>
				<td><div id="summernote"></div></td>
			<tr>
			<tr>
				<td align="center">
					<button class="btn btn-info" type="button" onclick="insertAnswer()">등록하기</button>
					<button type="button" class="btn btn-secondary" onclick="history.back()">목록보기</button>
				</td>
			</tr>
    	</table>
    </form>
</body>
</html>