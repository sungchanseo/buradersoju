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
</head>
<body>
<h1>수주검색</h1>
	<!-- 검색창기능 -->
	<form action="" method="get" style="display: inline;">
		<select name="selector">
			<option value="cust_name">수주처</option>
			<option value="cont_id">수주번호</option>
		</select> <input type="text" style="display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	<!-- 검색창기능 -->

	<!-- 수주 테이블 -->
	<div class="table-responsive">
		<table class="table table-hover" style="text-align :center;">
			<tr>
				<th style="width: 60px">수주번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>수주처</th>
				<th>수주량</th>
				<th>수주일</th>
				<th>납기일</th>
			</tr>
			
			<c:forEach var="vo" items="${contractList }">
			<c:if test="${vo.production_id == null}">
				<tr onclick="sendContInfoValue('${vo.cont_id}');">
					<td>${vo.cont_id }</td>
					<td>${vo.product_id }</td>
					<td>${vo.product_name }</td>
					<td>${vo.cust_name }</td>
					<td>${vo.cont_qty }</td>
					<td>${vo.cont_date }</td>
					<td>${vo.due_date }</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<!--	페이징처리  -->
		<c:if test="${pvo.startPage > pvo.pageBlock }">
			<a href="/workOrder/contFind?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
			<a href="/workOrder/contFind?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
		</c:forEach>
		
		<c:if test="${pvo.endPage<pvo.pageCount }">
			<a href="/workOrder/contFind?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
		</c:if>
		<!--	페이징처리  -->
		
	</div>
	
	<script>
	
	function selectRow(cont_id){
		
	}
	
	//부모창으로 값 보내기 
	function sendContInfoValue(id){
		$.ajax({
			url : '/workOrder/contInfo',
			type : 'get',
			data : {
				cont_id : id
			},
			success : function(data){
				window.opener.document.getElementById("cont_id").value = data.cont_id;
				setTimeout(function() {
					window.close();
					}, 200);
			}
		});//ajax END
	}//sendContInfoValue END
	
	</script>
</body>
