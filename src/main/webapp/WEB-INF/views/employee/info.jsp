<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>사원 정보</title>
</head>
<body>
	<h1>사원 정보</h1>
	<c:if test="${emp_department.equals('인사팀') || emp_department.equals('인사') }">
		<input type="button" value="수정하기" onclick="location.href='/employee/modify?emp_id=${resultVO.emp_id}';">
	</c:if>
	<input type="button" value="창닫기" onclick="window.close();">
	<table border="1">
		<tr>
			<th>사원사진</th>
			<th>사번</th>
			<td>${resultVO.emp_id }
			<th>이름</th>
			<td>${resultVO.emp_name }</td>
		</tr>
		<tr>
			<td rowspan="4">${resultVO.emp_image }</td>
			<th>생년월일</th>
			<td>${resultVO.emp_birth }</td>
			<th>휴대전화</th>
			<td>${resultVO.emp_phone }</td>
			<th>이메일</th>
			<td>${resultVO.emp_email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="5">${resultVO.emp_address }<br> ${resultVO.emp_address_detail }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${resultVO.emp_gender }</td>		
			<th>부서</th>
			<td>${resultVO.emp_department }</td>
			<th>직급</th>
			<td>${resultVO.emp_position }</td>
		</tr>
		<tr>
			<th>내선번호</th>
			<td>${resultVO.emp_tel }</td>
			<th>재직구분</th>
			<td>${resultVO.emp_status }</td>
			<th>입사일</th>
			<th>${resultVO.join_date }</th>
		</tr>
		<tr>
			<td></td>
			<th>휴직일</th>
			<th>${resultVO.absence_date }</th>		
			<th>복직일</th>
			<th>${resultVO.rehabi_date }</th>
			<th>퇴사일</th>
			<th>${resultVO.resign_date }</th>
		</tr>
	</table>
	

</body>
</html>