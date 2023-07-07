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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert 링크 -->
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

//체크박스 선택된 개수 출력
function getCheckedCnt()  {
  // 선택된 목록 가져오기
  var count = 'input[name="check"]:checked';
  var selectedElements = document.querySelectorAll(count);
  // 선택된 목록의 갯수 세기
  var cnt = selectedElements.length;
  
  return cnt;  
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
       console.log(emp_id);
       let regdate = getToday();
       let intodays = inToday();
       let orderTodays = orderToday();
       
       if($(this).hasClass('true')) {
           
           let tbl = "<tr id='key_id'>";
           tbl += " <td>";
           tbl += "<input size='15' type='checkbox' name='check'>";
           tbl += "</td>";
           tbl += " <td>";
           tbl += "<input type='text' name='order_id' id='order_id' value="+order_id+">";
           tbl += "</td>";
           tbl += " <td>";
           tbl += "<input type='text' name='ma_id' id='ma_id'>" ;
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
           tbl += "<input type='text' name='whs_id' id='whs_id'>";
           tbl += "</td>";
           tbl += "<td>";
           tbl += "<input type='text' name='emp_name' id='emp_name'>";
           tbl += "</td>";
           tbl += "</tr>";
           
           $('table').prepend(tbl);
           
           
           $(this).removeClass('writeForm').addClass('write');
           $(this).removeClass('true');
       
        }
       $("#key_id").keyup(function() {
           var obj = {
                       in_ma_id : $("#ma_id").val(),
                       in_order_qty : $("#order_qty").val()
               };
          console.log(obj.in_ma_id);
      $.ajax({
          url :"/purchasing/order/"+obj.in_ma_id,
          type :"get",
          success:function(data){
        	  console.log(obj.in_order_qty);
        	  console.log(data);
        	  $("#ma_qty").val(data.ma_qty)
        	  $("#unit_cost").val(data.unit_cost)
        	  $("#ma_name").val(data.ma_name)
         	  $("#order_sum").val(data.unit_cost*obj.in_order_qty)
        	  $("#order_vat").val(data.unit_cost*obj.in_order_qty/100)
        	  $("#whs_id").val(data.whs_id)
        	 // $("#ma_name").val(data.ma_name)
        	 
              
            	// 등록버튼을 누르면 기존의 데이터가 초기화
      
          }, //success
           error : function(error){
        	  
       }  //error
    }); //ajax
    
 }); // keyup
     
       
       
       
       $('.write').click(function() {
//           e.stopPropagation();
          console.log("글쓰기 등록함");
          
          var ma_id = $('#ma_id').val();
          var ma_name = $('#ma_name').val();
          var order_id = $('#order_id').val();
          var whs_id = $('#whs_id').val();
          var unit_cost = $('#unit_cost').val();
          var ma_qty = $('#ma_qty').val();
          var order_qty = $('#order_qty').val();
          var order_sum = $('#order_sum').val();
          var order_vat = $('#order_vat').val();
          var order_date = $('#order_date').val();
          var due_date = $('#due_date').val();
          var in_date = $('#in_date').val();
          var order_emp = $('#order_emp').val();
          var emp_name = $('#emp_name').val();
          console.log(ma_id);
          console.log(ma_name);
          console.log(whs_id);
          console.log(unit_cost);
          console.log(ma_qty);
          console.log(order_qty);
          console.log(order_sum);
          console.log(order_vat);
          console.log(order_date);
          console.log(due_date);
          console.log(in_date);
          console.log(order_emp);
       
          if(ma_id==="" || ma_name==="") {
//              alert("빈칸을 입력하세요");
             Swal.fire({
           		icon: 'warning',
           		text: '빈 칸을 입력하세요.',
           		confirmButtonColor: '#0ddbb9',
           		confirmButtonText: '확인',
           	 }).then((result) => {
           		if(result.isConfirmed){
           			return false;
           		}
           	 }); // then(result)
          } else {
             $.ajax({
                url: "list",
                type: "post",
                data: {emp_name:emp_name,whs_id:whs_id,ma_id:ma_id,order_date:order_date,due_date:due_date,in_date:in_date,order_id:order_id ,order_qty:order_qty,order_sum:order_sum,order_vat:order_vat,order_emp:order_emp},
               success: function() {
//                 	alert("등록완료");
//               	location.href="/purchasing/order/list";
					Swal.fire({
					icon: 'success',
					title: '발주번호 ' + order_id,
					text: '발주처리가 완료되었습니다.',
					confirmButtonColor: '#0ddbb9',
					confirmButtonText: '확인',
					}).then((result) => {
						if(result.isConfirmed){
							location.href="/purchasing/order/list";
						}
					}); // then(result)
                },
                error: function() {
                   alert("error");
                }
             }); //ajax
          } //if-else
          
       }); //write click
    
    }); //writeForm click


 // 2-1. '수정' 클릭
	$('.modify').click(function(){ 
		
		if($(this).hasClass('true')) {
			$(this).removeClass('true');	// 한번 더 수정이 안된다면 얘가 문제임 ! remove해서!
			
			// 배열 & 체크박스 변수 생성
			var rowData = new Array();
			var tdArr = new Array();
			var checkbox = $("input[name=check]:checked");
			
			
			// 체크박스 항목 개수 제어
			if(checkbox.length > 1){
// 				alert("하나의 항목만 수정이 가능합니다.");
				Swal.fire({
					icon: 'warning',
					text: '하나의 항목만 수정이 가능합니다.',
					confirmButtonColor: '#0ddbb9',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.isConfirmed){
						return false;
					}
				}); // then(result)
			}else if($('input:checkbox[name="check"]:checked').length == 0){
// 				alert("수정할 항목을 선택해주세요.");
				Swal.fire({
					icon: 'warning',
					text: '수정할 항목을 선택해주세요.',
					confirmButtonColor: '#0ddbb9',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.isConfirmed){
						return false;
					}
				}); // then(result)
			}
				
			
			// 체크된 체크박스 값 가져오기
			checkbox.each(function(i) {
	
				var tr = checkbox.parent().parent().eq(i);	// checkbox의 부모는 <td>, <td>의 부모는 <tr>
				var td = tr.children();
				
				// 체크된 row의 모든 값 배열에 담기
				rowData.push(tr.text());
				
				// td.eq(0)은 체크박스, td.eq(1)이 ma_id
				// -> 배열 tdArr에 정보를 담음
				var order_id = td.eq(1).text();
				tdArr.push(order_id);	// tdArr[0] == ma_id
				
				$.ajax({
					url: "modify",
					type: "get",
					data: { order_id:order_id },
					success: function(data) {	// 기존데이터정보(orderVo) 받아옴 
		
						// 여기서 order_id를 이용해서 if문걸어가지고 같은 값일때 아래처럼 나오게하면될듯?!
						
						// orderVo에서 테이블 값 가져오기
						var order_date = data.order_date;
					    console.log(order_date);
					    console.log(order_date);
					$(data).each(function(idx, obj){
							var str = "";
							str += "<tr>";
							str += "<td><input type='checkbox' name='check'></td>";
							str += "<td>"+ obj.order_id +"</td>";
							str += "<td>"+ obj.ma_id +"</td>";
							str += "<td>"+ obj.ma_name +"</td>";
							str += "<td>"+ obj.unit_cost +"</td>";
							str += "<td>"+ obj.ma_qty +"</td>";
							str += "<td><input type='text' id='order_qty' name='order_qty' value="+ obj.order_qty +"></td>";
							str += "<td><input type='text' id='order_sum' name='order_sum' value="+ obj.order_sum +"></td>";
							str += "<td><input type='text' id='order_vat' name='order_vat' value="+ obj.order_vat +"></td>";
							str += "<td>"+getToday()+"</td>";
							str += "<td>"+orderToday()+"</td>";
							str += "<td>"+inToday()+"</td>";
							str += "<td>"+ obj.whs_id +"</td>";
							str += "<td>"+ obj.emp_name +"</td>";
							// 담당직원 세션에 저장된 아이디 들고오기
							str += "</tr>";			
							$('table').prepend(str);
						});
					},
					error: function() {
						alert("error");
					}
					
				}); //ajax	
				
			}); // function(i)
	   }
					// 2-2. '저장' 클릭 
					$('.update').click(function(){
						$('.modify').addClass('true');
						var order_id = tdArr[0];
						var order_qty = $('#order_qty').val();
						var order_sum = $('#order_sum').val();
						var order_vat = $('#order_vat').val();
						var order_date = getToday();
				        var due_date = orderToday();
				        var in_date = inToday;
									
						if(order_id==="" || order_vat==="" ) {
// 							alert("모든 order_qty 입력해주세요.");
							Swal.fire({
								icon: 'warning',
								text: '빈 칸을 입력해주세요.',
								confirmButtonColor: '#0ddbb9',
								confirmButtonText: '확인',
							}).then((result) => {
								if(result.isConfirmed){
									return false;
								}
							}); // then(result)
						} else {
							$.ajax({
								url: "modify",
								type: "post",
								dataType : "json",
								contentType : "application/json;charset=UTF-8",
								data: JSON.stringify({ 
									    order_id:order_id,
									    order_qty:order_qty,
									    order_vat:order_vat,
									    order_sum:order_sum,
									    order_date:order_date,
									    in_date:in_date,
									    due_date:due_date
							   }),
								success: function() {
// 									alert("발주코드 " + order_id + ", 수정이 완료되었습니다. @success@" );
// 									location.href="/purchasing/order/list";
									alert("order/list.jsp line 460 체크!!!");
								},
								error: function() {
									location.href="/purchasing/order/list";
									Swal.fire({
										icon: 'success',
										title: '발주번호 ' + order_id,
										text: '발주수정이 완료되었습니다.',
										confirmButtonColor: '#0ddbb9',
										confirmButtonText: '확인',
									}).then((result) => {
										if(result.isConfirmed){
											location.href="/purchasing/order/list";
										}
									}); // then(result)
						    	}
				  			 }); //ajax		
				
				} // if-else
					
			}); // update.click
			
	}); // modify.click
	
	// 3-1. '삭제' 클릭
	$('#delete').click(function(){ 
			
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져옴
		checkbox.each(function(i) {

			// checkbox.parent()          : checkbox의 부모는 <td>
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			var order_id = td.eq(1).text();
			tdArr.push(order_id);	// tdArr[0]
          console.log(order_id);
		}); // function(i)
		
	
		// 3-2. 체크된 데이터 컨트롤러 전달
		var order_id = tdArr[0];
		
		$.ajax({
			url: "delete",
			type: "post",
			data: { order_id:order_id },
			success: function() {
				Swal.fire({
					text: '발주번호 ' + order_id + ', 정말 삭제하시겠습니까?',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#0ddbb9',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						Swal.fire({
							icon: 'success',
							title: '완료',
							text: '발주번호 ' + order_id + ', 삭제가 완료되었습니다.',
							confirmButtonColor: '#0ddbb9',
							confirmButtonText: '확인',
						}).then((result) => {
							if(result.isConfirmed){
								location.href="/purchasing/order/list";
							}
						}); // then(result) 삭제하시겠습니까?
					}
				}); // then(result) 삭제가 완료되었습니다
			},
			error: function() {
				Swal.fire({
					icon: 'warning',
					text: '삭제할 항목을 선택해주세요.',
					confirmButtonColor: '#0ddbb9',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.isConfirmed){
						return false;
					}
				}); // then(result)
			}
	    }); //ajax		
	
	}); // deleteForm.click
	
 }); // jQuery
</script>
<style type="text/css">
table {width: 100%;
/* table-layout:fixed;  */}


 
/* table tr>th:nth-of-type(1) {width:50px !important;
}
  */
table tr>td:nth-of-type(1) {width:50px !important;
}

 table input {width:7em;}
 table input[type:checkbox] {width:1em;}
</style>
</head>
<body>
<br>


<!-- 리스트 형식 -->
<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="main-panel">
				<div class="content-wrapper d-flex align-items-center auth px-0"
					style="min-height: 100vh;">
					<div class="row w-100 mx-0">
						<div class="col-lg-12 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5"
								style="height: 1000px;">



								<h1 class="card-title">
										<font style="vertical-align: inherit;"><a href="http://localhost:8088/purchasing/order/list" style="text-decoration:none;" >발주 리스트</a></font>
									</h1>
									<div>
									<!-- 탭 메뉴 -->
									<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
									<li class="nav-item">
									<a class="nav-link ps-2 pe-2 active" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="true">발주현황</a>
									</li>
									<li class="nav-item">
									<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">발주등록</a>
									</li>
									</ul>
									<!-- 탭 내용 -->
									<div class="tab-content tab-no-active-fill-tab-content">
									<div class="tab-pane fade active show" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
								    <!-- 검색 기능 -->
									<form action="/purchasing/order/list" method="get" style="display: inline;">
										<select name="selector">
											<option value="ma_name">자재명</option>
											<option value="order_date">발주일자</option>
											<option value="in_date">입고일자</option>
										</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
										<input type="submit"  class="btn btn-info" value="검색">
									</form>
								 <fmt:formatDate value=""/>
								 <div class="row" > 
								<table border="1" id="example-table-3" class="table table-bordered table-hover text-center tbl" style="width: 100%;">
										    <thead>
											<tr>
											    <th></th>
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
											</thead>
											<tbody id="tbody">
											<c:forEach var="order" items="${OrderLists}">
											 	<tr>
											 	    <td><input type="checkbox" name="check"></td>
												    <td>${order.order_id}</td>
													<td>${order.ma_id}</td>
													<td>${order.ma_name}</td> 
													<td>${order.unit_cost}</td>
													<td>${order.add_order}</td>					
													<td>${order.order_qty}</td>
													<td>${order.order_sum}</td>
													<td>${order.order_vat}</td>
													<td>${order.order_date}</td>
													<td>${order.due_date}</td>
													<td>${order.in_date}</td>		
													<td>${order.whs_id}</td>
													<td>${order.emp_name}</td>
												</tr> 
											</c:forEach>
											</tbody>
										</table>
										
								 </div>
								 
								 <!-- 	페이징 처리  -->
									<div class="template-demo">
										<div class="btn-group" role="group" aria-label="Basic example">
											<c:if test="${pvo.startPage > pvo.pageBlock }">
												<a href="/purchasing/order/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
											</c:if>
											
											<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
												<a href="/purchasing/order/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
											</c:forEach>
											
											<c:if test="${pvo.endPage<pvo.pageCount }">
												<a href="/purchasing/order/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
											</c:if>
										</div>
									</div>
								<!-- 	페이징 처리  -->
								   </div>
								   
								   <!-- 탭기능 2번쨰  -->
								   <div class="tab-pane fade show" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
								    <!-- 검색 기능 -->
									<form action="/purchasing/order/list" method="get" style="display: inline;">
										<select name="selector">
											<option value="ma_name">자재명</option>
											<option value="order_date">발주일자</option>
											<option value="in_date">입고일자</option>
										</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
										<input type="submit"  class="btn btn-info" value="검색">
									</form>
								<!-- 버튼 -->
								    <c:if test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
									   <div style=float:right;>   
								    <button class="btn btn-info writeForm true" >등록</button>
									<button class="btn btn-info modify true">수정</button>
									<button class="btn btn-info" id="delete">삭제</button>
									<button class="btn btn-success insert update write">저장</button>
									   </div>
								    </c:if>
								 <fmt:formatDate value=""/>
								 <div class="row" > 
								<table border="1" id="example-table-3" class="table table-bordered table-hover text-center tbl" style="width: 100%;">
										    <thead>
											<tr>
											    <th></th>
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
											</thead>
											<tbody id="tbody">
											<c:forEach var="order" items="${OrderLists}">
											 	<tr>
											 	    <td><input type="checkbox" name="check"></td>
												    <td>${order.order_id}</td>
													<td>${order.ma_id}</td>
													<td>${order.ma_name}</td> 
													<td>${order.unit_cost}</td>
													<td>${order.add_order}</td>					
													<td>${order.order_qty}</td>
													<td>${order.order_sum}</td>
													<td>${order.order_vat}</td>
													<td>${order.order_date}</td>
													<td>${order.due_date}</td>
													<td>${order.in_date}</td>		
													<td>${order.whs_id}</td>
													<td>${order.emp_name}</td>
												</tr> 
											</c:forEach>
											</tbody>
										</table>
										
								 </div>
								 
								 <!-- 	페이징 처리  -->
									<div class="template-demo">
										<div class="btn-group" role="group" aria-label="Basic example">
											<c:if test="${pvo.startPage > pvo.pageBlock }">
												<a href="/purchasing/order/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
											</c:if>
											
											<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
												<a href="/purchasing/order/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
											</c:forEach>
											
											<c:if test="${pvo.endPage<pvo.pageCount }">
												<a href="/purchasing/order/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
											</c:if>
										</div>
									</div>
								<!-- 	페이징 처리  -->
								     </div>
								   </div>
								 </div>
								 
								 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>			
					 
 <%@ include file="../../includes/footer.jsp" %>
 
</body>
</html>
