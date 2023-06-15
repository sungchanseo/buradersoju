<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">

function deleteAlert(){
	alert("삭제가 완료되었습니다.");
}

</script>



</head>
<body>

<h1>delete.jsp</h1>
<h2>http://localhost:8088/purchasing/material/delete</h2> <br><br>

	<form action="" method="post" onsubmit="deleteAlert();">
		<h3>'${param.ma_id }' 정보를 삭제하시려면 비밀번호를 입력하세요.</h3>
		비밀번호 : <input type="password" name="emp_pw"> 	
		<input type="submit" value="삭제하기">
	</form>

</body>
</html>