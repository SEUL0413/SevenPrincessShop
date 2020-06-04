<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<!-- jstl 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>

<style>
	
	#d2{
		float:left;
		margin-right: 50px;
	}
	
	#d3{
		display:table;
		float: left;
		width:200px;
   		height:100px;
	}
	
	#p1{
		display:table-cell; 
		text-align:center; 
		vertical-align:middle;
	}
	

	table{
		width:700px;
		border: 2px solid #D8D8D8;
		margin-top:60px; 
		width:600px;
		border-radius: 20px
	}
	
	.btn-star{
		font-size: 30px;
		color: orange;
	}
</style>

<script type="text/javascript">

	$(window).on('beforeunload', function() {
	    return '이 페이지를 벗어나면 현재 작성중인 내용이 지워집니다.';
	});

	function gradeChk(id){  //id : 별점 개수 (ex 3개)
		for(let i=0;i<5;i++){
			let star = document.getElementById(i+1);
			star.innerHTML = "★";
		}
	
		for(let i=5;i>id;i--){ 
			let star = document.getElementById(i);
			star.innerHTML = "☆";
		}
		
		
		let grade="";
		
		switch(id){
			
			case "1":grade="나쁨";break;
			case "2":grade="별로";break;
			case "3":grade="보통";break;
			case "4":grade="좋음";break;
			case "5":grade="최고";break;
		}
		
		$("#grade").text(grade);
		
		$("#hidden").attr("value",id);
		
	}
	
	function uploading() {
		
		//파일명 구하기
		var fileValue = $("#reveiw_file").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
		
		$("label[for='customFile']").text(fileName);
		
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

			<h2>구매후기 작성</h2><hr/>
		
			<form name="insertReview" class="form" action="insertR?orderIdx=${order.orderList_idx}&productIdx=${product.product_idx}" enctype="multipart/form-data" method="post" accept-charset="UTF-8">
				<table style="width:700px">
						<tr style="background-color: #F2F2F2;height:50px">
							<th colspan="2" style="text-align: left">&nbsp;&nbsp;주문일 : ${order.orderList_orderDate}</th>
						</tr>
						<tr>
							<!-- 상품 이미지 -->
							<td style="height:300px;width: 200px">
								<div style="margin-left: 40px">
									<img src="${product.product_imgPath}_1.jpg"  style="width: 100%; max-width: 200px; vertical-align: middle"/>
								</div>
							</td>
							<!-- 상품 이름/ 선택 옵션 -->
							<td style="text-align: center">
								<div>
									<h4>${product.product_name}</h4><br/>
									<h5>${order.orderList_size} / ${order.orderList_color} / ${order.orderList_stock} 개</h5>
								</div>
							</td>
						</tr>
					</table>
				<hr/>
				
				
				<div>
					<br/>
					<h5>리뷰 별점</h5>
					<button class="btn btn-basic btn-star" id="1" value="1" onclick="gradeChk(this.id)" type="button" >☆</button>
					<button class="btn btn-basicn btn-star" id="2" value="2" onclick="gradeChk(this.id)" type="button">☆</button>
					<button class="btn btn-basic btn-star" id="3"  value="3" onclick="gradeChk(this.id)" type="button">☆</button>
					<button class="btn btn-basic btn-star" id="4"  value="4"onclick="gradeChk(this.id)" type="button">☆</button>
					<button class="btn btn-basic btn-star" id="5"  value="5" onclick="gradeChk(this.id)" type="button">☆</button>
					<span id="grade" ></span>
					<input type="hidden" id="hidden" name="hidden"/>
				</div>
				
				<hr/>
				<div>
					<h5>구매후기</h5><br/>
					<textarea class="form-control col-sm-5" rows="10" cols="70" maxlength="200" name="content" id="textC" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다." required="required"></textarea>
				</div>
				<hr/>
				
				<!--리뷰 사진 업로드 -->
				<div class="custom-file" style="width: 400px">
 					 <input type="file" class="custom-file-input" name="file" id="reveiw_file" width="500px" onchange="uploading()">
  					<label class="custom-file-label" id="fileName" for="customFile">리뷰 사진을 등록해주세요</label>
				</div>
				<hr/>
				
				<button type="submit" class="btn btn-secondary">등록하기</button>
			</form>
		</div>
	</div>
	
	<!-- footer 설정 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
</body>
</html>