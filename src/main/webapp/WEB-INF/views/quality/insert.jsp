<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>검수 등록</title>
<style type="text/css">
table {margin-bottom: 1em;}

table, th {border: none;}

th {background-color: #04AA6D;
color: #fff;
text-align: center;
padding: 10px 8px;}

td {border:1px solid #04AA6D;
padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;}

.btn{
display: inline-block;
font-weight: 600;
line-height: 1;
color: #6c7293;
text-align: center;
text-decoration: none;
vertical-align: middle;
cursor: pointer;
user-select: none;
background-color: transparent;
border: 1px solid transparent;
padding: 0.625rem 1.125rem;
font-size: 0.875rem;
border-radius: 0.25rem;
transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
    
.btn-success {
color: #000;
background-color: #0ddbb9;
border-color: #0ddbb9;}

.btn-info {
color: #000;
background-color: #2fddf8;
border-color: #23dbf8;}
/* .btn {background-color: #048; */
/* padding:8px 10px; */
/* color: #fff;} */


/* #plusBT1 { */
/*     width: 10px; */
/*     height: 10px; */
/*     text-align: left; /* 가운데 정렬 */ */
/*     font-size: 10px;  */
/* /*     line-height: 75px; /* 세로 가운데 정렬 */ */ */
/*   } */

</style>
</head>
<body>

 <script>
 	////// 작업지시번호로 정보 조회(페이지 이동x) //////
    $(document).ready(function(){
      $("#btn_Search").click(function() {
    	  var production_id = $("#production_id").val();
    	  
        $.ajax({
          url : 'qualityInsertSearch',
          type : 'GET',
          data : { production_id: production_id },
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          dataType: 'json',
          success: function(response) {
        	  console.log(response);
              var vo = response.vo;
              $("#insertTable tbody").html(
                "<tr>" +
                "<td><input type='hidden' id='production_id' name='production_id' value='"+vo.production_id+"'>" 
                + vo.production_id + "</td>" +
                "<td>" + vo.production_line + "</td>" +
                "<td><input type='hidden' id='product_id' name='product_id' value='"+vo.product_id+"'>"
                + vo.product_id + "</td>" +
                "<td>" + vo.product_name + "</td>" +
                "<td><input type='hidden' class='def_codeList' id='stage1_defCode' name='stage1_defCode' value='"+vo.stage1_defCode+"'>"
                +"<input type='hidden' class='def_codeList' id='stage2_defCode' name='stage2_defCode' value='"+vo.stage2_defCode+"'>"
                +"<input type='hidden' class='def_codeList' id='stage3_defCode' name='stage3_defCode' value='"+vo.stage3_defCode+"'>"
                +"<input type='hidden' class='def_qtyList' id='stage1_defQty' name='stage1_defQty' value='"+vo.stage1_defQty+"'>"
                +"<input type='hidden' class='def_qtyList' id='stage2_defQty' name='stage2_defQty' value='"+vo.stage2_defQty+"'>"
                +"<input type='hidden' class='def_qtyList' id='stage3_defQty' name='stage3_defQty' value='"+vo.stage3_defQty+"'>"
                +"<input type='hidden' id='production_qty' name='production_qty' value='"+vo.production_qty+"'>"
                + vo.production_qty + "</td>" +
                "</tr>"
              );
          
          },
          error : function(error) {
          console.log(error);
          }
        }); //ajax
      }); // $("#btn_Search").click
	//////작업지시번호로 정보 조회(페이지 이동x) //////
	
   	////// 불량 코드/개수 입력 행 추가 //////
	    var maxRows = 3; // 최대 행 수
	    var currentRows = 1; // 현재 행 수
	    $("#plusBT1").click(function() {
	    	if(currentRows < maxRows) {
	            var newRow = "<tr>" +
	                         "<th>불량</th>" +
	                         "<td>" +
	                         "<select class='def_codeList' id='def_code"+ (1+currentRows) +"' name='def_code" + (1+currentRows) + "'>" +
// 	                         "<option value='DE100'>DE100</option>" + // 생산시 불량등록 코드라 일단 제외
	                         "<option value='DE210'>DE210</option>" +
	                         "<option value='DE220'>DE220</option>" +
	                         "<option value='DE230'>기타</option>" +
	                         "</select>" +
	                         "</td>" +
	                         "<td><input type='text' class='def_qtyList' id='def_qty"+ (1+currentRows) +"' name='def_qty" + (1+currentRows) +"'></td>" +
	                         "</tr>";

	            $("#defInsert").append(newRow);
	            currentRows++;
	          } // if
	    }); //$("#plusBT1").click
	  }); //(document).ready
	  ////// 불량 입력 행 추가 //////
		  
		 ////// 불량 검수 등록+각 불량 코드에 대한 불량 개수 DB등록+불량 개수를 뺀 생산량 DB등록//////
	$(document).ready(function(){
		$("#insertBT").click(function(){
				var def_codeList = [];
				var def_qtyList = [];
				$(".def_codeList").each(function() {
					  def_codeList.push($(this).val());
				});
				$(".def_qtyList").each(function() {
					def_qtyList.push($(this).val());
				});
				console.log(def_codeList);
				console.log(def_qtyList);
				var production_qty = 0;
				var be_qty = $("#production_qty").val();
				for(i = 0; i<def_qtyList.length; i++){
					be_qty -= def_qtyList[i];
				}
				// 불량 개수가 모두 빠진 총 생산량
				production_qty = be_qty;
				
		  		// form 동적 생성
				var $form = $("<form>", {
				    action: "",
				    role: "form",
				    id: "fr",
				    method: "POST"
				  });
				  
			      $("<input>", {
				    type: "hidden",
				    name: "product_id",
				    value: $("#product_id").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "production_qty",
				    value: production_qty
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "production_id",
				    value: $("#production_id").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "qc_emp",
				    value: $("#qc_emp").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "qc_qty",
				    value: $("#qc_qty").val()
				  }).appendTo($form);

				  $("<input>", {
				    type: "hidden",
				    name: "def_codeList",
				    value: def_codeList.join(",")
				  }).appendTo($form);

				  $("<input>", {
				    type: "hidden",
				    name: "def_qtyList",
				    value: def_qtyList.join(",")
				  }).appendTo($form);
				  
				  $('body').append($form);
				  
				  sendForm();
				  
		}); //click}); 
		function sendForm() {
			var formObject = $("form[role='form']").serialize();
	
			$.ajax({
				url: 'defInsert',
				type: 'POST',
				data: formObject,
				success: function(json) {
					alert("등록이 완료되었습니다.");
					window.opener.location.reload();
					window.close();
				}
			});
		} //function
	////// 불량 검수 등록+각 불량 코드에 대한 불량 개수 DB등록+불량 개수를 뺀 생산량 DB등록//////
	 });  // document.ready
	</script>
		
		
	<h1>검수 등록</h1>
	
	<form>
	<table>
	<tr>
        <th><label for="production_id">작업지시번호</label></th>
        <td><input type="text" id="production_id" name="production_id" >
        <input id="btn_Search"  type="button" value="조회"></td>
        </tr>
        </table>
    </form>
  
   	<hr>
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
				 <th>검수자</th>
				 <td>
				 <input type="text" id="qc_emp" name="qc_emp">
				 </td> 
				 </tr>
				 <tr>
				 <th>검수량</th>
				 <td>
				 <input type="text" id="qc_qty" name="qc_qty">
				 </td> 
				 </tr>
		 </table>
		 <table id="defInsert">
				 <tr>
				 <th>불량</th>
				 <td>
					<select class="def_codeList" id="def_code1" name="def_code1">
<!-- 						<option value="DE100">DE100</option> -->
						<option value="DE210">DE210</option>
						<option value="DE220">DE220</option>
						<option value="DE230">기타</option>
					</select> </td>
				 <td> <input type="text" class="def_qtyList" id="def_qty1" name="def_qty1" pattern="[0-9]*">
				 <input type="button" id="plusBT1" value="추가"></td>
				 </tr>
		</table>
		<button type="button" id="insertBT" class="btn btn-success" >등록</button>
		


</body>
</html>