<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수주 수정하기</h1>
	<form action="" method="post">
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
		<input type="submit" value="수정완료"> <input type="button"
			value="목록으로" onclick="location.href='/customer/list';">
	</form>
</body>
</html>