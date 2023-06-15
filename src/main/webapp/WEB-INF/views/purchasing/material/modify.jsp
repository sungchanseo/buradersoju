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

<%-- ${resultVO } --%>

		
	<form action="" method="post">							
		품목코드 : <input type="text" value="${resultVO.ma_id }" readonly> <br>	<!-- 자동 넘버링 기능 추가하기 -->
		품목명 : <input type="text" name="ma_name" value="${resultVO.ma_name }" > <br>	
		단가(원) : <input type="text" name="unit_cost" value="${resultVO.unit_cost }" > <br>
		창고번호 : <input type="text" name="whs_num" value="${resultVO.whs_num }" > <br> 		<!-- dropdown / MW창고만 -->
		선반위치 : <input type="text" name="shelt_position" value="${resultVO.shelt_position }" > <br>
		이미지 : <input type="file" name="ma_image" value="${resultVO.ma_image }" > <br>			<!-- default.jpg 이미지 -->
		담당직원 : <input type="text" name="ma_emp" value="${resultVO.ma_emp }" > <br>			<!-- 사원검색기능 추가 -->
		
		<input type="submit" value="자재 수정">
	</form>





</body>
</html>