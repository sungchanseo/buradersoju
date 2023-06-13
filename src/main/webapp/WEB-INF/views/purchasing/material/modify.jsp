<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>modify.jsp</h1>
<h2>http://localhost:8088/purchasing/material/modify</h2>

<!-- 값 얻어와서 저장해서 value값에 노출시키기 -->

<fieldset>
	<legend>자재 수정하기</legend>
	
	<form action="" method="post">							
		품목코드 : <input type="text" name="ma_id" value="" readonly> <br>	<!-- 자동 넘버링 기능 추가하기 -->
		품목명 : <input type="text" name="ma_name" value="" > <br>	
		단가(원) : <input type="text" name="unit_cost" value="" > <br>
		창고번호 : <input type="text" name="whs_num" value="" > <br> 		<!-- dropdown / MW창고만 -->
		선반위치 : <input type="text" name="shelt_position" value="" > <br>
		이미지 : <input type="file" name="ma_image" value="" > <br>			<!-- default.jpg 이미지 -->
		담당직원 : <input type="text" name="ma_emp" value="" > <br>			<!-- 사원검색기능 추가 -->
		
		<input type="submit" value="자재 수정">
	</form>
	
</fieldset>





</body>
</html>