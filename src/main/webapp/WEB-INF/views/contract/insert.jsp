<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<h1>수주 등록하기</h1>
	<form role="form" id="fr">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name" id="cust_name"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name" id="product_name"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp" id="cont_emp"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id" id="cust_id"></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id" id="product_id"></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date" id="cont_date"></td>
			</tr>
			<tr>
				<th>수주량</th>
				<td><input type="text" name="cont_qty" id="cont_qty"></td>
				<th>작업지시번호</th>
				<td><input type="text" name="production_id" readonly></td>
				<th>납품일자</th>
				<td><input type="date" name="due_date" onchange="limitDate();" id="due_date"></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-success" value="작성완료">
		<input type="reset" class="btn btn-success" value="초기화">
		<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">
	</form>
<!-- 	http://localhost:8088/contract/list -->
<!-- 	제이쿼리 -->
	<script>
	
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
				if($('#cont_qty').val() == ""){
					alert('수주량을 입력하세요.');
					$('#cont_qty').focus();
					return false;
				}//cont_qty 제어 
				if($('#due_date').val() == ""){
					alert('납기일을 입력하세요.');
					$('#due_date').focus();
					return false;
				}//due_date 제어 
				
				
				
		
		  });// fr.sumbit() END
	});// document.ready END
	
	
	
		function sendForm() {
			//상단의 폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			var status = true;
			consol.log(formObject);

			
			//작성완료 버튼을 눌렀을 때 ajax를 실행하도록 한다.
			$.ajax({
				url : '/contract/insert',
				type : 'POST',
				data : formObject,
				success : function(json) {
					alert("수주등록이 완료되었습니다.");
					status = true;
					window.opener.location.reload();
					window.close();
				}
			});
		}// sendForm()메소드 끝
		
		
		//납품날짜가 수주날짜보다 늦게 설정하는 메소드 
		function limitDate(){
			
			var contDateInput = document.querySelector('input[name="cont_date"]');
			var dueDateInput = document.querySelector('input[name="due_date"]');
			var contDate = new Date(contDateInput.value);
			var dueDate = new Date(dueDateInput.value);

			if (dueDate > contDate) {
				dueDateInput.value = contDateInput.value;
			}else {
			    contDateInput.value = dueDateInput.value;
		  }

		}//limitDate(); 메소드 끝
	</script>	
</body>
</html>