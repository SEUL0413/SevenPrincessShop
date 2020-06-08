<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<form action="uploadForm2" id="uploadForm2" method="POST" enctype="multipart/form-data" action="uploadForm">

					        <textarea name="gdsDes" id="gdsDes" rows="5" cols="50">
		       				</textarea>
		       				<script>
						 var ckeditor_config = {
						   resize_enaleb : false,
						   enterMode : CKEDITOR.ENTER_BR,
						   shiftEnterMode : CKEDITOR.ENTER_P,
						   filebrowserUploadUrl : "/imageUpload"
						 };
						 
						 CKEDITOR.replace("gdsDes", ckeditor_config);
						</script>
	
				      
					          <input type="submit" value="전송" />
				  
			     	
		    </form>
				


</body>
</html>