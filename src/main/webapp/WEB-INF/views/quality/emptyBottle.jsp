<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>공병 관리</title>

</head>
<body>
	<h1>공병 관리</h1>
	<!-- 날짜 중복 안되게 수정 예정 -->
	<form action="btInsert" method="POST">
	<c:set var="today" value="<%=new Date()%>" />
	<fmt:formatDate var="today2" value="${today }" pattern="yyyy-MM-dd HH:mm:ss"/>
	<input type="hidden" value="${today2 }" name="bt_date">
	당일 공병 수량 <input type="text" id="bt_qty" name="bt_qty">
	<input type="submit" value="등록" >
	</form>
	<div class="bottleList">
	<table border='1'>
		<thead>
			<tr>
				<th>공병등록일자</th>
				<th>수량</th>
				<th>불량수량</th>
				<th>등록</th>
			</tr> 
		</thead>
		<tbody>    
			<c:forEach var="vo" items="${bottleList}" varStatus="status">
				<tr>
					<td><fmt:formatDate value="${vo.bt_date}" pattern="yyyy-MM-dd"/></td>
					<td>${vo.bt_qty}</td>
					<td>
						
						<input type="text" class="bt_defQty" value="${vo.bt_defQty}">
					</td>
					<td>
						<input type="button" class="btDefBT" value="불량등록" data-bt_date="${vo.bt_date}">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
		<!-- 불량 등록 버튼 동작 -->
		<script>
		$(document).ready(function() {
		  $(".btDefBT").click(function() {
		    var bt_date = $(this).data("bt_date");
		    var bt_defQty = $(this).closest("tr").find(".bt_defQty").val();
		
		    // form 태그 동적 생성
		    const form = $('<form>', {
		      method: 'post',
		      action: 'btUpdate',
		      'accept-charset': 'utf-8'
		    });
		
		    // 파라미터 전달용 hidden 추가
		    form.append($('<input>', {
		      type: 'hidden',
		      name: 'bt_date',
		      value: bt_date
		    }));
		
		    form.append($('<input>', {
		      type: 'hidden',
		      name: 'bt_defQty',
		      value: bt_defQty
		    }));
		
		    // form태그 body에 추가 후 전송
		    $('body').append(form);
		    form.submit();
		  });
		});
		</script>
</body>
</html>
