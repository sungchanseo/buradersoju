<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<title>작업 지시 상세</title>
<style type="text/css">
table {margin-bottom: 1em;
	   text-align: center;
	   border-radius: 10px;
/*     border-collapse: collapse; */
    }

table, th {border: none;}

th {background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {border:1px solid #04AA6D;
	padding: 10px 6px;
/*  	color: #6C7293;  */
/* 	color: gray; */
	}

#tb-btns {margin-left: 0.5em;}

.btn{
/* 	display: inline-block; */
	font-weight: 600;
	line-height: 1;
	color: #6C7293;
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
	
.btn-success:disabled {
	opacity: 0.6;
  	cursor: not-allowed;
}

.btn-info {
	color: #000;
	background-color: #2fddf8;
	border-color: #23dbf8;}
	
.btn_add{
	color: #ffffff;
	background-color: #04AA6D;
	border-color: #0ddbb9;}
	
.container {
	position: relative;}

/* .btn_btn { */
/* 	position: absolute; */
/* 	top: 0; */
/* 	right: 0;} */
	
.btn-light {
  color: #000;
  background-color: #d8d8d8;
  border-color: #d8d8d8;
}

.btn_table table {
	width: 100%;}
/* 테이블 css */

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
	<h1 style="display: flex; justify-content: center;">작업지시번호 : ${workOrder.production_id}</h1>
	<input type="hidden" id="production_id" value="${workOrder.production_id}">
	<input type="hidden" id="product_id" value="${workOrder.product_id}">
<!-- 		<div > -->
		<div style="margin-left: 453px;">
<!-- 	<div style="display: flex; justify-content: center;"> -->
<!-- 	<button type="button" class="btn btn-light" onclick="" style="margin: 0.5px;">엑셀파일</button> -->
	<button type="button" class="btn btn-light" onclick="info_print()" style="margin: 0.5px;">인쇄하기</button>
		</div>
	<div style="display: flex; justify-content: center;">
  <table border="1">
    <tr>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>작업지시수량</th>
	  <th>작업지시일시</th>
	</tr>
    <tr>
	  <td>
	  <c:choose>
	  	<c:when test="${empty workOrder.cont_id}">
	  	<span style="color: #6C7293">( 일반 생산건 )</span>
	  	</c:when>
	  	<c:otherwise>
	 	 ${workOrder.cont_id}
	  	</c:otherwise>	 	 
	  </c:choose>
	  </td>
	  <td>${workOrder.emp_name}</td>
	  <td>${workOrder.plan_qty}</td>
	  <td><fmt:formatDate value="${workOrder.production_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업상태</th>
<!-- 	  <th>생산수량</th> -->
	</tr>
	 <tr>
	  <td>${workOrder.production_line}</td>
	  <td>${workOrder.product_id}</td>
	  <td>${workOrder.product_name}</td>
	  <td>${workOrder.workOrder_status}</td>
<%-- 	  <td>${workOrder.production_qty}</td> --%>
	 </tr>
	 
		   <c:if test="${workOrder.qc_num != null && workOrder.qc_num != ''}">
	  <tr>
		  <th>불량검수번호</th>
		  <th>총불량수</th>
		  <th>총생산량</th>
		  <th>검수완료일시</th>
	  </tr>
	  <tr>
		  <td>${workOrder.qc_num}</td>
		  <td>
		   ${workOrder.total_defQty}
		  </td>
		  <td>
		  ${workOrder.plan_qty-workOrder.total_defQty}
		  </td>
		  <td><fmt:formatDate value="${workOrder.qc_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	  </tr>
		  </c:if>
	 
  </table>
  </div>
  <div style="display: flex; justify-content: center;">
<c:if test="${emp_department.equals('Master')}">
  <button type="button" id="delWoBT" class="btn btn-success" style="margin: 0.5px;" >삭제</button>
  </c:if>
<%--   <button type="button" onclick="location.href='/workOrder/remove?product_id=${workOrder.product_id}&production_id=${workOrder.production_id}';" class="btn btn-success" style="margin: 0.5px;" >삭제</button> --%>
  <button type="button" class="btn btn-light" onclick="window.close();"style="margin: 0.5px;" >닫기</button>
  </div>
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#delWoBT").click(function(){ 
		 var product_id = $("#product_id").val();
		 var production_id = $("#production_id").val();
		 Swal.fire({
			   title: '삭제하시겠습니까?',
			   icon: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#3085d6', 
			   cancelButtonColor: '#d33', 
			   confirmButtonText: '승인', 
			   cancelButtonText: '취소'
			}).then(result => {
			   if (result.isConfirmed) {
				   $.ajax({
						url: '/workOrder/remove',
						type: 'POST',
						data : { product_id : product_id,
							production_id : production_id },
				   		success: function(data){
				   			Swal.fire({
								icon: 'success',
								title: '삭제 완료',
								text: '확인을 누르면 창을 닫습니다.',
								confirmButtonColor: '#0ddbb9',
								confirmButtonText: '확인'
							}).then(() => {
								window.opener.location.reload();
								window.close();
								}); // Swal2
				   			} // success
				   		}); //ajax
			   } // if
			}); //result
	 }); //Click
 }); //document
 
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