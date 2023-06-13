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


<h1>material_list.jsp</h1>
<h2>http://localhost:8088/purchasing/material/list</h2>


<!-- 자재 검색 기능 -->
<!-- 자재 검색 기능 -->



<!-- 추가, 수정, 저장, 삭제 버튼 -->
<input type="button" value="추가" onclick="location.href='/purchasing/material/insert';">
<input type="button" value="수정" onclick="location.href='/purchasing/material/modify';">
<input type="button" value="삭제" onclick="location.href='/purchasing/material/remove';">
<input type="button" value="저장" onclick="location.href='/purchasing/material/save';">
<!-- 추가, 수정, 저장, 삭제 버튼 -->



<!-- 자재 리스트 출력 -->
<table border="1">
	<tr>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단가(원)</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>이미지</th>
		<th>최근 수정 날짜</th>
	</tr>
	
<c:forEach var="ml" items="${materialList }">
	<tr>
		<td>${ml.ma_id }</td>
		<td>${ml.ma_name }</td>
		<td>${ml.unit_cost }</td>
		<td>${ml.whs_num }</td>
		<td>${ml.shelt_position }</td>
		<td>${ml.ma_image }</td>
		<td>${ml.ma_regdate }</td>
	</tr>
</c:forEach>
</table>
<!-- 자재 리스트 출력 -->



</body>
</html>