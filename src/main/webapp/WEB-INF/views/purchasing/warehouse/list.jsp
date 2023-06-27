<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

function click_add(){
	var url ="insert";
	var name ="insert";
	var option = "width = 600, height= 600, left =100, top=50,location=no";
	window.open(url,name,option);
}

</script>
<body>


<table border="1">
			<tr>
				<th>창고번호</th>
				<th>창고타입</th>
				<th>전화번호</th>
				<th>선반위치</th>
				<th>사용여부</th>
				<th>창고관리자</th>
				<th>수정</th>
				<th>삭제</th>
		
			</tr>
	            <c:forEach var="warehouse" items="${warehouseList}">
				<tr>
		        <td>${warehouse.whs_id}</td>
		        <td>${warehouse.whs_type}</td>
		        <td>${warehouse.whs_tel}</td>
		        <td>${warehouse.shelt_position}</td>
		        <td>${warehouse.whs_status}</td>
		        <td>${warehouse.whs_emp}</td>
		        <td><a href="/purchasing/warehouse/modify?whs_id=${warehouse.whs_id}">수정</a></td>
		        <td><a href="/purchasing/warehouse/remove?whs_id=${warehouse.whs_id}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>

<button class="add-button" type="button" onclick="click_add();">창고등록</button>
</body>
</html>
<%@ include file="../../includes/footer.jsp" %>