<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>


<!-- <form action="" method="post">
 <input type="text"
</form>
 -->
 <form action="" method="post">								
		품목명 : <input type="text" name="ma_name"> <br>	
		단가(원) : <input type="text" name="unit_cost"> <br>
		창고번호 : <input type="text" name="whs_num"> <br> 	<!-- dropdown / MW창고만 -->
		선반위치 : <input type="text" name="shelt_position"> <br>
		이미지 : <input type="file" name="ma_image"> <br>	<!-- default.jpg 이미지 -->
		담당직원 : <input type="text" name="ma_emp"> <br>	<!-- 사원검색기능 추가 -->		
		<input type="submit" value="자재 등록">
	</form>
</body>
</html>