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
	<form action="" role="form" method="post">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name" value="${contractInfo.cust_name }"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name" value="${contractInfo.product_name }"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp" value="${contractInfo.cont_emp }"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id" value="${contractInfo.cust_id }"></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id" value="${contractInfo.product_id }"></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date" value="${contractInfo.cont_date }"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th></th>
				<td></td>
				<th>납품일자</th>
				<td><input type="date" name="due_date"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success" onclick="sendForm();">수정완료</button>
		<button type="button" class="btn btn-success" onclick="history.back();">뒤로가기</button>
		<button type="button" class="btn btn-light" onclick="window.close();">창닫기</button>
	</form>
	
	<script type="text/javascript">
	//작성완료를 눌렀을 때 ajax 메소드
		function sendForm() {
	
			//폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			$.ajax({
				url : '/contract/list', 
				type : 'POST', 
				data : JSON.stringify(formObject),
				contentType : "application/json",
				success : function(json) {
					alert("수주 수정을 완료했다.");
					window.opener.location.reload();
					window.close();
				}
// 				error : function(json) {
// 					alert("거래처 수정을 완료했다.");
// 					window.opener.location.reload();
// 					window.close();
// 				}
			});
			
		};//작성완료를 눌렀을 때 ajax 메소드
		
		
	</script>
</body>
</html>