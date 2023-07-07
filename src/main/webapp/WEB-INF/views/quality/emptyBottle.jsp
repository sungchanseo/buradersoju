<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../includes/header.jsp"%>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>공병 관리</title>

</head>
<body>
	<!-- 전체수량 - 불량수량하기 -->
	<script>
		
		$(document).ready(function() {

			////// 오늘의 공병 수량 insert //////
			$("#btInsertBT").click(function() {
// 				alert("제이쿼리 실행");
				var bt_date = $("#bt_date").val();
				alert(bt_date);
				var bt_qty = $("#be_bt_qty").val();
				alert(bt_qty);

				const form = $('<form>', {
					method : 'post',
					action : 'btInsert',
					id : 'fr',
					'accept-charset' : 'utf-8'
				});

				// 파라미터 전달용 hidden 추가
				form.append($('<input>', {
					type : 'hidden',
					name : 'bt_date',
					value : bt_date
				}));

				form.append($('<input>', {
					type : 'hidden',
					name : 'bt_qty',
					value : bt_qty
				}));

				// form태그 body에 추가 후 전송
				$('body').append(form);
				form.submit();

// 					        $.ajax({
// 					          url : 'btInsert',
// 					          type : 'POST',
// 					          contentType: 'text',
// 					          data : {  
// 					        	  bt_date : $("#bt_date").val(),
// 					        	  bt_qty : $("#be_bt_qty").val()
// 					        		},
// 					          dataType: 'text',
// 					          success: function(response) {
// 					    	  alert("에이젝스 성공");
// 					        	  console.log(response);
// 					              var vo = response.vo;
// 						          },
// 						          error : function(e){
// 				    	     	  alert("에이젝스 실패");
// 					        	  console.log(e);
// 						          }
// 							}); //ajax
			}); //click
		}); //document.ready
		////// 오늘의 공병 수량 insert //////
	</script>
	<!-- 불량 등록 버튼 동작 -->
	<script>
		$(document).ready(function() {
			$("#btDefBT").click(function() {
				var bt_date = $(this).data("bt_date");
// 				alert(bt_date);
				var bt_defQty = $(this).closest("tr").find(".bt_defQty").val();
				var bt_qty = $(this).closest("tr").find(".bt_qty").val();
// 				alert(bt_defQty);
				// form 태그 동적 생성
				const form = $('<form>', {
					method : 'post',
					action : 'btUpdate',
					'accept-charset' : 'utf-8'
				});

				// 파라미터 전달용 hidden 추가
				form.append($('<input>', {
					type : 'hidden',
					name : 'bt_date',
					value : bt_date
				}));

				form.append($('<input>', {
					type : 'hidden',
					name : 'bt_defQty',
					value : bt_defQty
				}));
				
				form.append($('<input>', {
					type : 'hidden',
					name : 'bt_qty',
					value : bt_qty
				}));

				// form태그 body에 추가 후 전송
				$('body').append(form);
				form.submit();

				alert("불량 등록 완료");
			});
		});
		////// 현재 날짜에 이미 등록된 경우 등록 관련 btInsert div가 감춰짐 //////
		$(document).ready(function() {
			var btDateList = [];
			$(".bt_datecal").each(function() {
				btDateList.push($(this).val());
			});
			console.log("btDateList:"+btDateList);
			var today2 = $("#bt_date").val();
			console.log("today2:" + today2)
			var count = 0;
			for (var i = 0; i < btDateList.length; i++) {
				var voBtDate = btDateList[i];
				console.log("voBtDate:" + voBtDate)
				if (voBtDate == today2) {
					count += 1;
				}
			}
			console.log("count : " + count);
			if (count == 1) {
				$("#btInsert").hide();
			}
		});
		////// 현재 날짜에 이미 등록된 경우 등록 관련 btInsert div가 감춰짐 //////
		
	
	</script>
	<div class="container-scroller">

		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="main-panel">
				<div class="content-wrapper d-flex align-items-center auth px-0">
					<div class="row w-100 mx-0">
						<div class="col-lg-12 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5"
								style="height: 1000px;">
								<div class="form-group">
								
									<h1>공병 관리</h1>

									<!-- 	<form action="btInsert" method="POST"> -->
									<div id="btInsert">
										<c:set var="today" value="<%=new Date()%>" />
										<fmt:formatDate var="today2" value="${today }" pattern="yyyy-MM-dd" />
										<input type="hidden" id="bt_date" value="${today2 }"name="bt_date"> 
										당일 입고된 공병 수량 <input type="text"id="be_bt_qty" name="bt_qty"> 
										<input type="button" id="btInsertBT" value="등록">
									</div>
									<!-- 	</form> -->

									<div class="bottleList">
										<table class="table table-color">
											<thead>
												<tr>
													<th>공병등록일자</th>
													<th>입고량</th>
													<th>불량수량</th>
													<th>실수량</th>
													<th>등록</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vo" items="${bottleList}" varStatus="status">
													<tr>
														<td>${vo.bt_date}
														<input type="hidden" class="bt_datecal" value="${vo.bt_date}"> 
															<%-- <fmt:formatDate value="${vo.bt_date}" pattern="yyyy-MM-dd"/> --%>
														</td>
														<td><input type="hidden" class="bt_qty" value="${vo.bt_qty}">${vo.bt_qty}</td>
														<td><input type="text" class="bt_defQty" value="${vo.bt_defQty}"></td>
														<td><input type="hidden" class="bt_defQty" value="${vo.bt_defQty}">
														<!-- 이미 등록한 날짜의 불량수량은 다시 등록할 수 없게 버튼 제어 -->
															${vo.bt_qty-vo.bt_defQty}</td>
														<c:if test="${vo.bt_defQty == ''}">
															<td><input type="button" class="btDefBT" id="btDefBT" value="불량등록" data-bt_date="${vo.bt_date}"></td>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
