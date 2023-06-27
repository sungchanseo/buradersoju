<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

// 오늘 날짜 출력
function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
     
	return year + "-" + month + "-" + day;
}

// JQuery
$(document).ready(function(){
	
	// 날짜 정보 저장
	var regdate = getToday();
	
	// 수정할 행의 데이터 판별
	var ma_id;
	if(ma_id == "${resultVO.ma_id}") {		// $(this).hasClass('true')
		let tbl = "<tr>";
		tbl += "<td>";
		tbl += "</td>";
        tbl += "<td>";
        tbl += "<input type='text' name='whs_id' id='whs_id'>";
        tbl += "</td>";
		tbl += "<td>";
		tbl += ma_id;
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='ma_name' id='ma_name'>";
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='unit' id='unit'>";
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='ma_qty' id='ma_qty'>";
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='unit_cost' id='unit_cost'>";
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='shelt_position' id='shelt_position'>";
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += regdate;
	    tbl += "</td>";
	    tbl += "<td>";
	    tbl += "<input type='text' name='ma_emp' id='ma_emp'>";
	    tbl += "</td>";
	    tbl += "</tr>";
	    
		$('table').append(tbl);
		$(this).removeClass('true');
	} 

}); // JQuery

</script>
</head>
<body>

<h1>modify.jsp</h1>
<h2>/purchasing/material/modify?ma_id=${resultVO.ma_id }</h2>

<div class="row">
	<button class="insertForm true">등록</button>
	<button class="btn btn-outline btn-primary pull-right" id="modify">수정</button>
	<button class="insert update delete">저장</button>
	<button class="deleteForm">삭제</button>

   	<fmt:formatDate value=""/>
	<table border="1" id="example-table-3" class="table table-bordered table-hover text-center">
	<tr>
		<th></th>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단위</th>
		<th>재고량</th>
		<th>단가(WON)</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>최근 수정 날짜</th>
		<th>담당직원</th>
	</tr>
    <c:forEach var="ml" items="${materialList }">
      <tr>
      	<td><input type="checkbox" name="check"></td>
      	<td>${ml.ma_id }</td>
		<td>${ml.ma_name }</td>
		<td>${ml.unit }</td>
		<td>${ml.ma_qty }</td>
		<td>${ml.unit_cost }</td>
		<td>${ml.whs_id }</td>
		<td>${ml.shelt_position }</td>
		<td><fmt:formatDate value="${ml.ma_regdate}" pattern="yyyy-MM-dd"/></td>
		<td>${ml.ma_emp }</td>
      </tr>
   </c:forEach>
   </table>
</div>
   

   
</body>
</html>