<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<script>
//오늘 날짜 출력 (yy-MM-dd)
function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var year = String(year);
	var yy = year.substring(2,4);
	var mon = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
	var today = yy + mon + day;
	return today;
}


// 어제 날짜 출력 (yy-MM-dd)
function getYesterday(){
	var today = new Date();
	var date = new Date(today.setDate(today.getDate()-1));
	var year = date.getFullYear();
	var year = String(year);
	var yy = year.substring(2,4);
	var mon = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
	var yesterday = yy + mon + day;
	return yesterday;
}


// DB에 있는 입고번호 최대값 + 1
function addNumber(){	
	
	// maxNumber가 없을 때 (입고번호 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = getToday() + "000";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber); // 230620001
	}else{	// 있을 때
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	// 다음 번호 생성
	var nextNumber = Number(maxNumber) + 1;  			
	console.log("************ nextNumber =  " + nextNumber); // 230620002
	console.log("************ nextNumber타입 =  " + typeof nextNumber); // number
	
	return nextNumber;
}



// 입고번호 자동넘버링
$(document).ready(function(){
		
		// 날짜 정보 저장
		var today = getToday();
		var yesterday = getYesterday();
		
		
		// 전달 정보 저장 //
		var qc_emp = "${param.qc_emp }";
		var qc_qty = "${param.qc_qty }";
		var production_id = "${param.production_id }";
		var def_code = "${param.def_code }";
		var def_qty = "${param.def_qty }";
		console.log("************ qc_emp = " + qc_emp); // OK
		console.log("************ qc_qty = " + qc_qty); // OK
		console.log("************ production_id = " + production_id); // OK
		console.log("************ def_code = " + def_code); // OK
		console.log("************ def_qty = " + def_qty); // OK

		
		// maxDate 정보 저장
		// maxDate가 없을 때 -> 입고번호 첫 등록
		var maxDate = "${maxDate }";
		if(maxDate ==  null){
			maxDate = today;
			console.log("******************* (if)maxDate = " + maxDate); // 230620
		}else{	// 있을 때
	        maxDate = "${maxDate }";
			console.log("******************* (else)maxDate = " + maxDate);
		}

		
		
		// nextNumber 정보 저장
		// DB 날짜와 어제 날짜가 같을 때 초기화
		// 다르면 입고번호 + 1
		if(maxDate == yesterday){ // 230619 230619
			var nextNumber = today + "001"; // 230620001
			console.log("******************* (초기화)nextNumber = " + nextNumber);
		}else{
			var nextNumber = addNumber();
		}
		
		
		// endNumber 정보 저장
		// 끝에 3자리 출력
		var endNumber = String(nextNumber).substr(6);			  
		console.log("******************* endNumber = " + endNumber);	// 002
		console.log("******************* endNumber 타입 = " + typeof endNumber);  // string
			
			
		// 입고번호 조합 & 생성
		var qc_num = "QC" + today + endNumber;
		alert(qc_num + ", 검수등록 완료되었습니다.");
		
		
		// ajax 사용 controller에 정보 전달
		$.ajax({
				url: "qcid",
				type: 'post',
				data: {
					qc_num:qc_num,
					qc_emp:qc_emp,
					qc_qty:qc_qty,
					production_id:production_id,
					def_code:def_code,
					def_qty:def_qty
				},
				success: function(data){
					opener.parent.location.reload();
			    	  window.close();
// 					setTimeout(function() {   
// 				       	  opener.parent.location.reload();
// 				    	  window.close(); // 팝업 창 닫기
// 				          }, 200);
				},
				error: function(){
					alert("error");	
				}
		}); // ajax
	
}); // JQuery

</script>
</head>
<body>
</body>
</html>