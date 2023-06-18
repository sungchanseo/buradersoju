<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>
<body>

<table border="1">
			<tr>
				<th>발주번호</th>
				<th>품번</th>
				<th>품명</th>
				<th>수량</th>
				<th>부가세</th>
				<th>발주일자</th>
				<th>납기일자</th>
				<th>입고일자</th>
				<th>입고창고</th>
				<th>단가</th>
				<th>총액</th>
				<th>담당직원</th>
			</tr>
			<c:forEach var="order" items="${orderList}">
				<tr>
				    <td>${order.order_id}</td>
					<td>${order.ma_id}</td>
					<td>${order.order_maName}</td>
					<td>${order.order_qty}</td>
					<td>${order.order_vat}</td>
					<td>${order.order_date}</td>
					<td>${order.due_date}</td>
					<td>${order.in_date}</td>		
					<td>${order.whs_num}</td>
					<td>${order.order_unitCost}</td>
					<td>${order.order_sum}</td>
					<td>${order.order_emp}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="/purchasing/order/insert">발주등록</a>

</body>
</html>