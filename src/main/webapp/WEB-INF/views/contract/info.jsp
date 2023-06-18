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
	<h1>수주 상세 페이지</h1>
	<input type="button" value="엑셀화일">
	<input type="button" value="출력하기">
	<table border="1">
		<tr>
			<th>수주번호</th>
			<td>${contractInfo.cont_id }</td>
			<th>수주처</th>
			<td>${contractInfo.cust_name }</td>
			<th>납품예정일</th>
			<td>${contractInfo.due_date }</td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>${contractInfo.product_id }</td>
			<th>수주일</th>
			<td>${contractInfo.cont_date }</td>
			<th>작업지시번호</th>
			<td>${contractInfo.production_id }</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${contractInfo.product_name }</td>
			<th>수주량</th>
			<td>${contractInfo.cont_qty }</td>
			<th>담당자</th>
			<td>${contractInfo.cont_emp }</td>
		</tr>
	</table>
	<a href="/contract/modify?cont_id=${contractInfo.cont_id }">수정</a>
	<a href="/contract/remove?cont_id=${contractInfo.cont_id }">삭제</a>
	<a href="/contract/list">목록으로</a>

</body>
</html>