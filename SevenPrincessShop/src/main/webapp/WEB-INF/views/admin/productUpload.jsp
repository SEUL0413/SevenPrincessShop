<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
</head>
<style>
   body {

   }
</style>
<script type="text/javascript">

$(function(){
    
    // 초기화
    ctgSelectType('1' , '1');
});

//셀렉트박스 대분류-중분류
function ctgSelectType(type , select) {
    
    $('#subSelect').empty();
    
    if(type == '1') { // 상의
        $('#subSelect').append("<option value='1' >블라우스</option>'");
        $('#subSelect').append("<option value='2' >티셔츠</option>'");
        $('#subSelect').append("<option value='3' >맨투맨</option>'");
        $('#subSelect').append("<option value='4' >후드</option>'");
    } else if (type == '2') {  // 하의
        $('#subSelect').append("<option value='5' >청바지</option>'");
        $('#subSelect').append("<option value='6' >반바지</option>'");
        $('#subSelect').append("<option value='7' >와이드 팬츠</option>'");
        $('#subSelect').append("<option value='8' >스커트</option>'");

    } else if ( type == '3') {  // 원피스
        $('#subSelect').append("<option value='9' >롱원피스</option>'");
        $('#subSelect').append("<option value='10' >숏원피스</option>'");
        $('#subSelect').append("<option value='11' >민소매원피스</option>'");
        
    }else if(type == '4'){   // 아우터
        $('#subSelect').append("<option value='12' >코트</option>'");
        $('#subSelect').append("<option value='13' >자켓</option>'");
        $('#subSelect').append("<option value='14' >가디건</option>'");
        $('#subSelect').append("<option value='15' >패딩</option>'");
        
    }else if( type == '5'){   // 악세사리
        $('#subSelect').append("<option value='16' >가방</option>'");
        $('#subSelect').append("<option value='17' >신발</option>'");
        $('#subSelect').append("<option value='18' >모자</option>'");
    }
    document.getElementById("subSelect").style.display = "";
    
    if ($.trim(select) != "") {
        $('#ctgSelect').val(type);
        $('#subSelect').val(select);
    }

}

//옵션 추가버튼
function add_textbox(){
    document.getElementById("t_space").innerHTML +=
    "<input type='text' name='stock_color' placeholder='color' class='form-control'> ";
    
    document.getElementById("t_space").innerHTML +=
   "<select name='stock_size' class='form-control' style='height:35px' >" +  
      "<option value='S'>S</option>" +
      "<option value='M'>M</option>" +
      "<option value='L'>L</option>" +
      "<option value='F'>F</option>" +
   "</select> " ; 
   
   document.getElementById("t_space").innerHTML +=
      "<input type='number' name='stock_stock' placeholder='재고' class='form-control'> <br/>";
   
    document.getElementById("t_space").innerHTML +=
      "&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;";
}


   //가격입력시 천단위마다 콤마 붙이기
   function inputNumberFormat(obj) {
       obj.value = comma(uncomma(obj.value));
   }
   
   function comma(str) {
       str = String(str);
       return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
   }
   
   function uncomma(str) {
       str = String(str);
       return str.replace(/[^\d]+/g, '');
   }




</script>
<body>

<!-- 관리자 header 설정 -->
<%@ include file="/WEB-INF/views/include/adminHeader/upload.jsp"%>
     <!--main content start-->
      <section id="main-content">
           <section class="wrapper">
<form method="post" action="upload" enctype="multipart/form-data" class="container gs" style="width: 100%">
<h1>상품등록</h1>

      <table class="table table-hover" style="width: 100%;" >
      
     
         <tr >
            <th width="30%" height="50px" style="vertical-align: middle;" >카테고리</th>
            <td>
               <div class="row" >
                  &nbsp;&nbsp;&nbsp;&nbsp;       
                   <select name="ctgSelect" id="ctgSelect" onChange="ctgSelectType(this.value)" class="form-control" style="width:180px; height:40px";>
                      <option value="1">상의</option>
                      <option value="2">하의</option>
                      <option value="3">원피스</option>
                      <option value="4">아우터</option>
                      <option value="5">악세사리</option>
                  </select>
                  &nbsp;&nbsp;&nbsp;&nbsp;    
                  <select id="subSelect" name="subSelect"  style="width:180px; height:40px; display:none;" class="form-control" ></select>
               </div>
            </td>
         </tr>
   
      
          <tr>
              <th style="vertical-align: middle;">상품 이름 </th>             
              <td><input type="text" name="product_name" class="form-control" style="height:40px";/></td>
          
          </tr>
          
          
          <tr>    
              <th style="vertical-align: middle;">가격 </th> 
              <td><input type="text" name="p_price" class="form-control" style="height:40px";   
                  id="recycle_result_amt" value="" onkeyup="inputNumberFormat(this)"/></td>
          </tr>
          
   <!--          -->
        
          <tr>
          <th style="vertical-align: middle;" >옵션 </th>
             <td>
               <div id="t_space">
                  <input type="button" value="추가" class="btn btn-secondary" onclick="add_textbox()">
               </div>
            </td>
         </tr>

   
           <tr>
            <th style="vertical-align: middle;">대표 이미지 </th>
              <td>
                 <input type="file" name="file" />
              </td>
           </tr>

    
            <tr>
               <th style="vertical-align: middle;" >상세 이미지 </th>
              <td>
                 <input multiple="multiple" type="file" name="multi" />
              </td>
           </tr>
           <tr>
                 <td colspan="2" align="right">
                  <input type="submit" value="업로드" class="btn btn-secondary"/>
              </td>
         </tr>
      </table>


      </form>
      </section>
   </section>
   <!-- 관리자 footer 설정 -->
   <%@ include file="/WEB-INF/views/include/adminFooter.jsp"%>
</body>
</html>