<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="zc-html">

<head>
  <meta charset="utf-8">
  <title>판매 차트</title>
  <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
  <style>
    .zc-body {
      background: #ecf2f6;
    }

    .chart--container {
      height: 100%;
      width: 100%;
      min-height: 650px;
    }

    .zc-ref {
      display: none;
    }
  </style>
</head>
​

<body class="zc-body">
  <!-- 관리자 header 설정 -->
<%@ include file="/WEB-INF/views/include/adminHeader/graph.jsp"%>
	  <!--main content start-->
      <section id="main-content">
     		<section class="wrapper">
  <div id="myChart" class="chart--container">
  <h1>매출 그래프</h1>​
    <a href="https://www.zingchart.com/" rel="noopener" class="zc-ref">Powered by ZingChart</a>
  </div>

  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    let chartConfig = {
      backgroundColor: '#ecf2f6',
      
       graphset: [
    	   
    	   /* 베스트 아이템(조회수) */
    	   {
    		      type: 'bar',
    		      backgroundColor: '#fff',
    		      borderWidth: '1px',
    		      borderColor: '#dae5ec',
    		      width: '64%',
    		      height: '30%',
    		      x: '34%',
    		      y: '0%',
    		      title: {
    		        text: 'BEST ITEM',
    		        marginTop: '7px',
    		        marginLeft: '9px',
    		        backgroundColor: 'none',
    		        fontColor: '#707d94',
    		        fontFamily: 'Arial',
    		        fontSize: '11px',
    		        fontWeight: 'bold',
    		        shadow: false,
    		        textAlign: 'left'
    		      },
    		      plot: {
    		        tooltip: {
    		          padding: '5px 10px',
    		          backgroundColor: '#707e94',
    		          borderRadius: '6px',
    		          fontColor: '#fff',
    		          fontFamily: 'Arial',
    		          fontSize: '11px',
    		          shadow: false
    		        },
    		        animation: {
    		          delay: 500,
    		          effect: 'ANIMATION_SLIDE_BOTTOM'
    		        },
    		        barWidth: '33px',
    		        hoverState: {
    		          visible: false
    		        }
    		      },
    		      plotarea: {
    		        margin: '45px 20px 38px 45px'
    		      },
    		      scaleX: {
    		        values: ['${monthBestItem[0].product_name}', '${monthBestItem[1].product_name}', '${monthBestItem[2].product_name}',
    		        	'${monthBestItem[3].product_name}', '${monthBestItem[4].product_name}', '${monthBestItem[5].product_name}'],
    		        guide: {
    		          visible: false
    		        },
    		        item: {
    		          paddingTop: '2px',
    		          fontColor: '#8391a5',
    		          fontFamily: 'Arial',
    		          fontSize: '11px'
    		        },
    		        itemsOverlap: true,
    		        lineColor: '#d2dae2',
    		        maxItems: 9999,
    		        offsetY: '1px',
    		        tick: {
    		          lineColor: '#d2dae2',
    		          visible: false
    		        }
    		      },
    		      scaleY: {
    		        values: '0:300:100',
    		        guide: {
    		          rules: [
    		            {
    		              lineWidth: '0px',
    		              rule: '%i == 0'
    		            },
    		            {
    		              alpha: 0.4,
    		              lineColor: '#d2dae2',
    		              lineStyle: 'solid',
    		              lineWidth: '1px',
    		              rule: '%i > 0'
    		            }
    		          ]
    		        },
    		        item: {
    		          paddingRight: '5px',
    		          fontColor: '#8391a5',
    		          fontFamily: 'Arial',
    		          fontSize: '10px'
    		        },
    		        lineColor: 'none',
    		        maxItems: 4,
    		        maxTicks: 4,
    		        tick: {
    		          visible: false
    		        }
    		      },
    		      series: [
    		        {
    		          values: [parseInt("${monthBestItem[0].product_hit}"), parseInt("${monthBestItem[1].product_hit}"),
    		        	  parseInt("${monthBestItem[2].product_hit}"), parseInt("${monthBestItem[3].product_hit}"), 
    		        	  parseInt("${monthBestItem[4].product_hit}"), parseInt("${monthBestItem[5].product_hit}")],
    		          styles: [
    		            {
    		              backgroundColor: '#4dbac0'
    		            },
    		            {
    		              backgroundColor: '#25a6f7'
    		            },
    		            {
    		              backgroundColor: '#ad6bae'
    		            },
    		            {
    		              backgroundColor: '#707d94'
    		            },
    		            {
    		              backgroundColor: '#f3950d'
    		            },
    		            {
    		              backgroundColor: '#e62163'
    		            },
    		            {
    		              backgroundColor: '#4e74c0'
    		            },
    		            {
    		              backgroundColor: '#9dc012'
    		            }
    		          ]
    		        }
    		      ]
    		    },
        
        /* 월별 판매 금액 */
        {
          type: 'hbar',
          backgroundColor: '#fff',
          borderColor: '#dae5ec',
          borderWidth: '1px',
          width: '30%',
          height: '85%',
          x: '2%',
          y: '0%',
          title: {
            text: '월별 매출 금액',
            marginTop: '7px',
            marginLeft: '9px',
            backgroundColor: 'none',
            fontColor: '#707d94',
            fontFamily: 'Arial',
            fontSize: '11px',
            shadow: false,
            textAlign: 'left'
          },
          scaleY: {
            guide: {
              visible: false
            },
            item: {
              visible: false
            },
            lineColor: 'none',
            tick: {
              visible: false
            }
          },
          scaleX: {
            values: ['12월', '11월', '10월', '9월', '8월', '7월', '6월', '5월', '4월', '3월', '2월', '1월'],
            guide: {
              visible: false
            },
            item: {
              paddingBottom: '8px',
              fontColor: '#8391a5',
              fontFamily: 'Arial',
              fontSize: '11px',
              offsetX: '206px',
              offsetY: '-12px',
              textAlign: 'left',
              width: '200px'
            },
            itemsOverlap: true,
            lineColor: '#d2dae2',
            maxItems: 9999,
            lineColor: 'none',
            tick: {
              visible: false
            }
          },
          plot: {
            tooltip: {
              padding: '5px 10px',
              backgroundColor: '#707e94',
              borderRadius: '6px',
              fontColor: '#ffffff',
              fontFamily: 'Arial',
              fontSize: '11px',
              shadow: false
            },
            animation: {
              delay: 500,
              effect: 'ANIMATION_EXPAND_LEFT'
            },
            barsOverlap: '100%',
            barWidth: '12px',
            hoverState: {
              backgroundColor: '#707e94'
            },
            thousandsSeparator: ','
          },
          plotarea: {
            margin: '50px 15px 10px 15px'
          },
          series: [{
              values: [ parseInt("${monthSalesPrice.get(11)}"),parseInt("${monthSalesPrice.get(10)}"),parseInt("${monthSalesPrice.get(9)}"),
            	  parseInt("${monthSalesPrice.get(8)}"),parseInt("${monthSalesPrice.get(7)}"),parseInt("${monthSalesPrice.get(6)}"),
            	  parseInt("${monthSalesPrice.get(5)}"),parseInt("${monthSalesPrice.get(4)}"),parseInt("${monthSalesPrice.get(3)}"),
            	  parseInt("${monthSalesPrice.get(2)}"),parseInt("${monthSalesPrice.get(1)}"),parseInt("${monthSalesPrice.get(0)}")],
              styles: [{
                  backgroundColor: '#4dbac0'
                },
                {
                  backgroundColor: '#4dbac0'
                },
                {
                  backgroundColor: '#4dbac0'
                },
                {
                  backgroundColor: '#4dbac0'
                },
                {
                  backgroundColor: '#4dbac0'
                },
                {
                  backgroundColor: '#4dbac0'
                },
                {
               	  backgroundColor: '#4dbac0'
		        },
		        {
		          backgroundColor: '#4dbac0'
		        },
		        {
		          backgroundColor: '#4dbac0'
		        },
		        {
		          backgroundColor: '#4dbac0'
		        },
		        {
		          backgroundColor: '#4dbac0'
		        },
		        {
		          backgroundColor: '#4dbac0'
		        }
	              ],
              tooltipText: '$%node-value',
              zIndex: 2
            },
            {
              values: [300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000],
              valueBox: {
                text: '%data-rvalues원',
                paddingBottom: '8px',
                fontColor: '#8391a5',
                fontFamily: 'Arial',
                fontSize: '11px',
                offsetX: '-54px',
                offsetY: '-12px',
                textAlign: 'right',
                visible: true
              },
              backgroundColor: '#d9e4eb',
              dataRvalues: [parseInt("${monthSalesPrice.get(11)}"),parseInt("${monthSalesPrice.get(10)}"),parseInt("${monthSalesPrice.get(9)}"),
            	  parseInt("${monthSalesPrice.get(8)}"),parseInt("${monthSalesPrice.get(7)}"),parseInt("${monthSalesPrice.get(6)}"),
            	  parseInt("${monthSalesPrice.get(5)}"),parseInt("${monthSalesPrice.get(4)}"),parseInt("${monthSalesPrice.get(3)}"),
            	  parseInt("${monthSalesPrice.get(2)}"),parseInt("${monthSalesPrice.get(1)}"),parseInt("${monthSalesPrice.get(0)}")],
              maxTrackers: 0,
              zIndex: 1
            }
          ]
        },
        
        
        
        
        
        /* 월별 판매, 취소 건수 */
        {
          type: 'line',
          backgroundColor: '#fff',
          borderColor: '#dae5ec',
          borderWidth: '1px',
          width: '64%',
          height: '53%',
          x: '34%',
          y: '32%',
          title: {
            text: '월별 판매 건수',
            marginTop: '7px',
            marginLeft: '12px',
            backgroundColor: 'none',
            fontColor: '#707d94',
            fontFamily: 'Arial',
            fontSize: '11px',
            shadow: false,
            textAlign: 'left'
          },
          plot: {
            animation: {
              delay: 500,
              effect: 'ANIMATION_SLIDE_LEFT'
            }
          },
          plotarea: {
            margin: '50px 25px 70px 46px'
          },
          scaleY: {
            values: '0:100:25',
            guide: {
              alpha: 0.5,
              lineColor: '#d2dae2',
              lineStyle: 'solid',
              lineWidth: '1px'
            },
            item: {
              paddingRight: '5px',
              fontColor: '#8391a5',
              fontFamily: 'Arial',
              fontSize: '10px'
            },
            lineColor: 'none',
            tick: {
              visible: false
            }
          },
          scaleX: {
            values: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            guide: {
              visible: false
            },
            item: {
              paddingTop: '5px',
              fontColor: '#8391a5',
              fontFamily: 'Arial',
              fontSize: '10px'
            },
            lineColor: '#d2dae2',
            lineWidth: '2px',
            tick: {
              lineColor: '#d2dae2',
              lineWidth: '1px'
            }
          },
          legend: {
            margin: 'auto auto 15 auto',
            backgroundColor: 'none',
            borderWidth: '0px',
            item: {
              margin: '0px',
              padding: '0px',
              fontColor: '#707d94',
              fontFamily: 'Arial',
              fontSize: '9px'
            },
            layout: 'x4',
            marker: {
              type: 'match',
              padding: '3px',
              fontFamily: 'Arial',
              fontSize: '10px',
              lineWidth: '2px',
              showLine: 'true',
              size: 4
            },
            shadow: false
          },
          scaleLabel: {
            padding: '5px 10px',
            backgroundColor: '#707d94',
            borderRadius: '5px',
            fontColor: '#ffffff',
            fontFamily: 'Arial',
            fontSize: '10px'
          },
          crosshairX: {
            lineColor: '#707d94',
            lineWidth: '1px',
            plotLabel: {
              padding: '5px 10px',
              alpha: 1,
              borderRadius: '5px',
              fontColor: '#000',
              fontFamily: 'Arial',
              fontSize: '10px',
              shadow: false
            }
          },
          tooltip: {
            visible: false
          },
          series: [{
              text: '판매건수',
              values: [parseInt("${monthSalesCount.get(0)}"),parseInt("${monthSalesCount.get(1)}"),parseInt("${monthSalesCount.get(2)}"),
            	  parseInt("${monthSalesCount.get(3)}"),parseInt("${monthSalesCount.get(4)}"),parseInt("${monthSalesCount.get(5)}"),
            	  parseInt("${monthSalesCount.get(6)}"),parseInt("${monthSalesCount.get(7)}"),parseInt("${monthSalesCount.get(8)}"),
            	  parseInt("${monthSalesCount.get(9)}"),parseInt("${monthSalesCount.get(10)}"),parseInt("${monthSalesCount.get(11)}")],
              lineColor: '#4dbac0',
              lineWidth: '2px',
              marker: {
                backgroundColor: '#fff',
                borderColor: '#36a2a8',
                borderWidth: '1px',
                shadow: false,
                size: 3
              },
              palette: 0,
              shadow: false
            },
            {
              text: '취소건수',
              values: [parseInt("${monthCancelCount.get(0)}"),parseInt("${monthCancelCount.get(1)}"),parseInt("${monthCancelCount.get(2)}"),
            	  parseInt("${monthCancelCount.get(3)}"),parseInt("${monthCancelCount.get(4)}"),parseInt("${monthCancelCount.get(5)}"),
            	  parseInt("${monthCancelCount.get(6)}"),parseInt("${monthCancelCount.get(7)}"),parseInt("${monthCancelCount.get(8)}"),
            	  parseInt("${monthCancelCount.get(9)}"),parseInt("${monthCancelCount.get(10)}"),parseInt("${monthCancelCount.get(11)}")],
              lineColor: '#25a6f7',
              lineWidth: '2px',
              marker: {
                backgroundColor: '#fff',
                borderColor: '#1993e0',
                borderWidth: '1px',
                shadow: false,
                size: 3
              },
              palette: 1,
              shadow: false,
              visible: true
            }/* ,
            {
              text: 'DieHard',
              values: [42, 43, 30, 50, 31, 48, 55, 46, 48, 32, 50, 38],
              lineColor: '#ad6bae',
              lineWidth: '2px',
              marker: {
                backgroundColor: '#fff',
                borderColor: '#975098',
                borderWidth: '1px',
                shadow: false,
                size: 3
              },
              palette: 2,
              shadow: false,
              visible: true
            },
            {
              text: 'Land\'s End',
              values: [25, 15, 26, 21, 24, 26, 33, 25, 15, 25, 22, 24],
              lineColor: '#f3950d',
              lineWidth: '2px',
              marker: {
                backgroundColor: '#fff',
                borderColor: '#d37e04',
                borderWidth: '1px',
                shadow: false,
                size: 3
              },
              palette: 3,
              shadow: false
            } */
          ]
        },
        
        
        
      ]
    };

    zingchart.render({
      id: 'myChart',
      data: chartConfig,
      height: '100%',
      width: '100%'
    });
  </script>
  
  		</section>
	</section>
	<!-- 관리자 footer 설정 -->
	<%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>
</body>

</html>