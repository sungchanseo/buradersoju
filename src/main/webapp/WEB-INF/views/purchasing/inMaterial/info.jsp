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

<h1>${param.order_id }_info.jsp</h1>

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
			<th>발주관리번호</th>
			<td>${param.order_id }</td>
			
			<th>납기일</th>
			<td>${resultVO.due_date }</td>
			
			<th>발주일자</th>
			<td>${resultVO.order_date }</td>
			
			<th>발주담당직원</th>
			<td>${resultVO.order_emp }</td>
		</tr>
		<tr>
			<th>입고관리번호</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.in_id == '0'}"> </c:when>
					<c:otherwise>${resultVO.in_id }</c:otherwise>
				</c:choose>
			</td>
			
			<th>입고진행현황</th>
			<td>${resultVO.in_process }</td>
			
			<th>입고일자</th>
			<td><fmt:formatDate value="${resultVO.in_date}" pattern="yyyy-MM-dd"/></td>
			
			<th>입고담당직원</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.in_emp == 0}"> </c:when>
					<c:otherwise>${resultVO.in_emp }</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>품명</th>
			<td>${resultVO.ma_name }</td>
			
			<th>발주수량</th>
			<td>${resultVO.order_qty }</td>
			
			<th>재고수량</th>
			<td>
				<c:choose>
					<c:when test="${resultVO.ma_qty < 100 }">
						<span style="color:red">${resultVO.ma_qty }</span>
					</c:when>
					<c:otherwise>${resultVO.ma_qty }</c:otherwise>
				</c:choose>
			</td>
			
			<th>위치</th>
			<td>${resultVO.shelt_position }</td>
		</tr>
</table>


</body>
</html>