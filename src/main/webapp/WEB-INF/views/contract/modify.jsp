<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>수주번호 : ${contractInfo.cont_id }</h1>
	<form action="" role="form" id="fr" method="post">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name" id="cust_name" value="${contractInfo.cust_name }"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name" id="product_name" value="${contractInfo.product_name }"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp" id="cont_emp" value="${contractInfo.cont_emp }"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id" id="cust_id" value="${contractInfo.cust_id }"></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id" id="product_id" value="${contractInfo.product_id }"></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date" id="cont_date" value="${contractInfo.cont_date }"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th></th>
				<td></td>
				<th>납품일자</th>
				<td><input type="date" name="due_date" id="due_date" value="${contractInfo.due_date }"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success">수정완료</button>
		<button type="button" class="btn btn-success" onclick="history.back();">뒤로가기</button>
		<button type="button" class="btn btn-light" onclick="window.close();">창닫기</button>
	</form>
	
	<script type="text/javascript">

	$(document).ready(function(){
		
		 //빈칸이 있을때 submit 제어 
		  $('#fr').submit(function() {
				if($('#cust_name').val() == ""){
					alert('수주처이름을 입력하세요.');
					$('#cust_name').focus();
					return false;
				}//cust_name 제어 
				if($('#product_name').val() == ""){
					alert('상품명을 입력하세요.');
					$('#product_name').focus();
					return false;
				}//product_name 제어 
				if($('#cont_emp').val() == ""){
					alert('담당직원을 입력하세요.');
					$('#cont_emp').focus();
					return false;
				}//cont_emp 제어 
				if($('#cust_id').val() == ""){
					alert('거래처코드를 입력하세요.');
					$('#cust_id').focus();
					return false;
				}//cust_id 제어 
				if($('#product_id').val() == ""){
					alert('상품코드를 입력하세요.');
					$('#product_id').focus();
					return false;
				}//product_id 제어 
				if($('#cont_date').val() == ""){
					alert('수주일을 입력하세요.');
					$('#cont_date').focus();
					return false;
				}//cont_date 제어 
				if($('#due_date').val() == ""){
					alert('납기일을 입력하세요.');
					$('#due_date').focus();
					return false;
				}//due_date 제어 
		
			//폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			$.ajax({
				url : '${contextPath}/contract/modify', 
				type : 'POST', 
				data : formObject, 
				success : function() {
					alert("수주수정이 완료되었읍니다.");
					window.opener.location.reload();
					window.close();
				}, //success
				error : function() {
					alert("수주수정이 완료되었읍니다.");
					window.opener.location.reload();
					window.close();
				} //error
			});// ajax END
		  });//submit END	
	});// document.ready END
		
	</script>
</body>
</html>