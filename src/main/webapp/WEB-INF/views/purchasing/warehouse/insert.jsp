<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
          alert(emp_id);

          var nextNumber = addNumber();
  		  var whs_id = "MW" + nextNumber;
  		  console.log("************ 품목코드 = " + whs_id);
          
          console.log("whs_id : "+whs_id);
          
          var whs_id = "MW"+ nextNumber;
          var whs_type	= $("#whs_type").val();
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
            	     whs_emp : whs_emp 
             },
             success : function(){
            	 alert("등록완료!!");
            	 opener.parent.location.reload();
            	 window.close(); // 팝업 창 닫기
             }, // success
             error : function () {
            	 alert("err 등록은됨 ㅋ");
            	opener.parent.location.reload();
				window.close(); 
			 }// error
          }) // ajax
          
         });// warehouseInsert
 
        
	
}); // jquery
</script>
</head>

<body>


   <div>
   <form action="" method="post" name="ware">
			 창고타입 : <select name="whs_type" id="whs_type"><option value="자재">자재창고</option>
    <option value="상품">상품창고</option></select><br>
			 전화번호 : <input type="text" name="whs_tel" id="whs_tel"><br>
			 사용여부 : 사용<input type="radio" name="whs_status" value="1" id="whs_status">미사용<input type="radio" name="whs_status" value="2" id="whs_status"><br>
			</form>
   </div>			
			<button type="submit"  id="warehouseInsert">등록</button>
	
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