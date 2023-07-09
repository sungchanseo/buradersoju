<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11%22%3E"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<title>검수 등록</title>
<style type="text/css">
table {margin-bottom: 1em;
/* text-align: center; */
}

table, th {border: none;}

th {background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {border:1px solid #04AA6D;
	padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;}

.btn{
/* 	display: inline-block; */
	font-weight: 600;
	line-height: 1;
	color: #6C7293;
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
	
.btn-success:disabled {
	opacity: 0.6;
  	cursor: not-allowed;
}

.btn-info {
	color: #000;
	background-color: #2fddf8;
	border-color: #23dbf8;}
	
.btn_add{
	color: #ffffff;
	background-color: #04AA6D;
	border-color: #0ddbb9;}
	
.container {
	position: relative;}

/* .btn_btn { */
/* 	position: absolute; */
/* 	top: 0; */
/* 	right: 0;} */
	
.btn-light {
  color: #000;
  background-color: #d8d8d8;
  border-color: #d8d8d8;
}

.btn_table table {
	width: 100%;}
/* 테이블 css */

.def_codeList {
text-align: left;
}

</style>
</head>
<body>

 
		
		
	<h1 style="display: flex; justify-content: center;">검수 등록</h1>
	
	<div style="display: flex; justify-content: center;">
	<form>
	 <table id="insertTable" border="1" style="text-align: center;">
<!-- 	<table> -->
    <thead>
	<tr>
        <th>작업지시번호</th>
        <td>
        <input type="text" name="production_id" id="production_id" style="border:none; width:120px; cursor: pointer; text-align: center;" placeholder="작업지시번호선택">
<!--         <input type="text" id="production_id" name="production_id" > -->
<!--         <input id="btn_Search"  type="button" onclick="workSearch();" value="조회"></td> -->
 		<th>검수자</th>
			 <td>
			 <input type="hidden" id="qc_emp" name="qc_emp" value="${sessionScope.emp_id}">
			 ${sessionScope.emp_name}</td> 
        </tr>
        <tr>
    <tr>
<!--         <th>작업지시번호</th> -->
        <th>생산라인</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>생산량</th>
    </tr>
    </thead>
    <tbody> <!-- 검색 결과 추가되는 공간 -->
    	
	</tbody>
	</table>
	 </form>
	</div>	
	<div style="display: flex; justify-content: center;">
		 <table id="defInsert" class="center-align">
<!-- 		 <table id="defInsert" class="center-align" style="margin-left: 10px;"> -->
				 <tr>
				 <th>불량</th>
				 <td>
					<select class="def_codeList" id="def_code1" name="def_code1">
<!-- 						<option value="DE100">DE100</option> -->
						<option value="DE210">DE210</option>
						<option value="DE220">DE220</option>
						<option value="DE230">기타</option>
					</select> 
				 </td>
				 <td> <input type="text" class="def_qtyList" id="def_qty1" name="def_qty1" pattern="[0-9]*">
				 <input type="button" id="plusBT1" value="추가"></td>
				 </tr>
		</table>
	</div>
	<div style="display: flex; justify-content: center;" >
	<button type="button" id="insertBT" class="btn btn-success" style="margin: 0.8px;">등록</button>
	<button type="button" class="btn btn-light" onclick="window.close();"style="margin: 0.8px;" >취소</button>
	</div>
		
		
<script>
 	////// 작업지시번호로 정보 조회(페이지 이동x) //////
    $(document).ready(function(){
    	
    	//작업지시번호 검색 및 자동완성 기능 
		$("#production_id").click(function(){
//			function prodPop(){
			var prodPop = window.open('/quality/prodFind', '작업지시검색', 'width=700px,height=500px,left=2000 ');
			
			if(prodPop == null){
				  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
			  }
			prodPop.onbeforeunload = workSearch;
		}); //("#production_id").click
    	
//       $("#btn_Search").click(function() {
		function workSearch(){
		console.log("호출완료");
    	  var production_id = $("#production_id").val();
    	  console.log("production_id : "+production_id);
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
                "<td>"+
                "<input type='hidden' id='production_id' name='production_id' value='"+vo.production_id+"'>" 
//                 + vo.production_id + "</td>" +
//                 "<td>" 
                + vo.production_line + "</td>" +
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
		} // workSearch()
// 	  }); //(document).ready
      }); // $("#btn_Search").click
	//////작업지시번호로 정보 조회(페이지 이동x) //////
	
   	////// 불량 코드/개수 입력 행 추가 //////
   	$(document).ready(function(){
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
	    }); //("#plusBT1").click
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
				var product_qty = 0;
				var be_qty = $("#production_qty").val();
				var total_defQty = 0; // 생산의 총 불량수
				
				for(i = 0; i<def_qtyList.length; i++){
					be_qty -= parseInt(def_qtyList[i]);
					total_defQty += parseInt(def_qtyList[i]);
				}
				// 불량 개수가 모두 빠진 총 생산량
				product_qty = be_qty;
				
		  		// form 동적 생성
				var $form = $("<form>", {
				    action: "",
				    role: "form",
				    id: "fr",
				    method: "POST"
				  });
		  		
				 $("<input>", {
				    type: "hidden",
				    name: "total_defQty",
				    value: total_defQty
				  }).appendTo($form);
				 
			      $("<input>", {
				    type: "hidden",
				    name: "product_id",
				    value: $("#product_id").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "product_qty",
				    value: product_qty
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
				    value: $("#production_qty").val()
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
				  
		}); //click; 
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

</body>
</html>