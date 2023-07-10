<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>사원 정보</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<style type="text/css">
table {
	margin-bottom: 1em;}

table, th {
	border: none;}

th {
	background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {
	border:1px solid #04AA6D;
	color: #6C7293;
	text-align: center;
	padding: 10px 6px;
	font-weight: 600;}

#tb-btns {
	margin-left: 0.5em;}

.btn {
	display: inline-block;
	font-weight: 600;
	line-height: 1;
	color: #6c7293;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.625rem 1.125rem;
	font-size: 0.875rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
    
.btn-success {
	color: #000;
	background-color: #0ddbb9;
	border-color: #0ddbb9;}

.btn-info {
	color: #000;
	background-color: #2fddf8;
	border-color: #23dbf8;}
	
.container {
	position: relative;
	margin: 2%;}

.btn_btn {
	position: absolute;
	top: 0;
	right: 0;}

.btn_table table {
	width: 100%;}

</style>
</head>
<body>
	<div class="container">
		<h1 class="head_h1" style="display: inline;">사원 정보</h1>
		
		<div class="btn_btn">
			<c:if test="${emp_department.equals('인사팀') || emp_department.equals('Master') }">
				<input type="button" class="btn btn-info" value="수정하기" onclick="location.href='/employee/modify?emp_id=${resultVO.emp_id}';">
			</c:if>
			<input type="button" class="btn btn-success" value="창닫기" onclick="window.close();">
		</div>
		<div class="btn_table">
			<table border="1">
				<tr>
					<th>사원사진</th>
					<th>사번</th>
					<td colspan="3">${resultVO.emp_id }
					<th>이름</th>
					<td>${resultVO.emp_name }</td>
				</tr>
				<tr>
					<td rowspan="5" style="width: 250px; height: 290px"><img src="/employee/imgDown?fileName=${resultVO.emp_image }"></td>
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
					<td>${resultVO.join_date }</td>
				</tr>
				<tr>
					<th>휴직일</th>
					<td>${resultVO.absence_date }</td>		
					<th>복직일</th>
					<td>${resultVO.rehabi_date }</td>
					<th>퇴사일</th>
					<td>${resultVO.resign_date }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>