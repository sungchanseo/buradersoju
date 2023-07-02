<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<h1>직원검색</h1>
	<!-- 검색창기능 -->
	<form action="" method="get" style="display: inline;">
		<select name="selector">
			<option value="emp_name">이름</option>
			<option value="emp_department">부서</option>
		</select> <input type="text" style="display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	<!-- 검색창기능 -->

	<!-- 사원목록 테이블 -->
	<div class="table-responsive">
		<table class="table table-hover" style="text-align :center;">
			<tr>
				<th style="width: 60px">사번</th>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
				<th>입사일</th>
				<th>내선번호</th>
			</tr>
			<c:forEach var="vo" items="${employeeList }">
				<tr>
					<td></td>
					<td>${vo.emp_name }</td>
					<td>${vo.emp_department }</td>
					<td>${vo.emp_position }</td>
					<td>${vo.join_date }</td>
					<td>${vo.emp_tel }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
