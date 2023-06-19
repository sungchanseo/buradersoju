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

// 어제 날짜 출력 (yy-MM-dd)
function getYesterday(){
	var today = new Date();
	var date = new Date(today.setDate(today.getDate()-1));
	var year = date.getFullYear();
	var year = String(year);
	var yy = year.substring(2,4);
	var mon = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
	var yesterday = yy + mon + day;
	return yesterday;
}


// 숫자 1씩 증가 카운팅
function autoNumber(){
	var nextNumber = "${nextNumber}";
	console.log("%%%%%%%%% nextNumber " + nextNumber);
	return nextNumber;
}

// DB에 있는 최대 날짜값 가져오기
// function maxNumber(){
// 	var maxNumber = "${maxNumber}";
// 	console.log("%%%%%%%%% maxNumber " + maxNumber);
// 	return maxNumber;
// }

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ JQuery ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
$(document).ready(function(){
	
	// '입고처리' 버튼 클릭
	$('.done').click(function(){
		
		// order_id 정보 저장          
        var str = ""
        var tdArr = new Array();
        var done = $(this);
        var tr = done.parent().parent();	// done의 부모는 <td>
        var td = tr.children();				// <td>의 부모이므로 <tr>
        var order_id = td.eq(1).text();
        document.fo.order_id.value = order_id;
	    console.log("%%%%%%%%% order_id = " + order_id);
        
        // nextNumber 정보 저장
        // DB에 있는 날짜(maxNumber)가 오늘 날짜(today)와 같으면 카운팅하는 조건
        var nextNumber;
        var maxNumber = "${maxNumber }";
		var today = getToday();
		console.log("%%%%%%%%% maxNumber = " + maxNumber);
		
		

		// 230619001 끝에 3자리만 출력
// 		var nextNum = String(nextNumber).padStart(3, "0");
		var tmp = nextNumber.toString();	// 숫자를 문자열로 변환해서 자르고
		var nextNum = tmp.substr(6);	// 001 // 자른값을 다시 숫자로 변환
		console.log("%%%%%%%%% nextNum ==============" + nextNum);
		
		// 입고번호 조합 & 생성
		var in_id = "IM" + today + nextNum;
		document.fo.in_id.value = in_id;
		alert(in_id + ", 입고처리가 완료되었습니다.");
        
		// order_id, in_id 컨트롤러 전달
		var frObj = $("form[role='form']");
		frObj.attr("action", "/purchasing/inMaterial/list");
		frObj.attr("method", "post")
		frObj.submit();
				
	}); // done.click
	
	
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ JQuery ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

</script>
</head>
<body>


<h1>In_Material_List.jsp</h1>
<h2>http://localhost:8088/purchasing/inMaterial/list</h2>

<!-------- 수정/삭제 정보 전달용 -------->
		<form role="form" id="fr" name="fo">
			<input type="hidden" name="order_id" value="">
			<input type="hidden" name="in_id" value="">
		</form>
<!-------- 수정/삭제 정보 전달용 -------->
 
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
					<input type="button" class="done" value="입고처리">
				</c:if>
			</td>
         </tr>
      </c:forEach>
	</table>




</body>
</html>