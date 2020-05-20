<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</style>
<script type="text/javascript">

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
</script>

<body>

	<h2>구매후기 작성</h2>
	<hr/>

	<form name="insertReview" action="insertR?orderIdx=${order.orderList_idx}&productIdx=${product.product_idx}" enctype="multipart/form-data" method="post" accept-charset="UTF-8">
		<div>
			<div>
				<img src="${product.product_imgPath}.jpg" style="width: 100%; max-width: 200px; vertical-align: middle"/>
			</div>
			<div >	
				<p>
					<strong>${product.product_name}</strong><br/>
					${order.orderList_size} / ${order.orderList_color} / ${order.orderList_stock} 개<br/>
					주문일 : ${order.orderList_orderDate}
				</p>
			</div>
		</div>
		
		<hr/>
		
		
		<div>
			<br/>
			별점 
			<button id="1" value="1" onclick="gradeChk(this.id)" type="button">☆</button>
			<button id="2" value="2" onclick="gradeChk(this.id)" type="button">☆</button>
			<button id="3"  value="3" onclick="gradeChk(this.id)" type="button">☆</button>
			<button id="4"  value="4"onclick="gradeChk(this.id)" type="button">☆</button>
			<button id="5"  value="5" onclick="gradeChk(this.id)" type="button">☆</button>
			<span id="grade"></span>
			<input type="hidden" id="hidden" name="hidden"/>
		</div>
		
		<hr/>
		<div>
			구매후기<br/><br/>
			<textarea name="content" rows="10" cols="60" id="textC" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다." required="required"></textarea>
		</div>
		<hr/>
		
		<!--리뷰 사진 업로드 -->
		<input type="file" name="file"/>
		<hr/>
		<button type="submit">등록하기</button>
	</form>
</body>
</html>