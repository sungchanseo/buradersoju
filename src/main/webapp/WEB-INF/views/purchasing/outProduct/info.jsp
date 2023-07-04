<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>


<h1 style="text-align: center;">출고 상세보기</h1>
	
	<div>
		<button class="btn btn-success">엑셀파일</button>
		<button class="btn btn-success print-button" onclick="info_print()">인쇄하기</button>
			<script>
				/// 인쇄하기 버튼
				function info_print() {
				  let initBody = document.body;
				  let hiddenBtn = document.querySelector('.print-button'); 
				  let hiddenHeader = document.querySelector('#header');
				  let hiddenNavbar = document.querySelector('.navbar-device');
				  let hiddenClearfix = document.querySelector('.clearfix');
				 
				  window.onbeforeprint = function () {
				    hiddenBtn.style.display = "none";
				    hiddenHeader.style.display = "none";
				    hiddenNavbar.style.display = "none";
				    hiddenClearfix.style.display = "none";
				    document.body = document.querySelector('.main-container');
				  }
				  window.onafterprint = function () {
				    hiddenBtn.style.display = "block";
				    hiddenHeader.style.display = "block";
				    hiddenNavbar.style.display = "block";
				    hiddenClearfix.style.display = "block";
				    document.body = initBody;
				  }
				  window.print();
				} 
			</script>
	</div>
	


	<!-- 테이블 -->
	<div>
		<fmt:formatDate value=""/> 
		<table border="1">
			<tr>
				<th>수주관리번호</th>
				<td>${param.cont_id }</td>
				
				<th>작업지시번호</th>
				<td>${info.production_id }</td>
				
				<th>수주량</th>
				<td>${info.cont_qty }</td>
				
				<th>재고확인</th>
				<td>
					<c:choose>
						<c:when test="${info.product_qty >= info.cont_qty}">
							<span style="color:blue">출고가능</span>
						</c:when>
						<c:when test="${info.product_qty < info.cont_qty}">
							<span style="color:red">출고불가능</span>
						</c:when>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<th>출고관리번호</th>
				<td>
					<c:choose>
						<c:when test="${info.op_id == '0'}"> </c:when>
						<c:otherwise>${info.op_id }</c:otherwise>
					</c:choose>
				</td>
				
				<th>출고진행현황</th>
				<td>
					<c:choose>
						<c:when test="${info.op_process.equals('미출고') }">
							<span style="color:red">미출고</span>
						</c:when>
						<c:when test="${info.op_process.equals('출고완료') }">
							<span style="color:blue">출고완료</span>
						</c:when>
					</c:choose>
				</td>
				
				<th>출고일자</th>
				<td><fmt:formatDate value="${info.op_date}" pattern="yyyy-MM-dd"/></td>
				
				<th>출고담당직원</th>
				<td>
					<c:choose>
						<c:when test="${info.op_emp == 0 || empty info.op_emp}"> </c:when>
						<c:otherwise>${info.op_emp }</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<th>품명</th>
				<td colspan="2">${info.product_name }</td>
				
				<th>납품처명</th>
				<td colspan="2">${info.cust_name }</td>
				
				<th>납기일</th>
				<td>${info.due_date }</td>
			</tr>
		</table>
	</div>

</body>
</html>