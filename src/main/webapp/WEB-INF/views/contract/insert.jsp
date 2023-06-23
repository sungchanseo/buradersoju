<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>수주 등록하기</h1>
	<form role="form" action="" method="post">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id"></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id"></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date"></td>
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
		<input type="button" value="작성완료" onclick="sendForm();">
		<input type="reset" value="초기화">
		<input type="button" value="창닫기" onclick="window.close();">
	</form>
<!-- 	http://localhost:8088/contract/list -->
<!-- 	제이쿼리 -->
	<script>
		function sendForm() {
			//상단의 폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			var status = true;

			alert(formObject);
			for (var i = 0; i < formObject.length; i++) {
				if (formObject[i].value == "") {
					alert("정보를 입력하세요!");
					status = false;
					break;
				}
			}

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
		}
	</script>	
</body>
</html>