<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert 링크 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

// 오늘 날짜 출력 (yy-MM-dd)
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


// DB에 있는 출고번호 최대값 + 1
function addNumber(){	
	
	// maxNumber가 없을 때 (출고번호 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = getToday() + "000";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber); // 230620000
	}else{	// 있을 때
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	// 다음 번호 생성
	var nextNumber = Number(maxNumber) + 1;  			
	console.log("************ nextNumber =  " + nextNumber); 			// 230620001
	console.log("************ nextNumber타입 =  " + typeof nextNumber); // number
	
	return nextNumber;
}



// 출고번호 자동넘버링
$(document).ready(function(){
		
		// 날짜 정보 저장
		var today = getToday();
		var yesterday = getYesterday();
		
		
		// cont_id 정보 저장       
		var cont_id = "${param.cont_id }";
		console.log("************ cont_id = " + cont_id);


		// maxDate 정보 저장
		// maxDate가 없을 때 -> 입고번호 첫 등록
		var maxDate = "${maxDate }";
		if(maxDate == ""){
			maxDate = today;
			console.log("******************* (if)maxDate = " + maxDate); // 230620
		}else{	// 있을 때
	        maxDate = "${maxDate }";
			console.log("******************* (else)maxDate = " + maxDate);
		}

		
		// nextNumber 정보 저장
		// DB 날짜와 어제 날짜가 같을 때 초기화
		// 다르면 입고번호 + 1
		if(maxDate == yesterday){ 
			var nextNumber = today + "001"; // 230620001
			console.log("******************* (if) 최종 nextNumber = " + nextNumber);
		}else{
			var nextNumber = addNumber();	// 230620001
			console.log("******************* (else) 최종 nextNumber = " + nextNumber);
		}
		
		
		// endNumber 정보 저장
		// 끝에 3자리 출력
		var endNumber = String(nextNumber).substr(6);			  
		console.log("******************* endNumber = " + endNumber);			  // "001"
		console.log("******************* endNumber 타입 = " + typeof endNumber);  // string
			
			
		// 출고번호 조합 & 생성
		var op_id = "OP" + today + endNumber;
		
		
		// 출고담당 직원 정보
		var op_emp = "${sessionScope.emp_id}";
		
		
		// ajax 사용 controller에 정보 전달
		$.ajax({
				url: 'opid',
				type: 'post',
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				data: JSON.stringify({
					op_id:op_id,
					cont_id:cont_id,
					op_emp:op_emp,
					op_date:today
				}),
				success: function(){
// 					alert(op_id + ", 출고처리가 완료되었습니다.");
// 					location.href = "/purchasing/outProduct/list";
					alert("찐에러! opid.jsp line 130 수정ㄱㄱ");
				},
				error: function(){
					Swal.fire({
						icon: 'success',
						title: '출고번호 ' + op_id,
						text: '출고처리가 완료되었습니다.',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인',
					}).then((result) => {
						if(result.isConfirmed){
							location.href="/purchasing/outProduct/list";
						}
					}); // then(result)
					
				} // error
				
		}); // ajax
	
		
		
}); // JQuery
</script>
</head>
<body>
</body>
</html>