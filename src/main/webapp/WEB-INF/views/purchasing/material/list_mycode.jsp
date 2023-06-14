<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ오늘 날짜 출력 메서드ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
     
	return year + "-" + month + "-" + day;
}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡjQuery 시작ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
$(function(){
	
	// 1. 자재 '추가'
	$('.addRow').click(function(){
		
		// 1-1. 오늘 날짜 저장
		let regdate = getToday();
		console.log("regdate" + regdate);
		
		// 1-2. 행 추가
		if($(this).hasClass('true')){
			let tbl = "<tr>";
			tbl += "<td>";
			tbl += "<input type='text' name='ma_id' id='ma_id'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += "<input type='text' name='ma_name' id='ma_name'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += "<input type='text' name='unit_cost' id='unit_cost'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += "<input type='text' name='whs_num' id='whs_num'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += "<input type='text' name='shelt_num' id='shelt_num'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += "<input type='file' name='ma_image' id='ma_image'>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += regdate;
			tbl += "</td>";
			tbl += "</tr>";
			
			$('table').append(tbl);
			
			$(this).removeClass('addRow').addClass('register');
			$(this).removeClass('true');
			$(this).text("등록");
		}
		
		// 1-3. 입력한 데이터 저장 (등록)
		$('.register').click(function(){
			let ma_id = $('#ma_id').val();
			let ma_name = $('#ma_name').val();
			let unit_cost = $('#unit_cost').val();
			let whs_num = $('#whs_num').val();
			let shelt_num = $('#shelt_num').val();
			let ma_image = $('#ma_image').val();
			
			consol.log("ma_id" + ma_id);
			consol.log("unit_cost" + unit_cost);
			consol.log("ma_image" + ma_image);
			
			if(ma_id === "" || ma_name === ""){
				alert("품목코드와 품목명을 입력해주세요.");
			}else{
				$.ajax({
					url: "/Alcoholic/purchasing/material/save.jsp",
					type: "post",
					data: {ma_id:ma_id, ma_name:ma_name},
					success: function(){
						alert("자재 추가 완료!");
						location.reload();
					},
					error: function() {
						alert("error");
					}
				}); // ajax
				
			} // if-else
				
		}); // register.click
		
	}); // addRow.click
	
});
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡjQuery 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

</script>

</head>
<body>
   <h1>Material_List</h1>
   <button class="addRow true">추가</button>	<!-- .register 등록 기능 포함 -->
	
   
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