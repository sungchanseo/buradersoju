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
	        tbl += "<input type='text' name='whs_id' id='whs_id'>";
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
			
			
			// 1-2. '저장' 클릭 
			// 입력한 데이터 컨트롤러 전달 (저장) -> 리스트 이동
			$('.insert').click(function(){
				// ma_id 정보 및 입력된 정보 저장
				var nextNumber = addNumber();
				var ma_id = "MA" + nextNumber;
				var whs_id = $('#whs_id').val();
				var ma_name = $('#ma_name').val();
				var unit = $('#unit').val();
				var ma_qty = $('#ma_qty').val();
				var unit_cost = $('#unit_cost').val();
				var shelt_position = $('#shelt_position').val();
				var ma_regdate = $('#ma_regdate').val();
				var ma_emp = $('#ma_emp').val();
				
				if(whs_id==="" | ma_name==="" || unit==="" || ma_qty==="" || unit_cost==="" || shelt_position==="" || ma_emp==="") {
					alert("모든 정보를 입력해주세요.");
				} else {
			             
					$.ajax({
						url: "maid",
						type: "get",
						data: { whs_id:whs_id,
					            ma_id:ma_id,
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
	$("#modify").click(function(){ 
		
		if($('input:checkbox[name="check"]:checked').length > 1){
			alert("하나의 항목만 수정이 가능합니다.");
			location.reload();
		}
			
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져옴
		checkbox.each(function(i) {

			// checkbox.parent()          : checkbox의 부모는 <td>
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			var ma_id = td.eq(1).text();
			tdArr.push(ma_id);	// tdArr[0]

		}); // function(i)
		
	
		// 2-2. '저장' 클릭 
		// 체크된 데이터 컨트롤러 전달
		var ma_id = tdArr[0];
		
		$.ajax({
			url: "modify",
			type: "get",
			data: { ma_id:ma_id },
			success: function() {
				location.href="/purchasing/material/modify?ma_id=" + ma_id;
// 				location.href="/purchasing/material/list?ma_id=" + ma_id;
			},
			error: function() {
				alert("수정할 항목을 선택해주세요.");
			}
		}); //ajax		

	}); // modify.click
	
	
	
	// 3. '삭제' 클릭
	$('#delete').click(function(){ 
			
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져옴
		checkbox.each(function(i) {

			// checkbox.parent()          : checkbox의 부모는 <td>
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			var ma_id = td.eq(1).text();
			tdArr.push(ma_id);	// tdArr[0]

		}); // function(i)
		
	
		// 2-2. 체크된 데이터 컨트롤러 전달
		var ma_id = tdArr[0];
		
		$.ajax({
			url: "delete",
			type: "post",
			data: { ma_id:ma_id },
			success: function() {
				var result = confirm("품목코드 " + ma_id + "를 정말 삭제하시겠습니까?");
				if(result){
					alert("삭제가 완료되었습니다.");
					location.href="/purchasing/material/list";
				}
			},
			error: function() {
				alert("error");
			}
		}); //ajax		

	}); // deleteForm.click
	
	
	
	// '검색' 기능
	function getSearchList(){
		$.ajax({
			type: "get",
			url : "/getSearchList",
			data : $("form[name=search-form]").serialize(),
			success : function(result){
				
				//테이블 초기화
				$('.tbl > tbody').empty();
				if(result.length>=1){
					result.forEach(function(item){
						str = "<tr>";
						str += "<td>"+ item.ma_id +"</td>";
						str += "<td>"+ item.ma_name +"</td>";
						str += "<td>"+ item.unit +"</td>";
						str += "<td>"+ item.ma_qty +"</td>";
						str += "<td>"+ item.utni_cost +"</td>";
						str += "<td>"+ item.whs_id +"</td>";
						str += "<td>"+ item.shelt_position +"</td>";
						str += "<td>"+ item.ma_regdate +"</td>";
						str += "<td>"+ item.ma_emp +"</td>";
						str += "</tr>"
						$('.tbl').append(str);
	        		}) // function(item)	
	        		
				} // if
				
			}, // seccess
			error: function(){
				alert("error");
			}
		}) // ajax
		
	} // getSearchList()
	
	
	
	
	

}); // jQuery
</script>
</head>
<body>
   <h1>Material_List</h1>
   <h2>http://localhost:8088/purchasing/material/list</h2>
   
   
	<!-- 검색 -->
	<div>
		<form name="search-form" autocomplete="off">
			<select name="type">
				<option value="ma_id">품목코드</option>
				<option value="ma_name">품명</option>
			</select>
			<input type="text" name="keyword" value="">	
			<input type="button" class="btn btn-outline-primary mr-2" onclick="getSearchList();" value="검색">
		</form>
		
		<!-- 버튼 -->
		<button class="insertForm true" >등록</button>
		<button class="btn btn-outline btn-primary pull-right" id="modify">수정</button>
		<button class="btn btn-outline btn-primary pull-right" id="delete">삭제</button>
		<button class="insert update delete">저장</button>
	</div>
   
   
	<!-- 테이블 -->
	<div class="row">
   	<fmt:formatDate value=""/> 	
	<table border="1" id="example-table-3" class="table table-bordered table-hover text-center tbl">
	 <tbody>
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
			<td>
				<c:choose>
					<c:when test="${ml.ma_qty < 100 }">
						<span style="color:red">${ml.ma_qty }</span>
					</c:when>
					<c:otherwise>${ml.ma_qty }</c:otherwise>
				</c:choose>
			</td>			
			<td>${ml.unit_cost }</td>
         	<td>${ml.whs_id }</td>
			<td>${ml.shelt_position }</td>
			<td><fmt:formatDate value="${ml.ma_regdate}" pattern="yyyy-MM-dd"/></td>
			<td>${ml.ma_emp }</td>
         </tr>
      </c:forEach>
     </tbody>
   </table>
   </div>
   
</body>
</html>