<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

<!-- css 적용 코드 -->
<link href="${path}/resources/css/footer.css" rel="stylesheet"/>

</head>
<body>

<!-- 여기서부터 footer!!!!!!!!!!!!!!!!!!!!!! -->
<!-- footer 1 -->
<div class="col-xs-12 bottomArea1">
	<div class="contentLimit">
		<div class="col-xs-12 col-lg-8 col-lg-offset-2">
			<div class="col-xs-12 bottomMenu">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a href="/intro/company">회사소개</a></li>
					<li><a href="/intro/agreement">이용약관</a></li>
					<li><a href="/intro/privacy">개인정보취급방침</a></li>
					<li><a href="/intro/guide">이용안내</a></li>
				</ul>
			</div>	
		</div>
	</div>
</div>

<!-- footer 2 -->
<div class="col-xs-12 bottomArea1">
	<div class="contentLimit">
		<div class="col-xs-12 col-lg-8 col-lg-offset-2">
			<div class="col-xs-6 col-md-4 col-lg-3  bottomItem">
				<div class="title">CUSTOMER INFO</div>
					<ul>
						<li>CALL CENTER : 010-7711-8663</li>
						<li>MON - FRI AM 10:00 - PM 06:00 / LUNCH PM 01:00 - PM 02:00</li>
					</ul>
				</div>
				<div class="col-xs-6 col-md-4 col-lg-3  bottomItem">
					<div class="title">BANK INFO</div>
					<ul>
						<li>신한은행 110307032834 박진호</li>
					</ul>
				</div>
				<div class="col-xs-6 col-md-4 col-lg-3 bottomItem">
					<div class="title">RETURN</div>
					<ul>
						<li>서울 양천구 곰달래로13길 8-1 (신월동) 101호</li>
					</ul>
					<div style="margin-top:20px;"><img src="images/escrowNicePay.png" class="img-responsive w80 cursorPointer" onclick="window.open('https://pg.nicepay.co.kr/issue/IssueEscrow.jsp?Mid=timenamu1m&amp;CoNo=4442900652','escrowHelp', 'width=500,height=380,scrollbars=auto,resizable=yes')"></div>
				</div>
				<div class="col-xs-6 col-md-4 col-lg-3 bottomItem">
					<div class="title">COMPANY INFO</div>
					<ul>
						<li>COMPANY : 세븐프린세스</li>
						<li>OWNER : 이찬호</li>
						<li>BUSINESS LICENSE : 029-29-59590 <a class="checkCompany" href="javascript:fnCheckCompany('029-29-59590');">사업자정보확인</a></li>
						<li>ONLINE BUSINESS LICENSE : 2020-서울역삼-0486호</li>
						<li>TEL : 010-6878-8517</li>
						<li>E-MAIL : dla3946gns@naver.com</li>
						<li>ADDRESS : 서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
<!-- footer 3 -->
<div class="col-xs-12 bottomArea2">
	<div class="contentLimit">
		<div class="col-xs-12 col-lg-8 col-lg-offset-2">
			세븐프린세스의 모든 컨텐츠 저작권은 우리에게 있으며, 무단도용시 법적 불이익을 받습니다.<br/>
			Copyrightⓒ우리 All Rights Reserved.
		</div>
	</div>
</div>

<!-- footer 4 -->
<div class="mobileTopBtn visible-sm visible-xs">
	<img src="images/btnTop.png" onclick="fnMobileTop()">
</div>

</body>
</html>