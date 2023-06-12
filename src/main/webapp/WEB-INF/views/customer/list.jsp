<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Customer List</h1>
<input type="button" value="거래처등록" onclick="location.href='/customer/insert';">
<input type="button" value="거래처삭제" onclick="location.href='/customer/remove';">
<hr>
<table border="1">
<tr>
	<th></th>
	<th>코드</th>
	<th>이름</th>
	<th>거래처구분</th>
	<th>대표자명</th>
	<th>대표번호</th>
	<th>주소</th>
	<th>업태</th>
	<th>종목</th>
	<th>담당자이메일</th>
</tr>
<c:forEach var="vo" items="${customerList }">
<tr>
	<td><input type="checkbox">	
	<td>${vo.cust_id }</td>	
	<td><a href="/customer/info?${vo.cust_id }">${vo.cust_name }</a></td>	
	<td>${vo.cust_class }</td>	
	<td>${vo.owner_name }</td>	
	<td>${vo.main_phone }</td>	
	<td>${vo.cust_address }</td>	
	<td>${vo.cust_business }</td>	
	<td>${vo.cust_event }</td>	
	<td>${vo.emp_email }</td>
</tr>	
</c:forEach>
</table>
</body>
</html>