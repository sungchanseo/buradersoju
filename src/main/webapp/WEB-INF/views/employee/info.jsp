<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>사원 정보</title>
</head>
<body>
	<h1>info.jsp</h1>
	<table border="1">
		<tr>
			<th>사원사진</th>
			<th>사번</th>
			<td>${resultVO.emp_id }
			<th>이름</th>
			<td>${resultVO.emp_name }</td>
			<th>성별</th>
			<td>${resultVO.emp_gender }</td>
		</tr>
		<tr>
			<td rowspan="4">이미지</td>
			<th>생년월일</th>
			<td>${resultVO.emp_birth }</td>
			<th>휴대전화</th>
			<td>${resultVO.emp_phone }</td>
			<th>이메일</th>
			<td>${resultVO.emp_email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="5">${resultVO.emp_address }</td>
		</tr>
		<tr>
			<th>부서</th>
			<td>${resultVO.emp_department }</td>
			<th>직위</th>
			<td>${resultVO.emp_position }</td>
			<th>내선번호</th>
			<td>${resultVO.emp_tel }</td>
		</tr>
		<tr>
			<th>재직구분</th>
			<td>${emp_status }</td>
			<th>입사일</th>
			<th>${join_date }</th>
		</tr>
	</table>
	
	<input type="submit" value="수정하기">
</body>
</html>