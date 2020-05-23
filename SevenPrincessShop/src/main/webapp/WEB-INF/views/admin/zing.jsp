<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>ZingSoft Demo</title>
<script type="text/javascript">








var searchRequest = new XMLHttpRequest();
var insertRequest = new XMLHttpRequest();

/*
function searchFunction() {
	var url = "./AjaxSearch?name=" + encodeURIComponent(document.getElementById("userName").value)
	searchRequest.open("post", url, true);
	searchRequest.onreadystatechange = searchProcess;
	searchRequest.send(null);
}

function searchProcess() {
	if(searchRequest.readyState == 4 && searchRequest.status == 200) {
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		var object = eval("(" + searchRequest.responseText + ")");
		var result = object.result;
		for (var i = 0; i < result.length; i++) {
			var row = table.insertRow(0);
			for (var j = 0; j < result[i].length - 1; j++) {
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j + 1].value;
			}
		}
	}
}
*/

function searchFunction() {
	var url = "./AjaxSearch?name=" + encodeURIComponent(document.getElementById("userName").value)
	fetch(url, {
		method: "post",
	}).then(function(response) {
		response.text().then(function(text) {
			if (response.status == 200) {
				var table = document.getElementById("ajaxTable");
				table.innerHTML = "";
				var object = eval("(" + text + ")");
				var result = object.result;
				for (var i = 0; i < result.length; i++) {
					var row = table.insertRow(0);
					for (var j = 0; j < result[i].length - 1; j++) {
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j + 1].value;
					}
				}
			} else {
				alert("전송 에러");
			}
		});
	});
}
/*
function searchFunction() {
	var url = "./AjaxSearch?name=" + encodeURIComponent(document.getElementById("userName").value)
	fetch(url, {
		method: "post",
	}).then(response => {
		response.text().then(text => {
			if (response.status == 200) {
				var table = document.getElementById("ajaxTable");
				table.innerHTML = "";
				var object = eval("(" + text + ")");
				var result = object.result;
				for (var i = 0; i < result.length; i++) {
					var row = table.insertRow(0);
					for (var j = 0; j < result[i].length - 1; j++) {
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j + 1].value;
					}
				}
			} else {
				alert("전송 에러");
			}
		});
	});
}
*/
onload = function() {
	searchFunction()
}

function insertFunction() {
	var url = "./AjaxInsert?name=" + encodeURIComponent(document.getElementById("name").value) + 
			               "&age=" + encodeURIComponent(document.getElementById("age").value) +
			               "&gender=" + encodeURIComponent($("input[name=gender]:checked").val()) +
			               "&email=" + encodeURIComponent(document.getElementById("email").value);
	insertRequest.open("post", url, true);
	insertRequest.send(null);
	insertRequest.onreadystatechange = insertProcess;
}

function insertProcess() {
	if(insertRequest.readyState == 4 && insertRequest.status == 200) {
		var result = insertRequest.responseText;
		if(result != 1) {
			alert("저장실패!!!");
		} else {
			var userName = document.getElementById("userName");
			var name = document.getElementById("name");
			var age = document.getElementById("age");
			var email = document.getElementById("email");
			userName.value = "";
			name.value = "";
			age.value = "";
			email.value = "";
			searchFunction();
		}
	}
}

</script>	

</head>
<body>

<br/>
<div class="container">
	<div class="form-group row pull-right">
		<div class="col-xs-8">
			<input class="form-control" type="text" size="20" id="userName" onkeyup="searchFunction()"/>
		</div>
		<div class="col-xs-2">
			<button class="btn btn-primary" type="button" onclick="searchFunction()">검색</button>
		</div>
	</div>
</div>

<table class="table" align="center" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color: #fafafa; text-align: center;">이름</th>
			<th style="background-color: #fafafa; text-align: center;">나이</th>
			<th style="background-color: #fafafa; text-align: center;">성별</th>
			<th style="background-color: #fafafa; text-align: center;">이메일</th>
		</tr>
	</thead>
	<tbody id="ajaxTable">
		<tr>
		
		</tr>
	</tbody>
</table>

<!-- 회원등록 양식 추가 -->
<div class="container">
	<table class="table" align="center" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: $fafafa; text-align: center;">회원등록</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>이름</h5></td>
				<td><input class="form-control" type="text" id="name" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>나이</h5></td>
				<td><input class="form-control" type="text" id="age" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>성별</h5></td>
				<td>
					<div class="form-group" style="text-align: center; margin: 0 auto;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="남자" checked="checked">남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="gender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>이메일</h5></td>
				<td><input class="form-control" type="text" id="email" size="20"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary pull-right" type="button" onclick="insertFunction()">입력</button>
				</td> 
			</tr>
		</tbody>
	</table>
</div>


</body>
 
</html>