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
					<%--
						<td><input type="submit" value="수정"></td> 
					 <td>${inventory.ma_id}<input type="hidden" name="ma_id" value="${inventoryList[0].ma_id}"></td> --%>
	 ${inventoryList[0]} 
	<form action="/purchasing/inventory/list" method="post">
    
		<table border="1">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>현재고</th>
				<th>보관창고</th>
				<th>실사량</th>
				<th>수정</th>
			</tr>
			<c:forEach var="inventory" items="${inventoryList}">
				<tr>
				    <td>${inventory.ma_id }</td>
					<td>${inventory.ma_name}</td>
					<td>${inventory.ma_qty}</td>
					<td>${inventory.whs_num}</td>
					<td><input type="text" name="ma_qty"></td>	
		            <td><input type="hidden" name="ma_id" value="${inventory.ma_id}"><input type="submit" value="수정"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>