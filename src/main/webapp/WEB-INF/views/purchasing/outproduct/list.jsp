<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
			<tr>
			   <th>출고관리번호</th>
			   <th>작업지시번호</th>
			   <th>납품자명</th>
			   <th>품명</th>
			   <th>주문수량</th>
			   <th>납기일자</th>
			   <th>진행현황</th>
			   <th>담당자</th>
			</tr>
			<c:forEach var="outproduct" items="${outproductList}">
				<tr>
				    <td>${outproduct.op_id}</td>
				    <td>${outproduct.product_id}</td>
				    <td>${outproduct.customer_name}</td>
				    <td>${outproduct.product_name}</td>
				    <td>${outproduct.op_qty}</td>
				    <td>${outproduct.op_date}</td>
				    <td>${outproduct.op_progress}</td>
				    <td>${outproduct.op_empNum}</td>	
				</tr>
			</c:forEach>
		</table>

</body>
</html>