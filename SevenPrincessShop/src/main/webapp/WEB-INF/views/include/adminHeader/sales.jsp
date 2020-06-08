<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>SPS 관리자모드</title>

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/admin/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/resources/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/admin/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/css/style-responsive.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/admin/lib/chart-master/Chart.js"></script>

</head>

<!-- 결제 내역 조회용 header  -->	
<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      
      <!--logo start-->
      <a href="/controller/" class="logo"><b>Seven<span> Princess</span> Shop</b></a>
      
      <!-- 상단 로그아웃 버튼   -->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
	       <li><div class="adminLogo" style="margin-right: 20px"> 안녕하세요 &nbsp;관리자님!</div></li>
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">	
          <div align="center" style="margin-top: 100px;margin-bottom: 20px">
	          <span>
	          	<img src="${pageContext.request.contextPath}/resources/myPage/images/sample.png" width="100px" height="95px"/>
	          </span>
          </div>
          <h5 class="centered">${nowUser.client_name} 님</h5>
          <li class="mt">
            <a class="dcjq-parent" href="memberList">
              <i class="fa fa-dashboard"></i>
              <span><h5>회원 목록 조회</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="active" href="salesTable">
              <i class="fa fa-desktop"></i>
              <span><h5>판매 기록 조회</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="payOKTable">
              <i class="fa fa-cogs"></i>
              <span><h5>결제 내역 조회</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="allBoard" onclick="categoryChange(this.id)" id="4">
              <i class="fa fa-book"></i>
              <span><h5>문의 게시판 조회</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="productUpload">
              <i class="fa fa-book"></i>
              <span><h5>상품 업로드</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="stockTable">
              <i class="fa fa-book"></i>
              <span><h5>재고 관리</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="salesCheck">
              <i class="fa fa-book"></i>
              <span><h5>매출 조회</h5></span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="dcjq-parent" href="salesGraph">
              <i class="fa fa-book"></i>
              <span><h5>매출 그래프</h5></span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    
     <!-- js placed at the end of the document so the pages load faster -->
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/jquery/jquery.min.js"></script>
	
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/bootstrap/js/bootstrap.min.js"></script>
	  <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/jquery.scrollTo.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/jquery.sparkline.js"></script>
	  <!--common script for all pages-->
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/common-scripts.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/lib/gritter/js/jquery.gritter.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/lib/gritter-conf.js"></script>
	  <!--script for this page-->
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/sparkline-chart.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/admin/lib/zabuto_calendar.js"></script>
	  <script type="text/javascript">
		  $(document).ready(function() {
		      var unique_id = $.gritter.add({
		        // (string | mandatory) the heading of the notification
		        title: 'SPS 관리자 모드에 접속!',
		        // (string | mandatory) the text inside the notification
		        text: '닫기 단추를 사용하려면 마우스로 이동하세요. 로고 옆에 있는 버튼을 클릭하면 왼쪽 사이드바를 숨길 수 있습니다',
		        // (string | optional) the image to display on the left
		        image: '${pageContext.request.contextPath}/resources/images/pageImages/logo2.png',
		        // (bool | optional) if you want it to fade out on its own or just sit there
		        sticky: false,
		        // (int | optional) the time you want it to be alive for before fading out
		        time: 8000,
		        // (string | optional) the class name you want to apply to that specific message
		        class_name: 'my-sticky-class'
		      });
	
	      return false;
	    });
	  </script>
	  <script type="application/javascript">
	    $(document).ready(function() {
	      $("#date-popover").popover({
	        html: true,
	        trigger: "manual"
	      });
	      $("#date-popover").hide();
	      $("#date-popover").click(function(e) {
	        $(this).hide();
	      });
	
	      $("#my-calendar").zabuto_calendar({
	        action: function() {
	          return myDateFunction(this.id, false);
	        },
	        action_nav: function() {
	          return myNavFunction(this.id);
	        },
	        ajax: {
	          url: "show_data.php?action=1",
	          modal: true
	        },
	        legend: [{
	            type: "text",
	            label: "Special event",
	            badge: "00"
	          },
	          {
	            type: "block",
	            label: "Regular event",
	          }
	        ]
	      });
	    });
	
	    function myNavFunction(id) {
	      $("#date-popover").hide();
	      var nav = $("#" + id).data("navigation");
	      var to = $("#" + id).data("to");
	      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
	    }
	  </script>
  
 
</body>

</html>
