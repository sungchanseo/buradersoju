<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>검수 등록</title>
</head>
<body>
	<!-- 작업지시번호로 정보 조회(페이지 이동x) -->
  <script>
    $(document).ready(function() {
      $("#btn_Search").click(function() {
    	  var production_id = $("#production_id").val();
    	  
        $.ajax({
          url : 'qualityInsertSearch.do',
          type : 'POST',
          data : { production_id: production_id },
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          dataType: 'json',
          success: function(response) {
        	  console.log(response);
              var vo = response.vo;
              
              $("#insertTable tbody").html(
                "<tr>" +
                "<td><input type='hidden' name='production_id' value='"+vo.production_id+"'>" 
                + vo.production_id + "</td>" +
                "<td>" + vo.production_line + "</td>" +
                "<td>" + vo.product_id + "</td>" +
                "<td>" + vo.product_name + "</td>" +
                "<td>" + vo.plan_qty + "</td>" +
                "</tr>"
              );
          
          },
          error : function(error) {
          console.log(error);
          }
        });
      });
    });
  </script>
	<h1>검수 등록</h1>
	
	<form id="btn_Search" method="get">
        <label for="production_id">작업지시번호</label>
        <input type="text" id="production_id" name="production_id" value="">
        <input type="button" value="조회">
    </form>
    <%
        // 작업지시번호 저장
        String production_id = request.getParameter("production_id");
     %>
   	<hr>
   	<form id="inputInsert" action="/quality/qcid"  method="get">
	    <table id="insertTable" border="1">
    <thead>
    <tr>
        <th>작업지시번호</th>
        <th>생산라인</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>생산량</th>
    </tr>
    </thead>
    <tbody> <!-- 검색 결과 추가되는 공간 -->
    	
	</tbody>
	</table>
	  <br>
	
		<table>
				<tr>
<!-- 				 <td>검수번호</td> 임시로 추가 -->
<!-- 				 <td><input type="text" id="qc_num" name="qc_num"><td>  -->
				 </tr>
				 <tr>
				 <td>검수자</td>
				 <td><input type="text" id="qc_emp" name="qc_emp"><td> 
				 </tr>
				 <tr>
				 <td>검수량</td>
				 <td> <input type="text" id="qc_qty" name="qc_qty"><td> 
				 </tr>
		 </table>
		 <table id="defInsert">
				 <tr>
				 <td>불량</td>
				 <td>
					<select class="def_select1" id="def_code1" name="def_code1">
<!-- 						<option value="DE100">DE100</option> -->
						<option value="DE210">DE210</option>
						<option value="DE220">DE220</option>
						<option value="DE230">기타</option>
					</select> </td>
				 <td> <input type="text" id="def_qty1" name="def_qty1" pattern="[0-9]*"></td> <!-- 입력 제한 넣기 (패턴이 안됨..) -->
				 <td> <input type="button" id="plusBT1" value="추가"></td>
				 </tr>
		</table>
<!-- 		<input type="submit" > -->
		<button type="submit" id="submitBT" >등록</button>
		
		<!-- 불량 값 컬럼 하나에 담기 -->
		<script>
		  $(document).ready(function() {
			// 불량 값 정리 함수 생성
			  function setDef(){
					var def_code;
					var def_qty;
					
					var def_code1 = $("#def_code1").val();
					var def_code2 = "";
					def_code2 = $("#def_code2").val();
					var def_code3 = "";
					def_code3 =	$("#def_code3").val();
					
					var def_qty1 = Number($("#def_qty1").val());
					var def_qty2 = "";
					def_qty2 = Number($("#def_qty2").val());
					var def_qty3 = "";
					def_qty3 = Number($("#def_qty3").val());
					
					if(def_code3 != null){
						def_code = def_code1+"/"+def_code2+"/"+def_code3;
						def_qty = (def_qty1+def_qty2+def_qty3);
					}else if(def_code2 != null){
						def_code = def_code1+"/"+def_code2;
						def_qty = (def_qty1+def_qty2);
					}else{
						def_code = def_code1;
						def_qty = def_qty1;
					}
// 					alert(def_code+"/"+def_qty);
					 $("#defInsert").html(
					 "<input type='hidden' name='def_code' value='"+def_code+"'>"+
					 "<input type='hidden' name='def_qty' value='"+def_qty+"'>"
					 );
					}
			  
			  // 버튼 눌렀을때 함수 호출 & 전송 & 팝업창 닫기 & 부모창 새로고침
		      $("#submitBT").click(function() {
		    	  setDef();
		    	  $("#inputInsert").submit();
		    	  
// 		          setTimeout(function() {   
// 		       	  opener.parent.location.reload();
// 		    	  window.close(); // 팝업 창 닫기
// 		          }, 200);
		      });
		 });
		</script>
	</form>

	  <!-- 불량 입력창 추가 -->
	  <script>
	  $(document).ready(function() {
		    var maxRows = 3; // 최대 행 수
		    var currentRows = 1; // 현재 행 수
		    $("#plusBT1").click(function() {
		    	if(currentRows < maxRows) {
		            var newRow = "<tr>" +
		                         "<td>불량</td>" +
		                         "<td>" +
		                         "<select class='def_select' id='def_code"+ (1+currentRows) +"' name='def_code" + (1+currentRows) + "'>" +
// 		                         "<option value='DE100'>DE100</option>" + // 생산시 불량등록 코드라 일단 제외
		                         "<option value='DE210'>DE210</option>" +
		                         "<option value='DE220'>DE220</option>" +
		                         "<option value='DE230'>기타</option>" +
		                         "</select>" +
		                         "</td>" +
		                         "<td><input type='text' id='def_qty"+ (1+currentRows) +"' name='def_qty" + (1+currentRows) +"'></td>" +
		                         "</tr>";
	
		            $("#defInsert").append(newRow);
		            currentRows++;
		          }
		    });
		  });
	  </script>

</body>
</html>