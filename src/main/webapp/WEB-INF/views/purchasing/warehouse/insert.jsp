<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* 테이블 css */
table {margin-bottom: 1em;}

table, th {border: none;}

th {background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {border:1px solid #04AA6D;
	padding: 10px 6px;}

.btn{
	display: inline-block;
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
button{
	color: #000;
	background-color: #0ddbb9;
	border-color: #0ddbb9;
	display: inline-block;
	font-weight: 600;
	line-height: 1;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.625rem 1.125rem;
	font-size: 0.875rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
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

.btn_btn {
	position: absolute;
	top: 0;
	right: 0;}

.btn_table table {
	width: 100%;}		

/* 테이블 css */
</style>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert 링크 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

//DB에 있는 품목코드 최대값 + 1
function addNumber(){	
	// maxNumber가 없을 때 (품목코드 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = "000";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber);
	}else{	// 있을 때
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	// 다음 번호 생성
	var nextNumber = String(Number(maxNumber) + 1).padStart(3,'0');
	console.log("************ 포매팅 nextNumber =  " + nextNumber);	
	return nextNumber;
}
function praddNumber(){	
	// maxNumber가 없을 때 (품목코드 첫 등록)
	var prmaxNumber = "${prmaxNumber }";
	if(prmaxNumber == ""){
		prmaxNumber = "000";
		console.log("************ (if)전달받은 prmaxNumber =  " + prmaxNumber);
	}else{	// 있을 때
		prmaxNumber = "${prmaxNumber}";
		console.log("************ (else)전달받은 prmaxNumber =  " + prmaxNumber);
	}
	
	// 다음 번호 생성
	var prnextNumber = String(Number(prmaxNumber) + 1).padStart(3,'0');
	console.log("************ 포매팅 prnextNumber =  " + prnextNumber);	
	return prnextNumber;
}

// 체크박스 선택된 개수 출력
function getCheckedCnt()  {
  // 선택된 목록 가져오기
  var count = 'input[name="check"]:checked';
  var selectedElements = document.querySelectorAll(count);
  // 선택된 목록의 갯수 세기
  var cnt = selectedElements.length;
  return cnt;  
}


$(document).ready(function(){
	      
          $("#warehouseInsert").click(function(){
    	  var emp_id = "${sessionScope.emp_id }";
          console.log("emp_Id : "+emp_id);
//           alert(emp_id);

          var nextNumber = addNumber();
          var prnextNumber = praddNumber();
          var whs_id = "MW"+ nextNumber;
  		  console.log("************ 품목코드 = " + whs_id);
          
  		  var whspr_id = "PW"+prnextNumber;
          var whs_type	= $("#whs_type").val();
          console.log(whs_type);
          if($("#whs_type").val() == "자재"){
             whs_id = "MW"+ nextNumber;
             whspr_id = "PW001";
          }else if($("#whs_type").val() =="상품"){
        	 whs_id = "PW" +prnextNumber;
        	 var whspr_id = whs_id;
          } 
          console.log("whs_id : "+whs_id);
          console.log(whs_id);
          var whs_tel = $("#whs_tel").val();
          var whs_status = $("input[name='whs_status']:checked").val();
          var whs_emp = emp_id;
          
          $.ajax({
             url : "insert",
             type : "POST",
             data :{ whs_id : whs_id,
            	     whs_type : whs_type,
            	     whs_tel : whs_tel,
            	     whs_status : whs_status,
            	     whs_emp : whs_emp,
            	     whspr_id : whspr_id
             },
             success : function(){
            	 Swal.fire({
            			icon: 'success',
            			title: '창고번호 ' + whs_id,
            			text: '등록이 완료되었습니다.',
            			confirmButtonColor: '#0ddbb9',
            			confirmButtonText: '확인',
            		}).then((result) => {
            			if(result.isConfirmed){
            				opener.parent.location.reload();
            				window.close(); // 팝업 창 닫기
            			}
            		}); // then(result)
            		
             }, // success
             error : function () {
//             	alert("err 등록은 됨 !");
           	    Swal.fire({
           			icon: 'success',
           			title: '창고번호 ' + whs_id,
           			text: '등록이 완료되었습니다.',
           			confirmButtonColor: '#0ddbb9',
           			confirmButtonText: '확인',
           		}).then((result) => {
           			if(result.isConfirmed){
           				opener.parent.location.reload();
           				window.close(); // 팝업 창 닫기
           			}
           		}); // then(result)
           		
			 }// error
			 
          }) // ajax
          
         });// warehouseInsert
 
        
	
}); // jquery
</script>
</head>

<body>
<form action="" method="post" name="ware">
		<div class="container">
			<h1 style="display: inline;">창고등록</h1>
   <div class="btn_table">
   <table border="1">
    <tr>
    <th>창고타입 :</th>
    <td><select name="whs_type" id="whs_type"><option value="자재">자재창고</option>
    <option value="상품">상품창고</option></select></td>
    </tr>
     <tr>
    <th>전화번호 :</th>
     <td><input type="text" name="whs_tel" id="whs_tel"></td>
    </tr>
     <tr>
    <th>사용여부 :</th>
     <td>사용 <input type="radio" name="whs_status" value="1" id="whs_status"> 미사용 <input type="radio" name="whs_status" value="2" id="whs_status"> </td>
    </tr>
   </table>
  <!--  <form action="" method="post" name="ware">
			<span> 창고타입 :</span> <select name="whs_type" id="whs_type"><option value="자재">자재창고</option>
    <option value="상품">상품창고</option></select><br>
			 <span>전화번호 :</span> <input type="text" name="whs_tel" id="whs_tel"><br> 
			 <span>사용여부 :</span> <span>사용</span><input type="radio" name="whs_status" value="1" id="whs_status"><span>미사용</span><input type="radio" name="whs_status" value="2" id="whs_status"> <br>
			</form> -->
        </div>	
      </div>
    </form>		
			      <div class="btn_btn">
			   <button type="submit"  id="warehouseInsert">등록</button>
			   <input type="button" class="btn btn-success" value="창닫기" onclick="window.close();"> 
			</div>
	
 <!-- <table border="1" id="example-table-3" class="table table-bordered table-hover text-center tbl" style="width: 100%;">
   <thead>
   <tr>
   <th>창고번호</th>
   <th>창고번호</th>
   <th>창고번호</th>
   </tr>
   </thead>
 </table> -->
</body>
</html>