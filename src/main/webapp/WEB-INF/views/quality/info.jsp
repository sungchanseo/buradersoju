<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<title>검수 상세 보기</title>
<style type="text/css">
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
</head>
<body>
		<script>
		$(document).ready(function(){
			 $("#delQCBT").click(function(){ 
				 var qc_num = $("#qc_num").val();
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
								url: '/quality/remove',
								type: 'POST',
								data : { qc_num : qc_num },
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
	<h1 style="display: flex; justify-content: center;">검수 상세 보기</h1>
	<input type="hidden" id="qc_num" value="${vo.qc_num }">
<%-- 	${vo } --%>
<!-- 	<div class="qualityInfo"> -->
<!-- 	<div> -->
	<div style="margin-left: 562px;">
<!-- 	<button type="button" class="btn btn-light" onclick="" style="margin: 0.5px;">엑셀파일</button> -->
	<button type="button" class="btn btn-light" onclick="info_print()" style="margin: 0.5px;">인쇄하기</button>
	</div>
		<div style="display: flex; justify-content: center;">
	<table border="1">
		<tbody>
			<tr>
				<th>검수번호</th>
				<td>${vo.qc_num }</td>
				<th>상품명</th>
				<td>${vo.product_name }</td>
				<th>수주량</th>
				<td>${vo.plan_qty }</td>
<!-- 				<th>불량코드</th> -->
<%-- 				<td>${vo.def_code }</td> --%>
			</tr>
			<tr>
				<th>작업지시번호</th>
				<td>${vo.production_id }</td>
				<th>상품코드</th>
				<td>${vo.product_id }</td>
				<th>검수량</th>
				<td>${vo.qc_qty }</td>
				
			</tr>
			<tr>
				<th>검수완료일시</th>
				<td><fmt:formatDate value="${vo.qc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<th>생산라인</th>
				<td>${vo.production_line }</td>
				<th>총 생산량</th>
				<td>${vo.production_qty }</td>
				
			</tr>
			<tr>
			 <th>검수자</th>
			 <td>${vo.emp_name }</td>
			 <th>전체불량수량</th>
		 	 <td>${vo.total_defQty }</td>
			 <th>불량률</th>
			<td>
				<c:choose>
					<c:when test="${(vo.total_defQty /vo.plan_qty*100) > 3 }">
						<span style="color: red;">
							<fmt:formatNumber value="${(vo.total_defQty /vo.plan_qty*100) }" pattern="#.###"/>%
						</span>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${(vo.total_defQty /vo.plan_qty*100) }" pattern="#.###"/>%
					</c:otherwise>
				</c:choose>
			</td>
		  
				</tr>
	</tbody>
	</table>
	</div>
	<div style="display: flex; justify-content: center;">
	<table>
	<thead>
	 	<tr>
		  <th>불량코드</th>
		<c:forEach var="qvo" items="${qvo }">
		  <td>${qvo.def_code }</td>
		</c:forEach>
		</tr>
		<tr>
		  <th>수량</th>
		  <c:forEach var="qvo" items="${qvo }">
		  <td>${qvo.def_qty}</td>
		 </c:forEach>
		</tr>		
<!-- 		  <th></th> -->
<!-- 		  <th>작업지시일시</th> -->
<!-- 		</tr> -->
		</thead>
		<tbody>
	    <tr>
<%-- 		  <td>${workOrder.plan_qty}</td> --%>
<%-- 		  <td>${workOrder.production_date}</td> --%>
		</tr>	
		</tbody>
	</table>
	</div>
	<div style="display: flex; justify-content: center;">
	<c:if test="${emp_department.equals('Master')}">
	<button type="button" id="delQCBT" class="btn btn-success" style="margin: 0.5px;">삭제</button>
	</c:if>
<%-- 	<button type="button" id="delQCBT" onclick="location.href='/quality/remove?qc_num=${vo.qc_num}';" class="btn btn-success" style="margin: 0.5px;">삭제</button> --%>
  	<button type="button" class="btn btn-light" onclick="window.close();"style="margin: 0.5px;" >닫기</button>
	</div>
<!-- 	</div> -->
</body>
</html>