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


//DB에 있는 입고번호 최대값 + 1
//230620004 -> 230620005
function autoNumber(){
	
	var maxNumber;
	alert(maxNumber);
	
	if(maxNumber == null){
		maxNumber = getToday() + "001";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber);
	}else{
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	var nextNumber = Number(maxNumber)+1;  			
	console.log("************ nextNumber =  " + nextNumber);
	console.log("************ nextNumber 타입 =  " + typeof nextNumber); // number
	
	return nextNumber;
}



// '입고처리' 버튼 클릭
$(document).ready(function(){
	$('.done').click(function(){
		
		// order_id 정보 저장         
        var str = ""
        var tdArr = new Array();
        var done = $(this);
        var tr = done.parent().parent();	// done의 부모는 <td>
        var td = tr.children();				// <td>의 부모이므로 <tr>
        var order_id = td.eq(1).text();
        document.fo.order_id.value = order_id;
        
        
        
	    
	    
 
		
		
        
		


	}); // done.click
	
	
});

</script>



</head>
<body>

<h1>inid.jsp</h1>
<h2>입고번호 - 자동넘버링, 입고번호조합</h2>

</body>
</html>