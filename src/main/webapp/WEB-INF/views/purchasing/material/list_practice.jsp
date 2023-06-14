<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">

function rowAdd() {
	var objRow;
	objRow = document.all["tblShow"].insertRow();
	
	// 품목코드
	var ma_id = objRow.insertCell();
	ma_id.innerHTML = "<input type='text' id='ma_id' name='ma_id' size='10' value='zz' />";
	console.log($("#ma_id").value);

	// 품목명
	var ma_name = objRow.insertCell();
	ma_name.innerHTML = "<input type='text' id='ma_name' name='ma_name' size='10' value='' />";
	
	// 단가
	var unit_cost = objRow.insertCell();
	unit_cost.innerHTML = "<input type='text' id='unit_cost' name='unit_cost' size='10' value='' />";
	
	// 창고번호
	var whs_num = objRow.insertCell();
	whs_num.innerHTML = "<input type='text' id='whs_num' name='whs_num' size='10' value='' />";	
	
	// 선반위치
	var shelt_position = objRow.insertCell();
	shelt_position.innerHTML = "<input type='text' id='shelt_position' name='shelt_position' size='10' value='' />";	
	
	// 이미지
	var ma_image = objRow.insertCell();
	ma_image.innerHTML = "<input type='text' id='ma_image' name='ma_image' size='10' value='' />";	
	
	// 최근수정날짜
	var ma_regdate = objRow.insertCell();
	ma_regdate.innerHTML = "<input type='text' id='ma_regdate' name='ma_regdate' size='20' value='현재 시간이 입력됩니다.' readonly/>";
    
}


</script>

</head>
<body>


<h1>material_list.jsp</h1>
<h2>http://localhost:8088/purchasing/material/list</h2>


<!-- materialList 객체 저장-->
<c:set var="materialList" value="${materialList }" />



<!-- 자재 검색 기능 -->
<!-- 자재 검색 기능 -->



<!-- 추가, 수정, 저장, 삭제 버튼 -->
<input type="button" id="addBtn" name="addBtn" value="추가" onclick="rowAdd()">
<!-- <input type="button" value="수정" onclick="location.href='/purchasing/material/modify';"> -->
<!-- <input type="button" value="삭제" onclick="location.href='/purchasing/material/remove';"> -->
<form action="/purchasing/material/save" name="fm">
	<input type="hidden" name="hidden" value="">
	<input type="submit" value="저장">
</form>
<!-- 추가, 수정, 저장, 삭제 버튼 -->



<table border="1">
	<tr>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단가(원)</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>이미지</th>
		<th>최근 수정 날짜</th>
	</tr>
	
<tbody id="tblShow"></tbody>

<c:forEach var="ml" items="${materialList }">
	<tr>
		<td>${ml.ma_id }</td>
		<td>${ml.ma_name }</td>
		<td>${ml.unit_cost }</td>
		<td>${ml.whs_num }</td>
		<td>${ml.shelt_position }</td>
		<td>${ml.ma_image }</td>
		<td>${ml.ma_regdate }</td>
	</tr>
</c:forEach>
</table>



</body>
</html>