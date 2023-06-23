<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
// 품목코드 자동생성 & 행추가에 넣은 값들을 컨트롤러에 전달해서 DB에 데이터처리하여 저장하기	
// 오늘 날짜 출력
function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
     
	return year + "-" + month + "-" + day;
}
	
	
// DB에 있는 품목코드 최대값 + 1
function addNumber(){	
	// maxNumber가 없을 때 (품목코드 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = "000";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber);
	}else{	// 있을 때
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	// 다음 번호 생성
	var nextNumber = String(Number(maxNumber) + 1).padStart(3,'0');
	console.log("************ 포매팅 nextNumber =  " + nextNumber);	
	return nextNumber;
}



$(document).ready(function() {
	// 1-1. '등록' 클릭
	$('.insertForm').click(function() {
    	  
		// 날짜 정보 저장
		let regdate = getToday();
		
		// ma_id 정보 저장
		var nextNumber = addNumber();
		var ma_id = "MA" + nextNumber;
		console.log("************ 품목코드 = " + ma_id);
		
		// 행 추가
		if($(this).hasClass('true')) {
			let tbl = "<tr>";
			tbl += "<td>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += ma_id; 	// 자동넘버링
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
			
			
			// 1-2. 입력한 데이터 컨트롤러 전달 (저장) -> 리스트 이동
			$('.insert').click(function(){
				// ma_id 정보 저장
				var nextNumber = addNumber();
				var ma_id = "MA" + nextNumber;
				var ma_name = $('#ma_name').val();
				var unit = $('#unit').val();
				var ma_qty = $('#ma_qty').val();
				var unit_cost = $('#unit_cost').val();
				var shelt_position = $('#shelt_position').val();
				var ma_regdate = $('#ma_regdate').val();
				var ma_emp = $('#ma_emp').val();
				
				if(ma_name==="" || unit==="" || ma_qty==="" || unit_cost==="" || shelt_position==="" || ma_emp==="") {
					alert("모든 정보를 입력해주세요.");
				} else {
			             
					$.ajax({
						url: "maid",
						type: "get",
						data: { ma_id:ma_id,
							    ma_name:ma_name,
							    unit:unit,
							    ma_qty:ma_qty,
							    unit_cost:unit_cost,
							    shelt_position:shelt_position,
							    ma_regdate:ma_regdate,
							    ma_emp:ma_emp },
						success: function() {
							alert("품목코드 " + ma_id + ", 등록 완료되었습니다.");
							location.href="/purchasing/material/list";
						},
						error: function() {
							alert("error");
						}
					}); //ajax
				
				} // if-else
						
			}); // regist.click
			
		} // 행추가 if
		
	}); // insertForm.click
	
	
	
	// 2-1. '수정' 클릭
	$('').click(function(){
		
	});
	
	
	
	// 2-2. 입력한 데이터 컨트롤러 전달 (수정) -> 리스트 이동
	
	
	
	
	
	
	

}); // jQuery
</script>
</head>
<body>
   <h1>Material_List</h1>
   <h2>http://localhost:8088/purchasing/material/list</h2>
   
	<button class="insertForm true">등록</button>
	<button class="updateForm">수정</button>
	<button class="deleteForm">삭제</button>
	<button class="insert update delete">저장</button>


   	<fmt:formatDate value=""/>
	<table border="1">
	<tr>
		<th></th>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단위</th>
		<th>재고량</th>
		<th>단가(WON)</th>
		<th>선반위치</th>
		<th>최근 수정 날짜</th>
		<th>담당직원</th>
	</tr>
      
      <c:forEach var="ml" items="${materialList }">
         <tr>
         	<td><input type="checkbox" name="checked"></td>
			<td>${ml.ma_id }</td>
			<td>${ml.ma_name }</td>
			<td>${ml.unit }</td>
			<td>${ml.ma_qty }</td>
			<td>${ml.unit_cost }</td>
			<td>${ml.shelt_position }</td>
			<td><fmt:formatDate value="${ml.ma_regdate}" pattern="yyyy-MM-dd"/></td>
			<td>${ml.ma_emp }</td>
<%-- 		<input type="button" value="수정" onclick="location.href='/purchasing/material/modify?ma_id=${ml.ma_id}';"> --%>
<%-- 		<input type="button" value="삭제" onclick="location.href='/purchasing/material/delete?ma_id=${ml.ma_id}';"> --%>
         </tr>
      </c:forEach>
   </table>
   

</body>
</html>