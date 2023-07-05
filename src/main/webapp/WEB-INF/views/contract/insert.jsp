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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>
<body>
	<h1>수주 등록</h1>
	<form role="form" id="fr">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name" id="cust_name" onclick="custPop();"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name" id="product_name" onclick="productPop();"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp" id="cont_emp" onclick="empPop();"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id" id="cust_id" readonly></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id" id="product_id" readonly></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date" id="cont_date"></td>
			</tr>
			<tr>
				<th>수주량</th>
				<td><input type="text" name="cont_qty" id="cont_qty"></td>
				<th>작업지시번호</th>
				<td><input type="text" name="production_id" value="수정하기에서 입력하세요." readonly></td>
				<th>납품일자</th>
				<td><input type="date" name="due_date" onchange="limitDate();" id="due_date"></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-success" value="작성완료" onclick="sendForm();">
		<input type="reset" class="btn btn-success" value="초기화">
		<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">
	</form>
<!-- 	http://localhost:8088/contract/list -->
<!-- 	제이쿼리 -->
	<script>
	
	//수주처 검색 및 자동완성 기능 
	function custPop(){
		var custPop = window.open('/contract/custFind', '수주처검색', 'width=700px,height=650px');
		
		if(custPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
// 		custPop.moveBy(100,100);
	}//custPop END
	
	//상품명 검색 및 자동완성 기능 
	function productPop(){
		var productPop = window.open('/contract/productFind', '상품검색', 'width=700px,height=500px');
		
		if(productPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
// 		productPop.moveBy(100,100);
	}//productPop END
	
	//직원정보 검색 및 자동완성 기능 
	function empPop(){
		var empPop = window.open('/contract/empFind', '직원검색', 'width=700px,height=500px');
		
		if(empPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
// 		empPop.moveBy(100,100);
	}//empPop END
	
	function sendForm() {

		var formObject ={
				cust_name:$('#cust_name').val(),
				product_name:$('#product_name').val(),
				cont_emp:$('#cont_emp').val(),
				cust_id:$('#cust_id').val(),
				product_id:$('#product_id').val(),
				cont_date:$('#cont_date').val(),
				cont_qty:$('#cont_qty').val(),
				production_id:$('#production_id').val(),
				due_date:$('#due_date').val()
		}//formObject END
		console.log(formObject);
	
	
		//작성완료 버튼을 눌렀을 때 ajax를 실행하도록 한다.
		$.ajax({
			url : '${contextPath}/contract/insert',
			type : 'POST',
	//			data : formObject,
			contentType : 'application/json',
			data : JSON.stringify(formObject),
			success : function() {
				alert("수주등록이 완료되었습니다.");
	//				window.opener.location.reload();
	//				window.close();
			}, 
			error : function(){
				alert('에러 발생!');
			}//error END
		});// ajax END
	}// sendForm() END
		
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
	
		
		// 수주일의 기본설정을 오늘날짜로 하는 코드
		document.getElementById('cont_date').valueAsDate = new Date();
		
		//납품날짜가 수주날짜보다 같거나 늦게 설정하는 메소드 
		function limitDate(){
			
			var contDateInput = document.querySelector('input[name="cont_date"]');
			var dueDateInput = document.querySelector('input[name="due_date"]');
			var contDate = new Date(contDateInput.value);
			var dueDate = new Date(dueDateInput.value);

			if (dueDate > contDate) {
				dueDateInput.value = contDateInput.value;
			}else {
			    contDateInput.value = dueDateInput.value;
			}//else
		}//limitDate(); 메소드 끝
		
		
	</script>	
</body>
</html>