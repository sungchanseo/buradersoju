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
	<h1>수주 리스트</h1>
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
	<input type="button" style="display:inline;" value="수주등록" onclick="location.href='/contract/insert';">
	<input type="button" value="엑셀화일" onclick="">
	<input type="button" value="인쇄하기" onclick="">
	<hr>
		<table border="1">
			<tr>
				<th>수주번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>수주처</th>
				<th>수주일</th>
				<th>수주량</th>
				<th>납품예정일</th>
				<th>작업지시번호</th>
				<th>담당자</th>
			</tr>
			<c:forEach var="vo" items="${contractList }">
				<tr>
					<td><a href="/contract/info?cont_id=${vo.cont_id }">${vo.cont_id }</a></td>
					<td><a href="/contract/info?cont_id=${vo.product_id }">${vo.product_id }</a></td>
					<td><a href="/contract/info?cont_id=${vo.product_name }">${vo.product_name }</a></td>
					<td>${vo.cust_name }</td>
					<td>${vo.cont_date }</td>
					<td>${vo.cont_qty }</td>
					<td>${vo.due_date }</td>
					<td>${vo.production_id }</td>
					<td>${vo.cont_emp }</td>
				</tr>
			</c:forEach>
		</table>
	<!-- 	페이징 처리  -->
	<c:if test="${pvo.startPage > pvo.pageBlock }">
		<a href="/contract/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">이전</a>
	</c:if>

	<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
		<a href="/contract/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}">${i }</a>
	</c:forEach>

	<c:if test="${pvo.endPage<pvo.pageCount }">
		<a href="/contract/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">다음</a>
	</c:if>
	<!-- 	페이징 처리  -->

</body>
</html>