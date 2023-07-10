<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>포장 등록</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />

<style type="text/css">
table {margin-bottom: 1em;
table-layout: fixed;
width: 95%; /* 테이블의 전체 너비 지정 */
font-size: 15px;}

table, th {border: none;}

th {background-color: #04AA6D;
color: #fff;
text-align: center;
padding: 10px 8px;}

td {border:1px solid #04AA6D;
color: #6C7293;
text-align: center;
padding: 10px 6px;
font-weight: 600;}

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
</style>

<script>

  /* 작업지시번호 조회(페이지 이동x) */
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
          
          if (vo) {
            
        	// 결과가 있을 때
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
	            $("#stage3_defCode").val('DE110');
	          } else if (vo.production_status === '혼합') {
	            $("#stage3_defCode").val('DE120');
	          } else if (vo.production_status === '주입') {
	            $("#stage3_defCode").val('DE130');
	          }
            
           // 등록 버튼 표시 여부 설정
           // 포장등록 페이지 (productionInsertStage2.jsp)
           // => 생산단계가 '주입'일 때만 표시
              if (vo.production_status === '주입') {
                $("#btnInsert").show(); // 등록 버튼 보이기
              } else {
                $("#btnInsert").hide(); // 등록 버튼 숨기기
              }
          } else {
         	    // 결과가 없을 때
              Swal.fire({
                title: '조회 결과 없음',
                icon: 'warning',
                confirmButtonText: '확인'  
            	});
            } // else             
        },
        error : function(error) {
        console.log(error);
        }
      });
    });
    
 	// 등록 버튼 클릭 시 sendForm 함수 호출
    $("#btnInsert").click(function(event) {
	    event.preventDefault(); // 폼의 서버 전송 방지
	    sendForm();
    });
    
	// sendForm 함수 정의
	function sendForm() {
	    Swal.fire({
	        title: '등록하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#0ddbb9',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '등록',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            $.ajax({
	                url: '/production/insertStage3',
	                type: 'POST',
	                data: new FormData($("form[role='form']")[0]),
	                enctype: 'multipart/form-data',
	                processData: false,
	                contentType: false,
	                cache: false,
	                success: function(json) {
	                    Swal.fire({
	                        title: '등록이 완료되었습니다.',
	                        icon: 'success',
	                        confirmButtonText: '확인'
	                    }).then(() => {
	                        window.opener.location.reload();
	                        window.close();
	                    });
	                } // json
	            }); // ajax
	        } // isConfirmed
	    }); // then(result)
	} // sendForm
    
  });	
  
  /* 불량수량 입력값에 숫자가 아닌 문자 제거 */
  $(document).ready(function() {
    $("input[name='stage3_defQty']").on("input", function() {
      $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });
  });
	
</script>



</head>
<body>
	<h1>포장 등록</h1>
	
	<form id="form_idSearch" method="get">
        <label for="production_id">작업지시번호</label>
        <input type="text" id="production_id" name="production_id" value="PR" maxlength="11">
        <input type="button" id="btn_idSearch" class="btn btn-info" value="조회">
    </form>
     <%
        // 작업지시번호 저장
        String production_id = request.getParameter("production_id");
     %>
   	<br>
	
   	<form role="form" id="insert"  method="post">
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
	  생산단계
	  <input type="text" name="production_status" id="production_status" style="background-color: #e6e6e6;" readonly>
	<br>
<!-- 	  생산수량 -->
<!-- 	  <input type="text" name="production_qty"> -->
<!-- 	  불량코드 -->
	  <input type="hidden" name="stage3_defCode" id="stage3_defCode" readonly >
		  불량수량
		  <input type="text" name="stage3_defQty">
	<br>
	<input type="submit" class="btn btn-success" id="btnInsert" value="등록" onclick="sendForm();">
	</form>
	
</body>
</html>