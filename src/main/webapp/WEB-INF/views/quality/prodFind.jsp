<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11%22%3E"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">


</head>
<body>
<h1>작업지시검색</h1>
	<!-- 검색창기능 -->
	<form action="" method="get" style="display: inline;">
		<select name="selector">
			<option value="cont_id">수주번호</option>
			<option value="product_id">상품코드</option>
			<option value="product_name">상품명</option>
		</select> <input type="text" style="display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	<!-- 검색창기능 -->

	<!-- 수주 테이블 -->
	<div class="table-responsive">
		<table class="table table-hover" style="text-align :center;">
			<tr>
				<th style="width: 60px">작업지시번호</th>
				<th>수주번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>생산라인</th>
				<th>작업지시수량</th>
				<th>생산수량</th>
				<th>생산상태</th>
			</tr>
			
			<c:forEach var="vo" items="${workOrderList}">
<%-- 			<c:if test="${vo.production_status =='포장'&& vo.production_status eq'포장'}"> --%>
				<tr onclick="sendProdInfoValue('${vo.production_id}');">
					<td>${vo.production_id}</td>
					<td>${vo.cont_id }</td>
					<td>${vo.product_id }</td>
					<td>${vo.product_name }</td>
					<td>${vo.production_line }</td>
					<td>${vo.plan_qty }</td>
					<td>${vo.production_qty }</td>
					<td>${vo.production_status}</td>
				</tr>
<%-- 				</c:if> --%>
			</c:forEach>
		</table>
		<!--	페이징처리  -->
		<c:if test="${pvo.startPage > pvo.pageBlock }">
			<a href="/quality/prodFind?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
			<a href="/quality/prodFind?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
		</c:forEach>
		
		<c:if test="${pvo.endPage<pvo.pageCount }">
			<a href="/quality/prodFind?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
		</c:if>
		<!--	페이징처리  -->
		
	</div>
	
	<script>
	
	function selectRow(production_id){
		
	}
	
	//부모창으로 값 보내기 
	function sendProdInfoValue(id){
		$.ajax({
			url : '/quality/prodInfo',
			type : 'get',
			data : {
				production_id : id
			},
			success : function(data){
				window.opener.document.getElementById("production_id").value = data.production_id;
				setTimeout(function() {
				window.close();
				}, 200);
			}
		});//ajax END
	}//sendProdInfoValue END
	
	</script>
</body>
