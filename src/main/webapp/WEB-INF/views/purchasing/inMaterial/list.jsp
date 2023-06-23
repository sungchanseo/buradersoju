<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>


<h1>In_Material_List.jsp</h1>
<h2>http://localhost:8088/purchasing/inMaterial/list</h2>

 
	<table border="1">
	<tr>
		<th>입고번호</th>
		<th>발주번호</th>
		<th>상세</th>
		<th>품명</th>
		<th>입고수량</th>
		<th>입고일</th>
		<th>진행현황</th>
		<th>입고담당직원</th>
		<th>입고처리</th>
	</tr>
      
      <c:forEach var="iml" items="${inMaterialList }">
         <tr>
			<td>${iml.in_id }</td>
			<td>${iml.order_id }</td>			
			<td>
				<a href="info?order_id=${iml.order_id }"
				   onclick="window.open(this.href, '_blank', 'width=900, height=350, left=510, top=365'); return false;">
						<img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="25px" height="25px" alt="image" />
				</a>
			</td>
			<td>${iml.in_maName }</td>
			<td>${iml.in_qty }</td>
			<td>${iml.in_date }</td>
			<td>${iml.in_progress }</td>
			<td>
				<c:choose>
					<c:when test="${iml.in_emp == 0}">　</c:when>
					<c:otherwise>${iml.in_emp }</c:otherwise>
				</c:choose>
			</td>
			<td>		
				<c:if test="${empty iml.in_id }">
					<input type="button" class="inidregist" value="입고처리" 
					                     onclick="location.href='/purchasing/inMaterial/inid?order_id=${iml.order_id }';">
				</c:if>
			</td>
         </tr>
      </c:forEach>
	</table>


</body>
</html>