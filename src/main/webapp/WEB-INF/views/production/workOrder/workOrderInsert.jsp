workOrderInsert.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

	

<title>작업 지시 등록</title>
</head>
	<script>
		$(document).ready(function() {
			$("#materialCal").click(function() {
				var product_id = $("#product_id").val();
				var plan_qty = $("#plan_qty").val();
			
				// /(재고량 < 필요수량)인 경우 => 강조 + 등록불가
				// 최대 행 개수 추가하기
			$.ajax({
				  url : 'materialSearch',
		          type : 'POST',
		          data : { product_id: product_id },
		          dataType: 'json',
		          success: function(response) {
// 		        	  alert(response);
		        	  for (var i = 0; i < response.length; i++) {
		        		    var vo = response[i];
		        		    var ma_qty = vo.ma_qty+vo.unit;
		        		    var cal_qty = (vo.use_qty*plan_qty)+vo.unit;
			            $("#meInsertTable tbody").append(
			              "<tr>" +
			              "<td><input type='hidden' name='ma_name' value='"+vo.ma_name+"'>" 
			              + vo.ma_name + "</td>" +
			              "<td>" + ma_qty + "</td>" +
			              "<td>" + cal_qty + "</td>" +                           
			              "</tr>"
			            );
		        	  }
		          },
		          error : function(error) {
		              console.log(error);
		          }
				
			}); //ajax
				
			}); // click
		}); // function()

	
	</script>
<body>
	<h1>작업지시 등록</h1>
	
       
	<br>
	  <table>
		<tr>
		 <td>상품코드</td>
		 <td>
		  <select class=product_select id="product_id">
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
		<table>
		<tr>
		 <td>작업지시수량</td>
		 <td><input type="text" id="plan_qty" name="plan_qty"><td> 
		 <td><input type="button" id="materialCal" value="계산"></td>
		</tr>
	  </table>
  <table id="meInsertTable" border="1" style="float: left;">
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
  
  <table>
 	 <tr>
		 <td>작업지시자</td>
		 <td><input type="text" name="production_emp"><td> 
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
	            
	            $("#woInsertTable tbody").html(
	              "<tr>" +
	              "<td><input type='hidden' name='cont_id' value='"+vo.cont_id+"'>" 
	              + vo.cont_id + "</td>" +
// 	              "<td>" + vo.cont_id + "</td>" +
	              "<td>" + vo.product_name + "</td>" +
	              "<td>" + vo.production_line + "</td>" +                           
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
	  <div id="btn_contSearch" >
	   <label for="cont_id">수주번호</label>
        <input type="text" id="cont_id" name="cont_id" value="">
        <input type="button" value="조회">
    </div>
    <%
        // 수주번호 저장
        String cont_id = request.getParameter("cont_id");
     %>
	
  <br>
	<button type="submit" id="">등록</button>
	</form>

</body>
</html>