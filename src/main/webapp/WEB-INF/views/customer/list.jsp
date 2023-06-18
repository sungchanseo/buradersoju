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
	<h1>Customer List</h1>
	<!-- 검색창기능 -->
	<form action="/customer/list" method="get">
		<select name="selector">
			<option value="cust_name">상호</option>
			<option value="cust_id">거래처코드</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" class="btn-danger" value="검색">
	</form>
	<!-- 검색창기능 -->
	<input type="button" value="거래처등록"
		onclick="location.href='/customer/insert';">
	<input type="button" value="거래처삭제"
		onclick="location.href='/customer/remove';">
	<hr>
		<table border="1">
			<tr>
				<th></th>
				<th>순번</th>
				<th>거래처코드</th>
				<th>상호</th>
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
					<td><a href="/customer/info?cust_id=${vo.cust_id }">${vo.cust_id }</a></td>
					<td><a href="/customer/info?cust_id=${vo.cust_id }">${vo.reg_num }</a></td>
					<td><a href="/customer/info?cust_id=${vo.cust_id }">${vo.cust_name }</a></td>
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
	<!-- 	페이징 처리  -->
	<c:if test="${pvo.startPage > pvo.pageBlock }">
		<a href="/customer/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">이전</a>
	</c:if>

	<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
		<a href="/customer/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}">${i }</a>
	</c:forEach>

	<c:if test="${pvo.endPage<pvo.pageCount }">
		<a href="/customer/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">다음</a>
	</c:if>
	<!-- 	페이징 처리  -->

</body>
</html>