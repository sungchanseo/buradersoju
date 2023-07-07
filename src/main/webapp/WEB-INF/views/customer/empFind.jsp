<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
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
				<tr onclick="sendEmpInfoValue('${vo.emp_id}');">
					<td>${vo.emp_id }</td>
					<td>${vo.emp_name }</td>
					<td>${vo.emp_department }</td>
					<td>${vo.emp_position }</td>
					<td>${vo.join_date }</td>
					<td>${vo.emp_tel }</td>
				</tr>
			</c:forEach>
		</table>
		<!--	페이징처리  -->
		<c:if test="${pvo.startPage > pvo.pageBlock }">
			<a href="/customer/empFind?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
			<a href="/customer/empFind?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
		</c:forEach>
		
		<c:if test="${pvo.endPage<pvo.pageCount }">
			<a href="/customer/empFind?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
		</c:if>
		<!--	페이징처리  -->
		
	</div>
	
	<script>
	
	function selectRow(emp_id){
		
	}
	
	//부모창으로 값 보내기 
	function sendEmpInfoValue(id){
		$.ajax({
			url : '/customer/empInfo',
			type : 'get',
			data : {
				emp_id : id
			},
			success : function(data){
				window.opener.document.getElementById("emp_name").value = data.emp_name;
				window.opener.document.getElementById("emp_tel").value = data.emp_phone;
				window.opener.document.getElementById("emp_email").value = data.emp_email;
				window.close();
			}
		});//ajax END
	}//sendEmpInfoValue END
	
	</script>
</body>
