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

// 오늘 날짜 출력 (yy-MM-dd)
function getToday() {
	var date = new Date();
	
	var year = date.getFullYear();
	var year = String(year);
	var yy = year.substring(2,4);
	var mon = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
  
	var today = yy + mon + day;
	return today;
}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ JQuary ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
$(document).ready(function(){
	
	// '입고처리' 버튼 클릭
	$('.done').click(function(){
		
				
		// order_id 정보 저장          
        var str = ""
        var tdArr = new Array();
        var done = $(this);

        var tr = done.parent().parent();	// done의 부모는 <td>
        var td = tr.children();				// <td>의 부모이므로 <tr>
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
         
        var order_id = td.eq(1).text();
	    console.log("order_id ===== " + order_id);
        
	    

		// 숫자 3자리로 맞추기
		// 숫자가 1씩 증가해야하며, 오늘 날짜가 지나면 다시 0으로 초기화해야 함
		var imNum = 1; 
		var format_imNum = String(imNum).padStart(3, "0");
		
		// 입고번호 생성
		var in_id = "IM" + getToday() + format_imNum;
		alert(in_id + ", 입고처리가 완료되었습니다.");
        
		// order_id에 해당하는 생성된 입고번호 컨트롤러 전달
		$.ajax({
			url: "list",
			type: 'post',
			data: {
				in_id:in_id,
				order_id:order_id
			},
			success: function(data){
				location.reload();
			},
			error: function(){
				alert("error");	
			}
		}); // ajax
				
	}); // done.click
	
	
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ JQuary ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


</script>
</head>
<body>


<h1>In_Material_List.jsp</h1>
<h2>http://localhost:8088/purchasing/inMaterial/list</h2>

   
	<table border="1">
	<tr>
		<th>입고번호</th>
		<th>발주번호</th>
		<th>품명</th>
		<th>입고수량</th>
		<th>입고일</th>
		<th>진행현황</th>
		<th>입고담당직원</th>
		<th>입고처리</th>
	</tr>
      
      <c:forEach var="iml" items="${inMaterialList }">
         <tr>
			<td>${iml.in_id }</td>
			<td>${iml.order_id }</td>
			<td>${iml.in_maName }</td>
			<td>${iml.in_qty }</td>
			<td>${iml.in_date }</td>
			<td>${iml.in_progress }</td>
			<td>
				<c:choose>
					<c:when test="${iml.in_emp == 0}">　</c:when>
					<c:otherwise>${iml.in_emp }</c:otherwise>
				</c:choose>
			</td>
			<td>		
				<c:if test="${empty iml.in_id }">
					<input type="button" class="done click" value="입고처리">
				</c:if>
			</td>
         </tr>
      </c:forEach>
	</table>




</body>
</html>