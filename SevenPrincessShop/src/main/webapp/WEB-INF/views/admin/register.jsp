<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/ckeditor/ckeditor.js"></script>

</head>
<body>




    <h2>상품 등록 </h2>
			<form action="uploadForm" id="uploadForm" method="POST" enctype="multipart/form-data" action="uploadForm">
			 	<table>
			 		<tr>
				        <td>대표이미지 :</td> 
				        <td><input type="file" name="titleImage" /></td>
				    </tr>
			 		<tr>
				        <td>상품 이름 :</td> 
				        <td><input type="text" name="product_name" /></td>
				    </tr>
				    <tr>    
				        <td>가격 :</td> 
				        <td><input type="text" name="product_price" /></td>
				    </tr>
				   <!--  <tr>
				        <td>상품 색상 :</td>
				        <td><input type="text" name="color" /></td>
			       	</tr> -->
				    <tr>    
				        <td>상품 사이즈 :</td>
				        <td>
				        <select name="item_Size">
					        	<option>사이즈를 선택</option>
					        	<option value="S">S</option>
					        	<option value="M">M</option>
					        	<option value="L">L</option>
		       			</select>
		       			</td>
			        </tr>
			        <!-- tr>
			        	<td>카테고리 :</td>
			        	<td> 
			        		<select name="category">
					        	<option>선택해 주세요.</option>
					        	<option value="top">상의</option>
					        	<option value="bottom">하의</option>
					        	<option value="acc">악세사리</option>
			       			</select>
			        	</td>
			        </tr> -->
			    
			        <tr>
				        <td colspan="2">
					        <textarea name="gdsDes" id="gdsDes" rows="5" cols="50">
		       				</textarea>
		       				<script>
						 var ckeditor_config = {
						   resize_enaleb : false,
						   enterMode : CKEDITOR.ENTER_BR,
						   shiftEnterMode : CKEDITOR.ENTER_P,
						   filebrowserUploadUrl : "/admin/goods/ckUpload"
						 };
						 
						 CKEDITOR.replace("gdsDes", ckeditor_config);
						</script>
	
				        </td>
			        </tr>
			         
			        <tr>
				        <td>
					        <!-- <input type="file" name="file" />
					        <input type="submit"/> -->
					        <input type="file" name="file" />
				        </td>
			     	</tr>
			     	
			         <tr>
				        <td>
					        <!-- <input type="file" name="file" />
					        <input type="submit"/> -->
					        <input multiple="multiple" type="file" name="sub_file" />
					          <input type="submit" value="전송" />
				        </td>
			     	</tr>
			       
			     	
			     	
			     	
			       <!--  <input type="hidden" value="${ savedFileName }" name="name"> -->
			        <input type="hidden" value="/Users/Administrator/Desktop/jsp/Spring/workspace/homeProject/src/main/webapp/resources/goodsupload" name="goodsDir">
				</table>
		    </form>
				


</body>
</html>