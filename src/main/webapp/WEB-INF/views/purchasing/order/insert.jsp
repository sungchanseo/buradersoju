<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <form action="" method="post">
				발주번호 : <input type="text" name="order_id"><br>
				품번 : <input type="text" name="ma_id"><br>
				품명 : <input type="text" name="order_maName"><br>
				수량 : <input type="text" name="order_qty"><br>
				부가세 : <input type="text" name="order_vat"><br>
				입고창고 : <input type="text" name="whs_num"><br>
				단가 : <input type="text" name="order_unitCost"><br>
				총액 : <input type="text" name="order_sum"><br>
				담당직원 : <input type="text" name="order_emp"><br>
			    <input type="submit" value="발주등록"> 
		  </form>
</body>
</html>