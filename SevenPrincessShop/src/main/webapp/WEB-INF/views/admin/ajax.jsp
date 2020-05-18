<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">

//	서버와 통신에 사용할 객체를 선언한다.
//	XMLHttpRequest : 자바스크립트 object로 http를 통한 송수신을 지원해 주는 객체
	var searchRequest = new XMLHttpRequest();
		
//	ajax 요청 함수
	function searchFunction() {
//		alert(document.getElementById("userName").value);
//		XMLHttpRequest객체.open("요청방식", 데이터, 동기방법)
//		동기 방법 : 동기식 => false, 비동기식 => true
//		encodeURIComponent() : 문자열을 유니코드로 인코딩 한다.
//		decodeURIComponent() : encodeURIComponent() 함수로 인코딩된 문자열을 디코딩 한다.
		var url = "/ajax?name=" + encodeURIComponent(document.getElementById("name").value)
		searchRequest.open("post", url, true);
//		onreadystatechange : ajax 요청이 완료되면 실행할 콜백 함수를 지정한다.
		searchRequest.onreadystatechange = searchProcess;
//		send() : 요청한다.
		searchRequest.send(null);
	}
	
//	ajax 요청에 의해 처리된 결과를 받아서 화면에 출력하는 작업이 실행되는 함수
	function searchProcess() {
//		alert("나는 searchFunction() 함수에서 호출되는 콜백 함수");

//		onreadystatechange로 지정한 콜백 함수의 readyState
//		0 : 실행되지 않음
//		1 : 로드 중
//		2 : 로딩 됨
//		3 : 통신 됨
//		4 : 통신 완료

//		onreadystatechange로 지정한 콜백 함수의 status
//		200 : 수신 성공
//		300 : 금지
//		400 : 페이지 없음
//		500 : 서버 오류

		if(searchRequest.readyState == 4 && searchRequest.status == 200) {
			
//			서블릿에서 수신한 데이터를 출력하기 위해 기존에 표시되던 데이터를 제거한다.
			var table = document.getElementById("ajaxTable");
			table.innerHTML = "";
			
//			서블릿에서 리턴된 문자열 데이터를 json 타입으로 변환하기 위해 괄호를 붙여서 받아 객체에 저장한다.
//			eval() : 인수로 지정된 문자열로 구성한 자바스크립트를 실행한다.
			var object = eval("(" + searchRequest.responseText + ")");	// 주의요망...
//			json 객체에서 result 라는 이름이 지정된 데이터를 얻어온다. => 화면에 출력할 데이터
			var result = object.result;
//			alert(result.length);

//			검색되서 넘어온 데이터의 개수 만큼 반복한다.
			for (var i = 0; i < result.length; i++) {
//				tbody에 넣어줄 행을 만든다.
				var row = table.insertRow(0);
//				한 행에 출력할 열의 개수 만큼 반복한다.
				for (var j = 0; j < result[i].length - 1; j++) {
//					행에 넣어줄 열을 만든다.
					var cell = row.insertCell(j);
//					열에 화면에 표시될 데이터를 넣어준다.
					cell.innerHTML = result[i][j + 1].value;
				}
			}
			
		} // if
	} // searchProcess()
		
//		페이지가 로드되자마자 화면에 데이터가 보여야 하기 때문에 onload 이벤트에서 searchFunction() 함수를 실행한다.
		onload = function() {
			searchFunction()
		}
	

</script>	
</head>
<body>

	<br/>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" type="text" size="20" id="name" onkeyup="searchFunction()"/>
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button" onclick="searchFunction()">검색</button>
			</div>
		</div>
	</div>

	<table class="table" align="center" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #fafafa; text-align: center;">아이디</th>
				<th style="background-color: #fafafa; text-align: center;">이름</th>
				<th style="background-color: #fafafa; text-align: center;">생일</th>
				<th style="background-color: #fafafa; text-align: center;">이메일</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
			<tr></tr>
		</tbody>
	</table>
</body>
</html>