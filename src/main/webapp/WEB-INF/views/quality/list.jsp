<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	
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
<!-- 	<div class="Qusearch"> -->
<!-- 	<form action="/purchasing/inMaterial/list" method="get" style="display: inline;"> -->
<!-- 								<select name="selector"> -->
<!-- 									<option value="ma_name">자재명</option> -->
<!-- 									<option value="in_date">입고일자</option> -->
<!-- 									<option value="in_emp">담당직원</option> -->
<!-- 								</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요"> -->
<!-- 								<input type="submit"  class="btn btn-info" value="검색"> -->
<!-- 							</form> -->
	<form action="/quality/qualityList" method="get">
	<select class="Qusearch_select" name="selector">
		<option value="qc_num">검수번호</option>
		<option value="a.production_id">작업지시번호</option>
		<option value="a.production_line">생산라인</option>
		<option value="emp_name">검수자</option>
	</select>
	<input type="text" name="search" class="form-control" style="width:250px; display:inline;" placeholder="검색어를 입력해주세요">	
	<button type="submit" class="btn btn-info">검색</button>
	</form>
<!-- 	<input type="text" class="Qusearch_input" name="searchName">	 -->
<!-- 		<option value="검수완료일">검수완료일</option> -->
<!-- 	</div> -->
	
	
	<div style="float: right;">
	<input type="button" id="qualityInsertBT" class="btn btn-success" style="margin: 1px;" value="검수 등록"
		onclick="window.open('/quality/insert', '_blank', 'width=600, height=500, left=2000');">
	<button class="btn btn-light" style='text-align: right; margin: 1px;'>엑셀파일</button>
	<button id="print-button" class="btn btn-light" onclick="info_print()" style='text-align: right; margin: 1px;'>인쇄하기</button>
	</div>
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
	<table border="1" class="table table-hover table-bordered text-center">
	
		<thead>
			<tr>
				<th>검수번호</th>
				<th>작업지시번호</th>
				<th>생산라인</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>작업지시수량</th>
				<th>검수량</th>
				<th>불량수량</th>
				<th>불량률</th>
				<th>검수자</th>
				<th>검수완료일시</th>
<!-- 				<th>검수상태</th> -->
			</tr>
		</thead>
		<tbody>	            
			<c:forEach var="vo" items="${qualityList}">
				<input type="hidden" id="production_qty" name="production_qty" value=" ${vo.production_qty}">
				<input type="hidden" id="plan_qty" name="plan_qty" value=" ${vo.plan_qty}">
				<input type="hidden" id="production_status" name="production_status" value=" ${vo.production_status}">
			<tr class="qualityListResult">
				<td><a href="/quality/info?qc_num=${vo.qc_num }" onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;"  style="color: black; text-decoration: none;">${vo.qc_num}</a></td>
				<td><a href="/production/workOrder/workOrder?production_id=${vo.production_id }" onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;"  style="color: black; text-decoration: none;">${vo.production_id }</a></td>
				<td>${vo.production_line }</td>
				<td>${vo.product_id }</td>
				<td>${vo.product_name }</td>
				<td>${vo.plan_qty }</td>
				<td>${vo.qc_qty }</td>
				<td>${vo.total_defQty }</td>
				<td><fmt:formatNumber value="${(vo.total_defQty /vo.qc_qty*100) }" pattern="#.###"/>%</td>
				<td>${vo.emp_name }</td>
				<td><fmt:formatDate value="${vo.qc_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
<%-- 				<td>${vo.qc_status }</td> --%>
			</tr>
			</c:forEach>
	</tbody>
	</table>
	</div>
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