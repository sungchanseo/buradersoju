<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>
<body>
<h1>상품 검색</h1>
<!-- 표 들어가는 자리  -->
<table class="table table-color">
  <tbody>
	<tr>
	  <th>상품코드</th>
	  <th>상품명</th>
	</tr>
	<c:forEach var="productionList" items="${productionList }">
	 <tr onclick="sendProductInfoValue('${productionList.product_id}');">  
	  <td>${productionList.product_id}</td>
	  <td>${productionList.product_name}</td>
	 </tr>
	</c:forEach>
	
  </tbody>
</table>


<!-- 표 들어가는 자리  -->

	<script>
	//부모창으로 값 보내기 
	function sendProductInfoValue(id){
		$.ajax({
			url : '/contract/productInfo',
			type : 'get',
			data : {
				product_id : id
			},
			success : function(data){
				window.opener.document.getElementById("product_name").value = data.product_name;
				window.opener.document.getElementById("product_id").value = data.product_id;
				window.close();
			}
		});//ajax END
	}//sendProudctInfoValue END
	
	</script>
</body>
