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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<style type="text/css">
table {
margin-bottom: 1em;
margin-left:auto; 
margin-right:auto;}

table, th {border: none;}

th {background-color: #04AA6D;
color: #fff;
text-align: center;
padding: 10px 8px;}

td {border:1px solid #04AA6D;
text-align: center;
padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;
float: right;}

.btn{
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
/* .btn {background-color: #048; */
/* padding:8px 10px; */
/* color: #fff;} */

#buttons {
margin-left: 75%;
}


</style>
</head>
<body>

<h1 style="text-align: center;">출고 상세보기</h1>
	
	<div id="buttons">
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
				<td>${info.cont_qty }EA</td>
				
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
						<c:when test="${empty info.emp_name}"> </c:when>
						<c:otherwise>${info.emp_name }</c:otherwise>
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