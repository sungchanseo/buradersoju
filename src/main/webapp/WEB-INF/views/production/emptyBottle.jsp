<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공병 관리</title>
</head>
<body>
	<h1>공병 관리</h1>
<%-- 	${bottleList } --%>
	<div class="bottleList">
	<table border='1'>
		<thead>
			<tr>
				<th>공병등록일자</th>
				<th>수량</th>
				<th>불량수량</th>
				<th>등록</th>
			</tr> 
			</thead>
			<tbody>    
			<c:forEach var="vo" items="${bottleList }">
				<tr>
				<td></td>
				<td>${vo.bt_qty }</td>
				<td><input type="text" id="def_qty" name="def_qty">
				</td>
				<td><input type="button" id="bottleListBT" value="등록"></td>
			</tr>
			</c:forEach>
	</tbody>
	</table>
	</div>
</body>
</html>