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

<h1>출고 상세 보기</h1>

<button>엑셀파일</button>
<button class="print-button" onclick="info_print()">인쇄하기</button>
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

<fmt:formatDate value=""/> 
<table border="1">
		<tr>
			<th>작업지시번호</th>
			<td>${param.production_id }</td>
			
			<th>납기일</th>
			<td>${resultVO.due_date }</td>
			
			<th>작업지시일자</th>
			<td>${resultVO.production_date }</td>
			
			<th>작업지시담당직원</th>
			<td>${resultVO.production_emp }</td>
		</tr>
		<tr>
			<th>출고관리번호</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.op_id == '0'}"> </c:when>
					<c:otherwise>${resultVO.op_id }</c:otherwise>
				</c:choose>
			</td>
			
			<th>출고진행현황</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.op_process.equals('미출고') }">
						<span style="color:red">미출고</span>
					</c:when>
					<c:otherwise>${resultVO.op_process }</c:otherwise>
				</c:choose>
			</td>
			
			<th>출고일자</th>
			<td><fmt:formatDate value="${resultVO.op_date}" pattern="yyyy-MM-dd"/></td>
			
			<th>출고담당직원</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.op_emp == 0}"> </c:when>
					<c:otherwise>${resultVO.op_emp }</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>품명</th>
			<td colspan="3">${resultVO.product_name }</td>
			<th>납품처명</th>
			<td colspan="3">${resultVO.cust_name }</td>
		</tr>
</table>


















</body>
</html>