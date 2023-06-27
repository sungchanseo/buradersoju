<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


function getToday() {
    var date = new Date();
    
    var year = date.getFullYear();
    console.log(year);
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    console.log(month);
    var day = ("0" + date.getDate()).slice(-2);
    console.log(day);
    return year + "-" + month + "-" + day;
 }
//오늘 날짜 (발주날짜)
function getTodays() {
	var date = new Date();
	var year = date.getFullYear();
	var year = String(year);
	var yy = year.substring(2,4);
	var mon = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
	var today = yy + mon + day;
	return today;
}
 
 // 납기 일짜(발주날짜에 7일뒤 )
function orderToday() {
    var date = new Date();
    var sel_day = 7;
    date.setDate(date.getDate() + sel_day );
    var year = date.getFullYear();
    console.log(year);
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    console.log(month);
    var day = ("0" + date.getDate()).slice(-2);
    console.log(day+1);
    return year + "-" + month + "-" + day;
 }
// 입고  일짜(발주날짜에 3일뒤 )
function inToday() {
    var date = new Date();
    var sel_day = 3;
    date.setDate(date.getDate() + sel_day );
    
    var year = date.getFullYear();
    console.log(year);
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    console.log(month);
    var day = ("0" + date.getDate()).slice(-2);
    console.log(day);
    return year + "-" + month + "-" + day;
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
function addNumber(){	
	
	// maxNumber가 없을 때 (입고번호 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = getTodays() + "000";
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

$(function() {
	// 날짜 정보 저장
	var today = getTodays();
	var yesterday = getYesterday();
		
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
	 var order_id = "OR" + today + endNumber;
    //// 행추가 ////////////////////////////////////////////////////////////
    
    $('.writeForm').click(function() {
       console.log(nextNumber);
       console.log("행추가 등록함");
 
       let regdate = getToday();
       let intodays = inToday();
       let orderTodays = orderToday();
  /*      console.log(regdate);
       console.log(intodays);
       console.log(orderTodays); */
       if($(this).hasClass('true')) {
      
          let tbl = "<tr>";
          tbl += " <td>";
          tbl += order_id;
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<select name='ma_id' id='ma_id'><option value='MA001'>MA001</option>" ;
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='ma_name' id='ma_name'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='unit_cost' id='unit_cost'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='ma_qty' id='ma_qty'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='order_qty' id='order_qty'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='order_sum' id='order_sum'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='order_vat' id='order_vat'>";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='order_date' id='order_date' value="+regdate+">";
          tbl += "</td>";
          tbl += " <td>";
          tbl += "<input type='text' name='due_date' id='due_date' value="+orderTodays+">";
          tbl += "</td>";
          tbl += "<td>";
          tbl += "<input type='text' name='in_date' id='in_date' value="+intodays+">";
          tbl += "</td>"; 
          tbl += "<td>";
          tbl += "<input type='text' name='whs_num' id='whs_num'>";
          tbl += "</td>";
          tbl += "<td>";
          tbl += "<input type='text' name='order_emp' id='order_emp'>";
          tbl += "</td>";
          tbl += "</tr>";
          
          $('table').append(tbl);
          
          
          $(this).removeClass('writeForm').addClass('write');
          $(this).removeClass('true');
          $(this).text("등록");
       
       }
       
       
       
       $('.write').click(function() {
//           e.stopPropagation();
          console.log("글쓰기 등록함");
          
          var ma_id = $('#ma_id').val();
          var ma_name = $('#ma_name').val();
          var order_id = $('#order_id').val();
          var whs_num = $('#whs_num').val();
          var unit_cost = $('#unit_cost').val();
          var ma_qty = $('#ma_qty').val();
          var order_qty = $('#order_qty').val();
          var order_sum = $('#order_sum').val();
          var order_vat = $('#order_vat').val();
          var order_date = $('#order_date').val();
          var due_date = $('#due_date').val();
          var in_date = $('#in_date').val();
          var order_emp = $('#order_emp').val();
 
          console.log(ma_id);
          console.log(ma_name);
          console.log(whs_num);
          console.log(unit_cost);
          console.log(ma_qty);
          console.log(order_qty);
          console.log(order_sum);
          console.log(order_vat);
          console.log(order_date);
          console.log(due_date);
          console.log(in_date);
          console.log(order_emp);
       
          if(ma_id==="" || ma_name==="" || whs_num ==="" ) {
             alert("빈칸을 입력하세요");
          } else {
             $.ajax({
                url: "list",
                type: "post",
                data: {ma_id:ma_id,order_date:order_date,due_date:due_date,in_date:in_date,order_id:order_id ,order_qty:order_qty,order_sum:order_sum,order_vat:order_vat,order_emp:order_emp},
               success: function() {
              	 location.href="/purchasing/order/list"
                   alert("등록완료");
                },
                error: function() {
                   alert("error");
                }
             }); //ajax
          } //if-else
          
       }); //write click
    
    }); //writeForm click
 
 }); //jQuery
</script>
</head>
<body>
<button class="writeForm true">행추가</button>
 <fmt:formatDate value=""/>
 <div class="inventory" > 
<table border="1">
			<tr>
				<th>발주번호</th>
				<th>자재코드</th>
				<th>자재명</th>
				<th>단가</th>
				<th>자재수량</th>
				<th>주문수량</th>
				<th>총액</th>
				<th>부가세</th>
				<th>발주일자</th>
				<th>납기일자</th>
				<th>입고일자</th>
				<th>입고창고</th>
				<th>담당직원</th>
			</tr>
			<c:forEach var="order" items="${orderList}">
			 	<tr>
			 	    <td><input type="checkbox" name="check"></td>
				    <td>${order.order_id}</td>
					<td>${order.ma_id}</td>
					<td>${order.ma_name}</td> 
					<td>${order.unit_cost}</td>
					<td>${order.ma_qty}</td>					
					<td>${order.order_qty}</td>
					<td>${order.order_sum}</td>
					<td>${order.order_vat}</td>
					<td>${order.order_date}</td>
					<td>${order.due_date}</td>
					<td>${order.in_date}</td>		
					<td>${order.whs_num}</td>
					<td>${order.order_emp}</td>
				</tr> 
			</c:forEach>
		</table>
		
 </div>
</body>
</html>
<%@ include file="../../includes/footer.jsp" %>