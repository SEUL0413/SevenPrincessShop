<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
 <meta charset="utf-8">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>

  	<c:set var="monthSalesCount" value="${monthSalesCount}"/>
	<c:set var="monthCancelCount" value="${monthCancelCount}"/>
  
    <div id="chart_div" style="width: 100%; height: 500px;"></div>
    <script>    
    
    var scriptData = parseInt('<c:out value="${monthCount}" />'); 
	var id = "<c:out value='${monthCount}' />";
	
	
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['month', '판매건수','취소건수'],
          ['1',  parseInt("${monthSalesCount.get(0)}"),parseInt("${monthCancelCount.get(0)}")],
          ['2',  parseInt("${monthSalesCount.get(1)}"),parseInt("${monthCancelCount.get(1)}")],
          ['3',  parseInt("${monthSalesCount.get(2)}"),parseInt("${monthCancelCount.get(2)}")],
          ['4',  parseInt("${monthSalesCount.get(3)}"),parseInt("${monthCancelCount.get(3)}")],
          ['5',  parseInt("${monthSalesCount.get(4)}"),parseInt("${monthCancelCount.get(4)}")],
          ['6',  parseInt("${monthSalesCount.get(5)}"),parseInt("${monthCancelCount.get(5)}")],
          ['7',  parseInt("${monthSalesCount.get(6)}"),parseInt("${monthCancelCount.get(6)}")],
          ['8',  parseInt("${monthSalesCount.get(7)}"),parseInt("${monthCancelCount.get(7)}")],
          ['9',  parseInt("${monthSalesCount.get(8)}"),parseInt("${monthCancelCount.get(8)}")],
          ['10',  parseInt("${monthSalesCount.get(9)}"),parseInt("${monthCancelCount.get(9)}")],
          ['11',  parseInt("${monthSalesCount.get(10)}"),parseInt("${monthCancelCount.get(10)}")],
          ['12',  parseInt("${monthSalesCount.get(11)}"),parseInt("${monthCancelCount.get(11)}")]
        ]);

        var options = {
          title: "월별 판매 건수",
          hAxis: {title: 'month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </body>
</html>
