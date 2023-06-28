<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

	

<title>작업 지시 등록</title>
</head>


	<!-- 자재 재고 계산 -->
	<!-- 값이 들어가면 자동 계산 조금 더 고민해보기 -->
	<script>
		$(document).ready(function() {
				
// 			$("#materialCal").click(function() {
	
// 			$(document).on("change", "text[id='plan_qty']", function (){
			$("#plan_qty").keyup(function() {
				var product_id = $("#product_id").val();
				var plan_qty = $("#plan_qty").val();
				
				
				$.ajax({
					  url : 'materialSearch',
			          type : 'POST',
			          data : { product_id: product_id },
			          dataType: 'json',
			          success: function(response) {
			        	  // 등록버튼을 누르면 기존의 데이터가 초기화
			        	  $("#meInsertTable tbody").empty();
// 			        	  alert(response);
			        	  for (var i = 0; i < response.length; i++) {
			        		    var vo = response[i];
			        		    var be_ma_qty = vo.ma_qty // 재고량
			        		    var cal_qty = (vo.use_qty*plan_qty); // 필요수량
			        		    var ma_qty = (be_ma_qty - cal_qty);
// 								if(ma_qty >= cal_qty){
// 			        		    cal_qty = parseFloat(cal_qty); // 필요수량
				            $("#meInsertTable tbody").append(
				              "<tr>" +
				              "<td><input type='hidden' name='ma_name' value='"+vo.ma_name+"'>" 
				              + vo.ma_name + "</td>" +
				              "<td class='cal'><input type='hidden' id='ma_qty' name='ma_qty' value='"+ma_qty+"'>" + be_ma_qty+vo.unit+"</td>" +
				              "<td >" +cal_qty+vo.unit+"</td>" +                           
				              "</tr>"
				            ); //append
							// (재고량 < 필요수량)인 경우 => 강조 + 등록불가
				            if(ma_qty < cal_qty){
				            $(".cal").css("color","red");
				            $("#workOrderInsert").attr('disabled',true);
				            }
// 			         		 } else if(ma_qty < cal_qty){
// 			         			alert("자재 재고량이 부족합니다"); 
			         			
// 			         		 } else {
// 			         			alert("오류");
// 			         		 }
			        	  } //for
			          }, // success
			          error : function(error) {
			        	  alert(error);
			          } //error
				}); //ajax
			}); // keyup
		}); // function()
	</script>
	<!-- 자재 재고 계산 -->
	<!-- 상품 코드 선택시 정보 자동 조회 -->
	<script>
		$(document).ready(function(){
			// db처리 해도 되겠지만... 굳이 싶어서...
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
			}); //change
			
		}); //function()
		
	</script>
	<!-- 상품 코드 선택시 정보 자동 조회 -->
<body>

	<h1>작업지시 등록</h1>
	
	  <table class="table table-color">
		<tr>
		 <td>상품코드</td>
		 <td >
		  <select class=product_select id="product_id" name="product_id">
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
		</tr>
		</table>
   	<hr>
   	<form id="woInsert"  method="post">
	  <table id="woInsertTable" border="1" >
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
  <br>
		<table class="table table-color">
		<tr>
		 <td>작업지시수량</td>
		 <td><input type="text" id="plan_qty" name="plan_qty"><td> 
<!-- 		 <td><input type="button" id="materialCal" value="계산"></td> -->
		</tr>
	  </table>
  <table id="meInsertTable" class="table table-color">
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
  <br>
  <br>
  <hr>
  <table class="table table-color">
 	 <tr>
		 <td>작업지시자</td>
		 <td><input type="text" id="production_emp" name="production_emp"><td> 
		 <td>작업지시자번호(임시)</td>
		 <td><input type="text" id="production_id" name="production_id"><td> 
	</tr>
	</table>
	  <!-- 수주번호로 정보 조회(페이지 이동x) -->
	<script>
	$(document).ready(function() {
	    $("#btn_contSearch").click(function() {
	  	  var cont_id = $("#cont_id").val();
	  	  
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
	            $("#woInsertTable tbody").empty();
	            $("#woInsertTable tbody").html(
	              "<tr>" +
	              "<td><input type='hidden' name='cont_id' value='"+cont_id+"'>" 
	              + vo.product_id + "</td>" +
// 	              "<td>" + vo.cont_id + "</td>" +
	              "<td>" + vo.product_name + "</td>" +
	              "<td>" + vo.production_line + "</td>" +                           
	              "</tr>"
	            );
	            $("#plan_qty").val(cont_qty);
	        
	        },
	        error : function(error) {
	        console.log(error);
	        }
	      });
	    });
	  });
	</script>
	  <div>
	   <label for="cont_id">수주번호</label>
        <input type="text" id="cont_id" name="cont_id" value="">
        <input type="button" id="btn_contSearch" value="조회">
    </div>
	
  <br>
	<button type="submit" id="workOrderInsert" >등록</button>
	</form>
	<!-- 작업지시 등록(DB저장) -->
	<script>
		$(document).ready(function() {
			$("#workOrderInsert").click(function() {
				var production_id = $("#production_id").val();
				var cont_id = $("#cont_id").val();
				var production_emp = $("#production_emp").val();
				var production_line = $("#production_line").val();
				var product_id = $("#product_id").val();
				var plan_qty = $("#plan_qty").val();
				// 아래 데이터 update 수정중
				var ma_qty = $("#ma_qty").val();
				var ma_name = $("#ma_name").val();
				
				$.ajax({
					uri : 'workOrderInsert',
					type : 'POST',
			        data : { cont_id: cont_id,
			        	production_id: production_id,
			        	production_emp : production_emp,
			        	production_line : production_line,
			        	product_id : product_id,
			        	plan_qty : plan_qty,
			        	ma_qty : ma_qty,
			        	ma_name : ma_name },
// 			        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
// 			        dataType: 'json',
			        success: function(response) {
			        	 alert("저장 완료");
// 			        	 setTimeout(function() {   
		 		       	 opener.parent.location.reload();
		 		    	 window.close(); // 팝업 창 닫기
// 		 		         }, 200);
			        },
			        error : function(e){
			        	console.log(e);
			        }
				}); //ajax
				
			
			    // form 태그 동적 생성
// 			    const form = $('<form>', {
// 			      method: 'post',
// 			      action: 'workOrderInsert',
// 			      'accept-charset': 'utf-8' });
			
// 			    // 파라미터 전달용 hidden 추가
// 			    form.append($('<input>', {
// 			      type: 'hidden',
// 			      name: 'production_id',
// 			      value: production_id  }));
// 			    form.append($('<input>', {
// 			      type: 'hidden',
// 			      name: 'cont_id',
// 			      value: cont_id   }));
// 			    form.append($('<input>', {
// 			      type: 'hidden',
// 			      name: 'production_emp',
// 			      value: production_emp  }));
// 			    form.append($('<input>', {
// 			      type: 'hidden',
// 			      name: 'production_line',
// 			      value: production_line  }));
// 			    form.append($('<input>', {
// 			      type: 'hidden',
// 			      name: 'product_id',
// 			      value: product_id  }));
// 			    form.append($('<input>', {
// 			      type: 'text',
// 			      name: 'plan_qty',
// 			      value: plan_qty  }));
			
// 			    // form태그 body에 추가 후 전송
// 			    $('body').append(form);
// 			    form.submit();
			   
// 			    

			}); // click
		}); // function()
	</script>
	<!-- 작업지시 등록(DB저장) -->
</body>
</html>