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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<title>공병 관리</title>
<style type="text/css">

.btn-success:disabled {
	opacity: 0.6;
  	cursor: not-allowed;
}
</style>

</head>
<body>
	<!-- 전체수량 - 불량수량하기 -->
	<script>
		
		$(document).ready(function() {
			////// 오늘의 공병 수량 insert //////
			$("#btInsertBT").click(function() {
// 				alert("제이쿼리 실행");
				var bt_date = $("#bt_date").val();
// 				alert(bt_date);
				var bt_qty = $("#be_bt_qty").val();
// 				alert(bt_qty);
				var bt_emp = $("#bt_emp").val();
// 				alert(bt_emp);
				if (!$('#be_bt_qty').val()) {
					Swal.fire({
						icon: 'error',
						title: '공병 개수를 입력해 주세요!',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인'
					});
				}else{
				Swal.fire({
					   title: '등록하시겠습니까?',
					   text: '등록수량 : '+bt_qty+'개',
					   icon: 'warning',
					   showCancelButton: true,
					   confirmButtonColor: '#3085d6', 
					   cancelButtonColor: '#d33', 
					   confirmButtonText: '승인', 
					   cancelButtonText: '취소'
					}).then(result => {
						if (result.isConfirmed) {
					        $.ajax({
					          url : '/quality/btInsert',
					          type : 'POST',
					          data : {  
					        	  bt_date : bt_date,
					        	  bt_qty : bt_qty,
					        	  bt_emp : bt_emp },
					          success: function(response) {
					        	  Swal.fire({
										icon: 'success',
										title: '등록 완료',
										text: '확인을 누르면 창을 닫습니다.',
										confirmButtonColor: '#0ddbb9',
										confirmButtonText: '확인'
									}).then(() => {
										window.location.reload();
										}); // Swal2
						   			} // success
							}); //ajax
						  } // if
					}); //result
				}
			}); //click
		}); //document.ready
		////// 오늘의 공병 수량 insert //////
	</script>
	<!-- 불량 등록 버튼 동작 -->
	<script>
		$(document).ready(function() {
			$(".btDefBT").click(function() {
				var bt_date = $(this).data("bt_date");
// 				alert(bt_date);
				var bt_defQty = $(this).closest("tr").find(".bt_defQty").val();
				var bt_qty = $(this).closest("tr").find(".bt_qty").val();
				if (!bt_defQty) {
					Swal.fire({
						icon: 'error',
						title: '불량 개수를 입력해 주세요!',
						confirmButtonColor: '#0ddbb9',
						confirmButtonText: '확인'
					});
				}else{
				Swal.fire({
					   title: '등록하시겠습니까?',
					   text: '등록수량 : '+bt_defQty+'개',
					   icon: 'warning',
					   showCancelButton: true,
					   confirmButtonColor: '#3085d6', 
					   cancelButtonColor: '#d33', 
					   confirmButtonText: '승인', 
					   cancelButtonText: '취소'
					}).then(result => {
						if (result.isConfirmed) {
					        $.ajax({
					          url : '/quality/btUpdate',
					          type : 'POST',
					          data : {  
					        	  bt_date : bt_date,
					        	  bt_defQty : bt_defQty,
					        	  bt_qty : bt_qty },
					          success: function(response) {
					        	  Swal.fire({
										icon: 'success',
										title: '등록 완료',
										text: '확인을 누르면 창을 닫습니다.',
										confirmButtonColor: '#0ddbb9',
										confirmButtonText: '확인'
									}).then(() => {
										window.location.reload();
										}); // Swal2
						   			} // success
							}); //ajax
						  } // if
					}); //result
				}
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
// 				$("#be_bt_qty").hide();
// 				$("#btInsertBT").hide();
				$("#hideInsert").hide();

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
								
<!-- 									<h1>공병 관리</h1> -->
									<h1 class="card-title">
<!-- 									<font style="vertical-align: inherit;"> -->
										<a href="/quality/emptyBottle" style="text-decoration: none; color: #000;">
											공병 관리
										</a>
<!-- 									</font> -->
								</h1>
									<div style="display: flex; justify-content: space-between;">
									<form action="/quality/emptyBottle" method="get">
										<select class="EBTsearch_select" name="selector">
											<option value="bt_date">공병등록일자</option>
											<option value="bt_status">검수상태</option>
											<option value="emp_name">검수자</option>
										</select>
										<input type="text" name="search" class="form-control" style="width:250px; display:inline;" placeholder="검색어를 입력해주세요" maxlength="15">	
										<button type="submit" class="btn btn-info">검색</button>
									</form>
									

										<div id="btInsert">
										<c:set var="today" value="<%=new Date()%>" />
										<fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd" />
										<input type="hidden" id="bt_date" value="${today2}"name="bt_date"> 
										<input type="hidden" id="bt_emp" name="bt_emp" value="${sessionScope.emp_id}"> 
										
										<c:forEach items="${bottleList}" var="vo" varStatus="index">
											<c:if test="${vo.bt_date eq today2}">
											입고 수량 <input type="text"id="be_bt_qty" name="bt_qty" class="form-control" style="width:250px; display:inline;" placeholder="오늘건 등록 완료되었습니다" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="15"> 
											<span style="opacity: 0.6; cursor: not-allowed;"><input type="button" class="btn btn-info" id="btInsertBT2" disabled="disabled" value="등록"></span>
											</c:if>
										</c:forEach>
										
										<div id="hideInsert">
										입고 수량 <input type="text"id="be_bt_qty" name="bt_qty" class="form-control" style="width:250px; display:inline;" placeholder="공병 개수를 입력해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="15"> 
										<input type="button" class="btn btn-info" id="btInsertBT" value="등록">
										</div>
									</div>
									</div>
									<!-- 	</form> -->

									<div class="bottleList">
										<table border="1" class="table table-hover table-bordered text-center">
											<thead>
												<tr>
													<th>공병등록일자</th>
													<th>담당자</th>
													<th>입고수량</th>
													<th>검수상태</th>
													<th>불량수량</th>
													<th>실수량</th>
													<th>불량률</th>
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
														<td>${vo.emp_name}</td>
														<td><input type="hidden" class="bt_qty" value="${vo.bt_qty}">${vo.bt_qty}</td>
														<td>${vo.bt_status}</td>
														<td>
														<c:choose>
														<c:when test="${vo.bt_status == '대기'}"><input type="text" class="bt_defQty" value="" style="width:80px;" placeholder="불량 수량" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="15">
														</c:when>
														<c:otherwise>${vo.bt_defQty}</c:otherwise>
														</c:choose>
														</td>
														<td><input type="hidden" class="bt_defQty" value="${vo.bt_defQty}">
														<c:choose>
															<c:when test="${vo.bt_status == '대기'}">
															미등록
															</c:when>
															<c:otherwise>
															${vo.bt_qty-vo.bt_defQty}
															</c:otherwise>
														</c:choose>
														</td>
														<!-- 이미 등록한 날짜의 불량수량은 다시 등록할 수 없게 버튼 제어 -->
<%-- 														<c:if test="${vo.bt_status == '대기'}"> --%>
<%-- 															<td><input type="button" class="btDefBT" id="btDefBT" value="불량등록" data-bt_date="${vo.bt_date}"></td> --%>
<%-- 														</c:if> --%>
														<td>
														<c:choose>
															<c:when test="${(vo.bt_defQty/vo.bt_qty)*100 > 2.9999 }">
																<span style="color: red;">
																	<fmt:formatNumber value="${(vo.bt_defQty/vo.bt_qty)*100}" pattern="#.###"/>%
																</span>
															</c:when>
															<c:when test="${vo.bt_status == '대기'}">
															미등록
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${(vo.bt_defQty/vo.bt_qty)*100}" pattern="#.###"/>%
															</c:otherwise>
														</c:choose>
														<td>
														<c:choose>
														<c:when test="${vo.bt_status == '대기'}">
															<input type="button" class="btn btn-success btDefBT" id="btDefBT" value="불량 등록" data-bt_date="${vo.bt_date}">
														</c:when>
														<c:otherwise>
															<span style="opacity: 0.6; cursor: not-allowed;">
															<input type="button" class="btn btn-success" id="btDefBT" value="등록 완료" data-bt_date="${vo.bt_date}" disabled="true"  >
															</span>
														</c:otherwise>
														</c:choose>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/quality/emptyBottle?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/quality/emptyBottle?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/quality/emptyBottle?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
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
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
