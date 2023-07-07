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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${contextPath }/resources/css/table.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
</head>
<body>
	<h1>수주번호 : ${contractInfo.cont_id }</h1>
	<form action="" role="form" id="fr" method="post">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name" id="cust_name" value="${contractInfo.cust_name }" onclick="custPop();"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name" id="product_name" value="${contractInfo.product_name }" onclick="productPop();"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp" id="cont_emp" value="${contractInfo.cont_emp }" onclick="empPop();"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id" id="cust_id" value="${contractInfo.cust_id }" readonly></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id" id="product_id" value="${contractInfo.product_id }" readonly></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date" id="cont_date" value="${contractInfo.cont_date }"></td>
			</tr>
			<tr>
				<th>수주량</th>
				<td><input type="text" name="cont_qty" id="cont_qty" value="${contractInfo.cont_qty }"> </td>
				<th>작업지시번호</th>
				<td><input type="text" name="production_id" id="production_id"></td>
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
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '수주처이름을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#cust_name').focus();
					return false;
				}//cust_name 제어 
				if($('#product_name').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '상품명을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#product_name').focus();
					return false;
				}//product_name 제어 
				if($('#cont_emp').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '담당직원을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#cont_emp').focus();
					return false;
				}//cont_emp 제어 
				if($('#cust_id').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '거래처코드를 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#cust_id').focus();
					return false;
				}//cust_id 제어 
				if($('#product_id').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '상품코드를 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#product_id').focus();
					return false;
				}//product_id 제어 
				if($('#cont_date').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '수주일을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#cont_date').focus();
					return false;
				}//cont_date 제어 
				if($('#cont_qty').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '수주량을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
					$('#cont_qty').focus();
					return false;
				}//cont_qty 제어 
				if($('#due_date').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '납기일을 입력하세요.',	// Alert 제목
			            confirmButtonText: '확인',		// Alert 버튼내용
	        		});
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
                        window.opener.location.reload();
                        window.close();
				}//success
			});// ajax END
		  });//submit END	
	});// document.ready END
		
	
	//수주처 검색 및 자동완성 기능 
	function custPop(){
		var custPop = window.open('/contract/custFind', '수주처검색', 'width=700px,height=650px');
		
		if(custPop == null){
			 Swal.fire({
		            icon: 'warning',				// Alert 타입
		            title: '팝업이 차단되었습니다.',	// Alert 제목
		            text: '차단을 해제하세요.',		// Alert 내용
		            confirmButtonText: '확인',		// Alert 버튼내용
     		});
		  }
// 		custPop.moveBy(100,100);
	}//custPop END
	
	//상품명 검색 및 자동완성 기능 
	function productPop(){
		var productPop = window.open('/contract/productFind', '상품검색', 'width=700px,height=500px');
		
		if(productPop == null){
			  Swal.fire({
		            icon: 'warning',				// Alert 타입
		            title: '팝업이 차단되었습니다.',	// Alert 제목
		            text: '차단을 해제하세요.',		// Alert 내용
		            confirmButtonText: '확인',		// Alert 버튼내용
        		});
		  }
// 		productPop.moveBy(100,100);
	}//productPop END
	
	//직원정보 검색 및 자동완성 기능 
	function empPop(){
		var empPop = window.open('/contract/empFind', '직원검색', 'width=700px,height=500px');
		
		if(empPop == null){
			Swal.fire({
	            icon: 'warning',				// Alert 타입
	            title: '팝업이 차단되었습니다.',	// Alert 제목
	            text: '차단을 해제하세요.',		// Alert 내용
	            confirmButtonText: '확인',		// Alert 버튼내용
    		});
		  }
// 		empPop.moveBy(100,100);
	}//empPop END
	</script>
</body>
</html>