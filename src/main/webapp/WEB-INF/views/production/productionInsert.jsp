<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

  /* 수주번호 조회(페이지 이동x) */
  $(document).ready(function() {
    $("#btn_idSearch").click(function() {
  	  var production_id = $("#production_id").val();
  	  
      $.ajax({
        url : 'insertSearch.do',
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
              "<td>" + vo.emp_name + "</td>" +
              "<td>" + new Date(vo.production_date).toISOString().replace(/T/, ' ').replace(/\..+/, '') + "</td>" +
              "<td>" + vo.production_line + "</td>" +
              "<td>" + vo.product_id + "</td>" +
              "<td>" + vo.product_name + "</td>" +
              "<td>" + vo.plan_qty + "</td>" +
              "</tr>"
            );
            
            // 생산단계 값 설정
			  if (!vo.production_status) {
	            $("#production_status").val('혼합');
	          } else if (vo.production_status === '혼합') {
	            $("#production_status").val('주입');
	          } else if (vo.production_status === '주입') {
	            $("#production_status").val('포장');
	          } else {
	            $("#production_status").val(vo.production_status);
	          }
            
            // 불량코드 값 설정
              if (!vo.production_status) {
	            $("#def_code").val('DE110');
	          } else if (vo.production_status === '혼합') {
	            $("#def_code").val('DE120');
	          } else if (vo.production_status === '주입') {
	            $("#def_code").val('DE130');
	          }
        
        },
        error : function(error) {
        console.log(error);
        }
      });
    });
  });	
  
  /* 불량수량 입력값에 숫자가 아닌 문자 제거 */
  $(document).ready(function() {
    $("input[name='complete_defQty']").on("input", function() {
      $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });
  });
  
  /* 팝업창(수정중) */
  var popupWindow; // 팝업 창 객체를 참조하기 위한 변수

  function closePopup() {
    if (popupWindow) {
      popupWindow.close();
    }
    
    return false; // 폼 제출을 막기 위해 false를 반환
  }
  
  function submitForm() {
	  document.getElementById('insert').submit(); // 폼을 제출
	  closePopup(); // 폼 제출 후 팝업 창 닫기
	}
	
</script>



</head>
<body>
	<h1>생산 등록</h1>
	
	<form id="btn_idSearch" method="get">
        <label for="production_id">작업지시번호</label>
        <input type="text" id="production_id" name="production_id" value="">
        <input type="button" value="조회">
    </form>
    <%
        // 작업지시번호 저장
        String production_id = request.getParameter("production_id");
     %>
   	<hr>
	
   	<form id="insert"  method="post">
   	<table id="insertTable" border="1">
	    <thead>
	    <tr>
	        <th>작업지시번호</th>
	        <th>생산담당자</th>
	        <th>작업지시일시</th>
	        <th>생산라인</th>
	        <th>상품코드</th>
	        <th>상품명</th>
	        <th>작업지시수량</th>
	    </tr>
	    </thead>
	    <tbody>
	    
		</tbody>
	  </table>
	<br>
	  <table>
	  	<tr>
		 <td>생산단계</td>
		 <td>
			<input type="text" name="production_status" id="production_status" readonly>
         </td>
		</tr>
<!-- 		<tr> -->
<!-- 		 <td>생산수량</td> -->
<!-- 		 <td><input type="text" name="production_qty"><td>  -->
<!-- 		</tr> -->
		<tr>
		 <td>불량코드</td>
		 <td>
			<input type="text" name="def_code" id="def_code" readonly>
         </td>
		</tr>
		<tr>
		 <td>불량수량</td>
		 <td><input type="text" name="complete_defQty"><td> 
		</tr>
	  </table>
	<button type="button" onclick="submitForm();" class="btn btn-success">등록</button>
	</form>
	
	<script type="text/javascript">
    
	/* 팝업 창 닫기 */
    function closePopup() {
        if (popupWindow) {
            popupWindow.close();
        }
    }
	</script>
	
</body>
</html>