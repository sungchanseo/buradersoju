<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<title>작업 지시 등록</title>
<style type="text/css">
table {margin-bottom: 1em;
	   text-align: center;
	   border-radius: 10px;
/*     border-collapse: collapse; */
    }

table, th {border: none;}

th {background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {border:1px solid #04AA6D;
	padding: 10px 6px;
/*  	color: #6C7293;  */
/* 	color: gray; */
	}

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


</style>
</head>
<body>
	<!-- 상품코드 조회/수주번호 조회/자재 재고 계산/작업지시 등록 -->
	<script>
		$(document).ready(function() {
		/////////// 상품 코드 선택시 정보 자동 조회 ///////////
			// db처리 해도 되겠지만... 시간이 없으니 시간날때 db로 변경예정
			$(".product_select").change(function(){
				var product_id = $(this).val();
				var product_name = "";
				var production_line = "";
				
				 if(product_id == "PR136"){
					 product_name = "병";
					 production_line = "1라인";
	                } else if(product_id == "PR216"){
	                	product_name = "팩160";
						production_line = "2라인";
	                } else if(product_id == "PR220"){
	                	product_name = "팩200";
						production_line = "2라인";
	                } else if(product_id == "PR320"){
	                	product_name = "페트200";
						production_line = "3라인";
	                } else if(product_id == "PR340"){
	                	product_name = "페트400";
						production_line = "3라인";
	                } else if(product_id == "PR350"){
	                	product_name = "페트500";
						production_line = "3라인";
	                } else if(product_id == "PR360"){
	                	product_name = "페트600";
						production_line = "3라인";
	                }
				 console.log("production_line"+production_line);
				 $("#woInsertTable tbody").html(
			                "<tr>" +
			                "<td><input type='hidden' id='product_id' name='product_id' value='"+product_id+"'>" 
			                + product_id + "</td>" +
			                "<td>" + product_name + "</td>" +
			                "<td><input type='hidden' id='production_line' name='production_line' value='"+production_line+"'>"
			                + production_line + "</td>" +
// 			                "<td>" + vo.product_name + "</td>" +
// 			                "<td>" + vo.plan_qty + "</td>" +
			                "</tr>"
			              );
				 $("#plan_qty").trigger("keyup"); // $("#plan_qty").keyup 이벤트 실행 => 자재 계산
			}); //change
		}); // $(document).ready
		/////////// 상품 코드 선택시 정보 자동 조회 ///////////
		/////////// 자재 재고 계산 ///////////
			$(document).ready(function() {
				function onlyNumber(){
					const reg = /\D/g;
					$("#plan_qty").val($("#plan_qty").val().replace(reg, ""));
				}
			$("#plan_qty").keyup(function(){     
				onlyNumber();
// 			function maCal() {
				var plan_qty = $("#plan_qty").val();
				var product_id = $("#product_id").val();
				
				$.ajax({
					url : 'materialSearch',
					type : 'POST',
					data : { product_id: product_id },
			        dataType: 'json',
			        success: function(response) {
		        	  $("#meInsertTable tbody").empty();
// 		        	  alert(response);
					  var ma_qtyList = [];
					  var ma_nameList = [];
		        	  for (var i = 0; i < response.length; i++) {
		        		    var vo = response[i];
		        		    var be_ma_qty = vo.ma_qty // 재고량
		        		    var cal_qty = (vo.use_qty*plan_qty); // 필요수량
		        		    var ma_qty = (be_ma_qty - cal_qty);
			// 				if(ma_qty >= cal_qty){
			// 			     cal_qty = parseFloat(cal_qty); // 필요수량	
			// 				var ma_qtyList[];
							ma_qtyList[i] = ma_qty;
							ma_nameList[i] = vo.ma_name;
							
							var row = $("<tr>");
							var ma_name_td = $("<td><input type='hidden' id='ma_name' name='ma_name' value='" + vo.ma_name + "'><input type='hidden' class='ma_nameList' name='ma_nameList' value='" + vo.ma_name + "'>" + vo.ma_name + "</td>");
					        var be_ma_qty_td = $("<td class='cal'><input type='hidden' id='ma_qty' name='ma_qty' value='" + ma_qty + "'>" + be_ma_qty + vo.unit + "</td>");
					        var cal_qty_td = $("<td><input type='hidden' class='ma_qtyList' name='ma_qtyList' value='" + (vo.ma_qty - (vo.use_qty * plan_qty)) + "'>" + cal_qty + vo.unit + "</td>");
							
					        // 재고량이 필요수량보다 작은경우 해당 td만 빨간색으로 처리
					        if (be_ma_qty < cal_qty) {
					        	console.log(ma_qty < cal_qty);
					          be_ma_qty_td.css("color", "red");
					          row.addClass("colorRed");
					          $("#workOrderInsert").attr('disabled',true);
					        } 
					        row.append(ma_name_td);
					        row.append(be_ma_qty_td);
					        row.append(cal_qty_td);
					        $("#meInsertTable tbody").append(row);
					      } //for
					      
					      // 모든 재고량이 필요수량보다 큰 경우에만 등록 버튼 활성화
					      if ($("#meInsertTable tbody tr.colorRed").length == 0) {
					          $("#workOrderInsert").attr("disabled", false);
					        }
		        	  console.log(ma_qtyList);
		        	  console.log(ma_nameList);
		          }, // success
		          error : function(error) {
		        	  alert(error);
		          } //error
				}); //ajax
// 			} // maCal()
			}); // keyup
		 });//document
		/////////// 자재 재고 계산 ///////////
		/////////// 수주번호로 정보 조회(페이지 이동x) ///////////
		$(document).ready(function() {
			//수주번호 검색 및 자동완성 기능 
			$("#cont_id").click(function(){
				
				var contPop = window.open('/workOrder/contFind', '수주검색', 'width=700px,height=500px,left=2000');
				
				if(contPop == null){
					  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
				  }
				contPop.onbeforeunload =contSearch;
			}); //("#cont_id").click
			
			function contSearch(){
			console.log("호출완료");
		  	  var cont_id = $("#cont_id").val();
		  	  console.log("cont_id"+cont_id)
		      $.ajax({
		        url : 'contSearch',
		        type : 'POST',
		        data : { cont_id: cont_id },
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType: 'json',
		        success: function(response) {
		      	  console.log(response);
		            var vo = response.vo;
		            var cont_qty = vo.cont_qty;
		            var product_id = vo.product_id
		            $("#woInsertTable tbody").empty();
		            $("#woInsertTable tbody").html(
		              "<tr>" +
		              "<td><input type='hidden' name='cont_id' value='"+cont_id+"'>" 
		              + vo.product_id + "</td>" +
		              "<td>" + vo.product_name + "</td>" +
		              "<td>" + vo.production_line + "</td>" +                           
		              "</tr>"
		            );
		            
		            $("#product_id").val(product_id);
		            $("#plan_qty").val(cont_qty);
		            $(".product_select").trigger("change"); // $("#plan_qty").keyup 이벤트 실행 => 자재 계산
		            
// 		            alert("keyup실행");
		        },
		        error : function(error) {
		        console.log(error);
		        } //error
		      }); //ajax
		      
			} // contSearch()
		}); //(document).ready
		/////////// 수주번호로 정보 조회(페이지 이동x) ///////////
		/////////// 작업지시 등록(DB저장) ///////////
			$(document).ready(function(){
			$("#workOrderInsert").click(function(){
				
// 				if (!$('#cont_id').val()) {
// 					Swal.fire({
// 						icon: 'error',
// 						title: '수주번호를 선택해주세요!',
// 						confirmButtonColor: '#0ddbb9',
// 						confirmButtonText: '확인'
// 					});
// 		        }else 
		        	if($("#product_id").val() == "상품코드") {
					Swal.fire({
						icon: 'error',
						title: '상품 코드를 선택해주세요!',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인'
					});
				}else if(!$("#plan_qty").val()) {
					Swal.fire({
						icon: 'error',
						title: '수량을 입력해주세요!',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인'
					});
				}else{
				var cont_id = $("#cont_id").val();
				console.log("cont_id : " +cont_id);
				var production_emp = $("#production_emp").val();
				console.log("production_emp : " +production_emp);
				var production_line = $("#production_line").val();
				console.log("production_line : " +production_line);
				var product_id = $("#product_id").val();
				console.log("product_id : " +product_id);
				var plan_qty = $("#plan_qty").val();
				console.log("plan_qty : " +plan_qty);
				var ma_qty = $("#ma_qty").val();
				console.log("ma_qty : " +ma_qty);
				var ma_qtyList = [];
				$(".ma_qtyList").each(function() {
					ma_qtyList.push($(this).val());
				});
				console.log("ma_qtyList : " +JSON.stringify(ma_qtyList));
// 				alert("ma_qtyList길이 :" + ma_qtyList.length);
				var ma_nameList = [];
				$(".ma_nameList").each(function() {
					ma_nameList.push($(this).val());
				});
				console.log("ma_nameList : " +JSON.stringify(ma_nameList));
				console.log(Array.isArray(ma_qtyList));
				console.log(Array.isArray(ma_nameList));
				var ma_name = $("#ma_name").val();
				console.log("ma_name : " +ma_name);
				
				Swal.fire({
					   title: '등록하시겠습니까?',
					   text: '상품코드 : '+product_id+', 수주량 : '+plan_qty+'개',
					   icon: 'warning',
					   showCancelButton: true,
					   confirmButtonColor: '#3085d6', 
					   cancelButtonColor: '#d33', 
					   confirmButtonText: '승인', 
					   cancelButtonText: '취소'
					}).then(result => {
						if (result.isConfirmed) {
				// form 동적 생성
				var $form = $("<form>", {
				    action: "",
				    role: "form",
				    id: "fr",
				    method: "POST"
				  });
		  		
				 $("<input>", {
				    type: "hidden",
				    name: "plan_qty",
				    value: plan_qty
				  }).appendTo($form);
				
				 $("<input>", {
				    type: "hidden",
				    name: "cont_id",
				    value: cont_id
				  }).appendTo($form);
				 
			      $("<input>", {
				    type: "hidden",
				    name: "production_emp",
				    value: $("#production_emp").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "production_line",
				    value: production_line
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "product_id",
				    value: $("#product_id").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "ma_qty",
				    value: $("#ma_qty").val()
				  }).appendTo($form);
				  
				  $("<input>", {
				    type: "hidden",
				    name: "ma_name",
				    value: $("#ma_name").val()
				  }).appendTo($form);

				  $("<input>", {
				    type: "hidden",
				    name: "ma_nameList",
				    value: ma_nameList.join(",")
				  }).appendTo($form);

				  $("<input>", {
				    type: "hidden",
				    name: "ma_qtyList",
				    value: ma_qtyList.join(",")
				  }).appendTo($form);
				  
				  $('body').append($form);
				  
				  sendForm();
					} //if
					}); //팝업
				} //else
		}); //click; 
		function sendForm() {
			var formObject = $("form[role='form']").serialize();
	
			$.ajax({
				url: 'workOrderInsert',
				type: 'POST',
				data: formObject,
				success: function(json) {
					Swal.fire({
						icon: 'success',
						title: '작업지시 등록 완료',
						text: '확인을 누르면 창을 닫습니다.',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인',
					}).then(() => {
						window.opener.location.reload();
						window.close();
						});
				}
			});
		} //function
		});  // $(document).ready
		/////////// 작업지시 등록(DB저장) ///////////
	</script>
	<!-- 상품코드 조회/수주번호 조회/자재 재고 계산/작업지시 등록 -->
	
	
	<h1 style="display: flex; justify-content: center;">작업지시 등록</h1>
	
	<div style="display: flex; justify-content: center;">
	<div>
	  <table class="table table-color">
		<tr>
		<th colspan="1">수주번호</th>
		 <td colspan="1"><input type="text" name="cont_id" id="cont_id" style="border:none; width:130px; cursor: pointer; text-align: center;" placeholder="수주번호선택" >
<!-- 		 </td> -->
<!--         <input type="button" id="btn_contSearch" onclick="contSearch" value="조회"> </td> -->
<!-- 		 <td ></td> -->
<!-- 		 <th></th> -->
		    <th>작업지시자</th>
		 <td>
		 <input type="hidden" id="production_emp" name="production_emp" value="${sessionScope.emp_id}">
		 ${sessionScope.emp_name}</td> 
		 </tr>
<!--        <td>  -->
<!--        <input type="text" id="cont_id" name="cont_id" value=""> -->
		
	<tr>
	 <th>상품코드</th>
		 <td style="whidth : 30px;" >
		  <select class=product_select id="product_id" name="product_id" style="width:80px; text-align: center;">
		  	<option value="상품코드">상품코드</option>
		    <option value="PR136">PR136</option>
		    <option value="PR216">PR216</option>
		    <option value="PR220">PR220</option>
		    <option value="PR320">PR320</option>
		    <option value="PR340">PR340</option>
		    <option value="PR350">PR350</option>
		    <option value="PR360">PR360</option>
		  </select>
		 </td>
		  <th>작업지시수량</th>
		 <td><input type="text" id="plan_qty" name="plan_qty" style="width:130px;" placeholder="수량을 입력해주세요" maxlength="13"></td>
<!-- 		 <td><input type="button" id="materialCal" value="계산"></td> -->
		 </tr>
		</table>
		</div>
		</div>
<!--    	<hr> -->
<!--    	<form id="woInsert"  method="post"> -->

<div style="flex: 1; display: flex; justify-content: center;">
<!--   <div style="flex: 1;"> -->
    <table id="woInsertTable" border="1">
      <!-- 첫 번째 테이블 내용 -->
<!--         <table id="woInsertTable" border="1" > -->
    <thead>
      <tr>
        <th>상품코드</th>
        <th>상품명</th>
        <th>생산라인</th>
      </tr>
    </thead>
    <tbody>
      <!-- 값 공간 -->
    </tbody>
    </table>
<!--   </div> -->
<!--   <div style="flex: 1.1;"> -->
<!--   <div style="display: flex; justify-content: center;"> -->
    <table id="meInsertTable" class="table table-color" >
      <!-- 두 번째 테이블 내용 -->
<!--       <table id="meInsertTable" class="table table-color"> -->
    <thead>
      <tr>
        <th>품목명</th>
        <th>재고량</th>
        <th>필요수량</th>
      </tr>
    </thead>
    <tbody>
      <!-- 값 공간 -->
    </tbody>
  </table>
<!--     </table> -->
<!--   </div> -->
<!-- </div> -->
</div>
<!--   </div> -->
  <div style="display: flex; justify-content: center;">
	<button type="button" id="workOrderInsert" class="btn btn-success" style="margin: 0.8px;">등록</button>
	<button type="button" class="btn btn-light" onclick="window.close();"style="margin: 0.8px;" >취소</button>
  </div>
<!-- 	</form> -->
	
</body>
</html>