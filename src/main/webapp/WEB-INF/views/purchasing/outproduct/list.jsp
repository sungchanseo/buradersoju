<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<table border="1" class="table table-hover table-bordered text-center">
	<tr>
	   <th>출고관리번호</th>
	   <th>작업지시번호</th>
	   <th>납품자명</th>
	   <th>품명</th>
	   <th>주문수량</th>
	   <th>납기일자</th>
	   <th>진행현황</th>
	   <th>담당자</th>
	</tr>
	
	<c:forEach var="op" items="${outproductList}">
		<tr>
		    <td>${op.op_id}</td>
		    <td>${op.product_id}</td>
		    <td>${op.customer_name}</td>
		    <td>${op.product_name}</td>
		    <td>${op.op_qty}</td>
		    <td>${op.op_date}</td>
		    <td>${op.op_progress}</td>
		    <td>${op.op_empNum}</td>	
		</tr>
	</c:forEach>
</table>



<%@ include file="../../includes/footer.jsp" %>

</body>
</html>