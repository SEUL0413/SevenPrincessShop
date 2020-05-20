<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style	type="text/css">

	span{border:1px solid black;width:130px}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".cate  p").hide();
		
		$(".cate").hover(
			function(){
				$(this).children("p").slideDown();
			},
			function(){
				$(this).children("p").slideUp();
			}
		);
		
		$("span").click(function(){
			$(this).css("background","gray");
			$(this).siblings("span").css("background","white");
		});
	});

	
</script>


</head>
<body>

<!-- 바깥 table 설정 -->
<table>
	<tr>
		<td>
		
			<strong>${nowUser.client_name}</strong> 님<br/>
			<button onclick="location.href='pwCheck'">정보 수정</button>
		
		</td>
		<td>
			<!-- 안쪽 table 설정 -->
			<table>
				<tr>
					<td>
						총 주문금액
					</td>
					<td>
						장바구니
					</td>
					<td>
						배송 중인 상품
					</td>
				</tr>	
				<tr>
					<td>
						0 원
					</td>
					<td>
						0 개 
					</td>
					<td>
						0 건
					</td>
				</tr>	
			</table>
		</td>
	</tr>
</table> <!-- 바깥 테이블 끝 -->


<br/><br/><br/>
<!-- 좌측 마이페이지 카테고리 시작 -->
<div>
	<h2>마이페이지</h2>
	
	<div id="cate1" class="cate">
		<span onclick="location.href='myOrderView'">주문목록/배송조회</span>
	</div>
	<div id="cate2" class="cate">
		<span>고객정보</span>
			<p><a href="pwCheck">정보수정</a></p>
			<p><a href="infoDel">회원탈퇴</a></p>
	</div>
	<div id="cate3" class="cate">
		<span><a href="review">리뷰관리</a></span>
	</div>
	<div id="cate4" class="cate">
		<span>고객센터</span>
			<p><a href="qnaBoard">1:1 문의</a></p>
			<p>자주하는 질문</p>
	</div>
	<div id="cate5" class="cate">
		<span><a href="cartView">장바구니</a></span>
	</div>
</div>
</body>
</html>