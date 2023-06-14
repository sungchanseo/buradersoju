<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원리스트</title>
</head>
<body>
	<h1>info.jsp</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>부서</th>
			<th>직위</th>
			<th>입사일</th>
			<th>내선번호</th>
		</tr>
		<c:forEach var="vo" items="${employeeList }">
			<tr>
				<td><a href="/employee/info?emp_id=${vo.emp_id }">${vo.emp_id }</a></td>
				<td>${vo.emp_name }</td>
				<td>${vo.emp_department }</td>
				<td>${vo.emp_position }</td>
				<td>${vo.join_date }</td>
				<td>${vo.emp_tel }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>