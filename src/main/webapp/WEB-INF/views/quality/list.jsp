<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
	<style type="text/css">
	/* 인쇄하기 가로 기본출력 지정 */
		@page { size: A4 landscape; margin:0; }
		
	/* 엑셀, 인쇄 버튼 배치 */
	.button-group {
	  width: 170px;
	  height: 35px;
	  display: flex;
	  gap: 5px; /* 버튼 사이 간격 */
	  float: right; /* 오른쪽으로 배치 */
	  margin-top: 10px; /* 위 여백 추가 */
  	  margin-bottom: 10px; /* 아래 여백 추가 */
	}
	.button-group button {
	  flex: 1; /* 버튼들을 동일한 너비로 설정 */
	}
	</style>
	<!-- (수정중) 생산 목록 중 ‘생산량 >= 수주량’ => 작업상태가 완료인 작업지시만 나타남 -->
	<!-- 페이징 처리에서 완료됨 -->
	<script>
// 	$(function(){
// 		var production_status = $('#production_status').val();
// 		var state0 = "대기";
// 		var state1 = "진행중";
// 		console.log(production_status);
		
// 		if( production_status == state0 || production_status == state1){
// 			$(".qualityListResult").hide();
// 		}
// 		});
	</script>
	
	<!-- 등록 버튼 보이기 제어 -->
	<script>
// 		$(function(){
// 			var emp_id = $('#emp_id').val();
// 			console.log(emp_id);
			
// 			if(emp_id != "2023001"){
// 				$("#qualityInsertBT").hide();
// 			}
// 			});
	</script>
	
	
<title>품질 관리 목록</title>
</head>
<body>
<%@ include file="../includes/header.jsp"%>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
							<form role="form" method="post">
								<div class="form-group">
	<h1>품질 관리 현황</h1>
	<input type="hidden" id="emp_id" name="emp_id" value=" ${sessionScope.emp_id}">
	
<%-- 	${productionList } --%>
	
	<!-- 검색 -->
	<div class="Qusearch">
	<form name="QuCategory" action="/quality/qualityList" method="get">
	<select class="Qusearch_select" name="selector">
		<option value="검수번호">검수번호</option>
		<option value="작업지시번호">작업지시번호</option>
		<option value="생산라인">생산라인</option>
		<option value="검수자">검수자</option>
		<option value="검수완료일">검수완료일</option>
	</select>
	<input type="text" class="Qusearch_input" name="searchName">	
	<button type="submit">검색</button>
	</form>
	</div>
	
	<!-- 관리자에게만 보이는 검수등록 버튼 -->
	<input type="button" id="qualityInsertBT" class="btn btn-success" value="검수 등록"
		onclick="window.open('/quality/insert', '_blank', 'width=600, height=500, left=2000');">
	<button class="btn btn-success btn-fw" style='text-align: right; float: right;'>엑셀파일</button>
	<button id="print-button" class="btn btn-success" onclick="info_print()" style='text-align: right; float: right;'>인쇄하기</button>
		<script>
			/* 인쇄하기 버튼 */
			function info_print() {
			  let initBody = document.body;
			  let hiddenBtn = document.querySelector('.print-button'); 
			  let hiddenHeader = document.querySelector('#header');
			  let hiddenNavbar = document.querySelector('.navbar-device');
			  let hiddenClearfix = document.querySelector('.clearfix');
			 
			  window.onbeforeprint = function () {
			    hiddenBtn.style.display = "none";
			    hiddenHeader.style.display = "none";
			    hiddenNavbar.style.display = "none";
			    hiddenClearfix.style.display = "none";
			    document.body = document.querySelector('.main-container');
			  }
			  window.onafterprint = function () {
			    hiddenBtn.style.display = "block";
			    hiddenHeader.style.display = "block";
			    hiddenNavbar.style.display = "block";
			    hiddenClearfix.style.display = "block";
			    document.body = initBody;
			  }
			  window.print();
			} 
		</script>
	<!-- 품질관리현황표 출력 -->
	<div class="qualityList">
<%-- 	${productionList } --%>
	<table class="table table-color">
	
		<thead>
			<tr>
				<th>검수번호</th>
				<th>작업지시번호</th>
				<th>생산라인</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>생산량</th>
				<th>검수량</th>
				<th>불량수량</th>
				<th>불량률</th>
				<th>검수자</th>
				<th>검수완료일시</th>
<!-- 				<th>검수상태</th> -->
			</tr>
		</thead>
		<tbody>	            
			<c:forEach var="vo" items="${qualityList }">
				<!-- 나중에 불필요한거 정리할 예정 -->
				<input type="hidden" id="production_qty" name="production_qty" value=" ${vo.production_qty}">
				<input type="hidden" id="plan_qty" name="plan_qty" value=" ${vo.plan_qty}">
				<input type="hidden" id="production_status" name="production_status" value=" ${vo.production_status}">
			<tr class="qualityListResult">
				<td><a href="/quality/info?qc_num=${vo.qc_num }" onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">${vo.qc_num}</a></td>
				<td><a href="/production/workOrder/workOrder?production_id=${vo.production_id }" onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">${vo.production_id }</a></td>
				<td>${vo.production_line }</td>
				<td>${vo.product_id }</td>
				<td>${vo.product_name }</td>
				<td>${vo.production_qty }</td>
				<td>${vo.qc_qty }</td>
				<td>${vo.def_qty }</td>
				<td><fmt:formatNumber value="${(vo.def_qty /vo.qc_qty*100) }" pattern="#.###"/></td>
				<td>${vo.emp_name }</td>
				<td><fmt:formatDate value="${vo.qc_date }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
<%-- 				<td>${vo.qc_status }</td> --%>
			</tr>
			</c:forEach>
	</tbody>
	</table>
	</div>
	<!-- 	페이징 처리  -->
<%-- 	<c:if test="${pvo.startPage > pvo.pageBlock }"> --%>
<%-- 		<a href="/quality/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">이전</a> --%>
<%-- 	</c:if> --%>

<%-- 	<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1"> --%>
<%-- 		<a href="/quality/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}">${i }</a> --%>
<%-- 	</c:forEach> --%>

<%-- 	<c:if test="${pvo.endPage<pvo.pageCount }"> --%>
<%-- 		<a href="/quality/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">다음</a> --%>
<%-- 	</c:if> --%>
	<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/quality/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/quality/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/quality/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	</div>
<!-- 								<button class="btn btn-success btn-fw" type="submit"> -->
<!-- 									등록</button> -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>