<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
// + ajax에서 막힘,, 값은 잘 나옴,,
// + ajax를 컨트롤러로 보내서 그다음에 뷰페이지에 보내보기
// + 날짜 이상하게 나옴
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ오늘 날짜 출력 메서드ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function getToday() {
		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
      
		return year + "-" + month + "-" + day;
	}


// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡjQuery 시작ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
$(function() {
	
	// 1. 자재 정보 '추가'
	$('.writeForm').click(function() {
    	  
		// 1-1. 날짜 정보 저장
		let regdate = getToday();
		console.log(regdate);
        
		// 1-2. 행 추가
		if($(this).hasClass('true')) {
			let tbl = "<tr>";
			tbl += " <td>";
			tbl += " </td>";
			tbl += " <td>";
			tbl += "  <input type='text' name='ma_id' id='ma_id'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += "  <input type='text' name='ma_name' id='ma_name'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += "  <input type='text' name='unit_cost' id='unit_cost'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += "  <input type='text' name='whs_num' id='whs_num'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += "  <input type='text' name='shelt_position' id='shelt_position'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += "  <input type='file' name='ma_image' id='ma_image'>";
	        tbl += " </td>";
	        tbl += " <td>";
	        tbl += regdate;
	        tbl += " </td>";
	        tbl += "</tr>";
            
			$('table').append(tbl);
            
			$(this).removeClass('writeForm').addClass('write');
			$(this).removeClass('true');
			$(this).text("등록");
		}
         
         
		// 1-3. 입력한 데이터 저장 (등록)
		$('.write').click(function() {
          
			let ma_id = $('#ma_id').val();
			let ma_name = $('#ma_name').val();
			console.log(ma_id);
			console.log(ma_name);
            
			if(ma_id==="" || ma_name==="") {
				alert("품목코드와 품목명을 입력하세요");
			} else {
               
				$.ajax({
					url: "/ajax",
					type: "post",
					data: {ma_id:ma_id, ma_name:ma_name},
					success: function() {
						alert("등록 완료");
						location.reload();
					},
					error: function() {
						alert("error");
					}
				}); //ajax
			
			} //if-else
            
		}); //write.click
      
	}); //writeForm.click
      
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡjQuery 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
</script>

</head>
<body>
   <h1>Material_List</h1>
   <h2>http://localhost:8088/purchasing/material/list</h2>
   
	<button class="writeForm true">행추가</button>
	<input type="button" value="등록" onclick="location.href='/purchasing/material/insert';">
   
	<table border="1">
	<tr>
		<th></th>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단가(원)</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>이미지</th>
		<th>최근 수정 날짜</th>
		<th></th>
	</tr>
      
      <c:forEach var="ml" items="${materialList }">
         <tr>
         	<td><input type="checkbox" name="checked"></td>
			<td>${ml.ma_id }</td>
			<td>${ml.ma_name }</td>
			<td>${ml.unit_cost }</td>
			<td>${ml.whs_num }</td>
			<td>${ml.shelt_position }</td>
			<td>${ml.ma_image }</td>
			<td>${ml.ma_regdate }</td>
			<td>
				<input type="button" value="수정" onclick="location.href='/purchasing/material/modify?ma_id=${ml.ma_id}';">
				<input type="button" value="삭제" onclick="location.href='/purchasing/material/delete?ma_id=${ml.ma_id}';">
			</td>
         </tr>
      </c:forEach>
   </table>
   

</body>
</html>