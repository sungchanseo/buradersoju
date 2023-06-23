<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
// 




</script>
</head>
<body>


<h1>${param.order_id }_info.jsp</h1>
<%-- ${resultVO } --%>


<table border="1">
		<tr>
			<th>발주관리번호</th>
			<td>${param.order_id }</td>
			
			<th>납기일</th>
			<td>${resultVO.due_date }</td>
			
			<th>발주일자</th>
			<td>${resultVO.order_date }</td>
			
			<th>발주담당직원</th>
			<td>${resultVO.order_emp }</td>
		</tr>
		<tr>
			<th>입고관리번호</th>
			<td>${resultVO.in_id }</td>
			
			<th>입고진행현황</th>
			<td>${resultVO.in_progress }</td>
			
			<th>입고일자</th>
			<td>${resultVO.in_date }</td>
			
			<th>입고담당직원</th>
			<td>${resultVO.in_emp }</td>
		</tr>
		<tr>
			<th>품명</th>
			<td>${resultVO.ma_name }</td>
			
			<th>발주수</th>
			<td>${resultVO.order_qty }</td>
			
			<th>재고수량</th>
			<td>${resultVO.ma_qty }</td>
			
			<th>위치</th>
			<td>${resultVO.shelt_position }</td>
		</tr>
</table>


</body>
</html>