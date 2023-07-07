<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 지시 상세</title>
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

	<style type="text/css">
	/* 인쇄하기 가로 기본출력 지정 */
		@page { size: A4 landscape; margin:0; }
		
	/* 엑셀, 인쇄 버튼 배치 */
	.button-group {
	  width: 170px;
	  height: 35px;
	  display: flex;
	  gap: 5px; /* 버튼 사이 간격 */
	  float: right; /* 오른쪽으로 배치 */
	  margin-top: 10px; /* 위 여백 추가 */
  	  margin-bottom: 10px; /* 아래 여백 추가 */
	}
	.button-group button {
	  flex: 1; /* 버튼들을 동일한 너비로 설정 */
	}
	</style>

</head>
<body>
	<h1>작업지시 상세</h1>
	
	<h2>작업지시번호 : ${workOrder.production_id} </h2> 
	
	<button>엑셀파일</button>
	<button class="print-button" onclick="info_print()">인쇄하기</button>
	
  <table border="1">
    <tr>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>작업지시일시</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	</tr>
	 <tr>
	  <td>${workOrder.cont_id}</td>
	  <td>${workOrder.production_emp}</td>
	  <td>${workOrder.production_date}</td>
	  <td>${workOrder.production_line}</td>
	  <td>${workOrder.product_id}</td>
	  <td>${workOrder.product_name}</td>
	  <td>${workOrder.plan_qty}</td>
	  <td>${workOrder.production_qty}</td>
	  <td>${workOrder.production_status}</td>
	 </tr>
  </table>
  
  <button type="button" onclick="location.href='/production/workOrderModify';">삭제</button>
  
  
 <script type="text/javascript">
 /* 인쇄 버튼 기능 */
 function info_print() {
 	window.print();
 } 
/* 인쇄하기 버튼 */
// function info_print() {
//   let initBody = document.body;
//   let hiddenBtn = document.querySelector('.print-button'); 
//   let hiddenHeader = document.querySelector('#header');
//   let hiddenNavbar = document.querySelector('.navbar-device');
//   let hiddenClearfix = document.querySelector('.clearfix');
 
//   window.onbeforeprint = function () {
//     hiddenBtn.style.display = "none";
//     hiddenHeader.style.display = "none";
//     hiddenNavbar.style.display = "none";
//     hiddenClearfix.style.display = "none";
//     document.body = document.querySelector('.main-container');
//   }
//   window.onafterprint = function () {
//     hiddenBtn.style.display = "block";
//     hiddenHeader.style.display = "block";
//     hiddenNavbar.style.display = "block";
//     hiddenClearfix.style.display = "block";
//     document.body = initBody;
//   }
//   window.print();
// } 
</script>
	
</body>
</html>