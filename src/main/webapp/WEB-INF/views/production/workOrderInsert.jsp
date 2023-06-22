<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
<!-- 수주번호 조회(페이지 이동x) -->
  $(document).ready(function() {
    $("#btn_contSearch").click(function() {
  	  var cont_id = $("#cont_id").val();
  	  
      $.ajax({
        url : 'woInsertSearch.do',
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
              "<td>" + vo.cust_id + "</td>" +
              "<td>" + vo.cust_name + "</td>" +
              "<td>" + vo.product_id + "</td>" +
              "<td>" + vo.product_name + "</td>" +
              "<td>" + vo.due_date + "</td>" +
              "<td>" + vo.cont_emp + "</td>" +
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

<title>Insert title here</title>
</head>
<body>
	<h1>작업지시 등록</h1>
	
	<form id="btn_contSearch" method="get">
        <label for="cont_id">수주번호</label>
        <input type="text" id="cont_id" name="cont_id" value="">
        <input type="button" value="조회">
    </form>
    <%
        // 수주번호 저장
        String cont_id = request.getParameter("cont_id");
     %>
   	<hr>
	
   	<form id="woInsert"  method="post">
	  <table id="woInsertTable" border="1">
	    <thead>
	    <tr>
	        <th>수주번호</th>
	        <th>수주처코드</th>
	        <th>수주처이름</th>
	        <th>상품코드</th>
	        <th>상품명</th>
	        <th>납품예정일</th>
	        <th>담당자</th>
	    </tr>
	    </thead>
	    <tbody>
	    
		</tbody>
	  </table>
	<br>
	  <table>
		<tr>
		 <td>작업지시자</td>
		 <td><input type="text" name="production_emp"><td> 
		</tr>
		<tr>
		 <td>생산라인</td>
		 <td>
		  <select name="production_line" id="line">
		    <option value="1라인">1라인</option>
		    <option value="2라인">2라인</option>
		    <option value="3라인">3라인</option>
		  </select>
		 </td>
		</tr>
		<tr>
		 <td>작업지시수량</td>
		 <td><input type="text" name="plan_qty"><td> 
		</tr>
	  </table>
	<button type="submit">등록</button>
	</form>

</body>
</html>