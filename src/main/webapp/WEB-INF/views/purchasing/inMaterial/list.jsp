<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<script>

$(document).ready(function(){
	
	$('#done').click(function(){
		var order_id = "<c:out value='${iml.order_id}'/>";
		alert(order_id);
	});
	
});

</script>



</head>
<body>

<h1>In_Material_List.jsp</h1>
<h2>http://localhost:8088/purchasing/inMaterial/list</h2>
<%-- ${inMaterialList } --%>
   
	<table border="1">
	<tr>
		<th></th>
		<th>입고번호</th>
		<th>발주번호</th>
		<th>품명</th>
		<th>입고수량</th>
		<th>진행현황</th>
		<th>입고일</th>
		<th>입고담당직원</th>
		<th>입고처리</th>
	</tr>
      
      <c:forEach var="iml" items="${inMaterialList }">
         <tr>
         	<td><input type="checkbox" name="checked"></td>
			<td>${iml.in_id }</td>
			<td>${iml.order_id }</td>
			<td>${iml.in_maName }</td>
			<td>${iml.in_qty }</td>
			<td>${iml.in_progress }</td>
			<td>${iml.in_date }</td>
			<td>${iml.in_emp }</td>
			<td>		
			<c:if test="${empty iml.in_id }">
				<input type="button" id="done" value="입고처리" >
			</c:if>
			</td>
         </tr>
      </c:forEach>
	</table>




</body>
</html>