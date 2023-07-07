<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>검수 상세 보기</title>
<style type="text/css">
table {margin-bottom: 1em;}

table, th {border: none;}

th {background-color: #04AA6D;
color: #fff;
text-align: center;
padding: 10px 8px;}

td {border:1px solid #04AA6D;
padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;}

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
</style>
</head>
<body>
	<h1>검수 상세 보기</h1>
<%-- 	${vo } --%>
	<div class="qualityInfo">
	<button class="print-button" onclick="info_print()">인쇄하기</button>
		<script>
			/* 인쇄하기 버튼 */
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
	<table border="1">
		<tbody>
			<tr>
				<th>검수번호</th>
				<td>${vo.qc_num }</td>
				<th>상품명</th>
				<td>${vo.product_name }</td>
				<th>검수량</th>
				<td>${vo.qc_qty }</td>
				<th>불량코드</th>
				<td>${vo.def_code }</td>
			</tr>
			<tr>
				<th>작업지시번호</th>
				<td>${vo.production_id }</td>
				<th>상품코드</th>
				<td>${vo.product_id }</td>
				<th>검수자</th>
				<td>${vo.qc_emp }</td>
				<th>불량수량</th>
				<td>${vo.def_qty }</td>
			</tr>
			<tr>
				<th>생산라인</th>
				<td>${vo.production_line }</td>
				<th>생산량</th>
				<td>${vo.production_qty }</td>
				<th>검수완료일시</th>
				<td>${vo.qc_date }</td>
				<th>불량률</th>
				<td><fmt:formatNumber value="${(vo.def_qty /vo.qc_qty*100) }" pattern="#.###"/></td>
			</tr>
		
	</tbody>
	</table>
	</div>
</body>
</html>