<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../includes/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>
<script type="text/javascript">

/* 등록 버튼 팝업 */
function openPopup() {
	window.open('./workOrderInsert', 'workOrderPopup', 'width=800, height=500, left=2000');
}
/* 인쇄 버튼 기능 */
function info_print() {
	window.print();
} 

/* 인쇄 버튼 기능 */
// function info_print() {
//   let initBody = document.body;
//   let hiddenBtn = document.querySelector('.print-button'); 
//   let hiddenHeader = document.querySelector('#header');
//   let hiddenNavbar = document.querySelector('.navbar-device');
//   let hiddenClearfix = document.querySelector('.clearfix');
 
//   window.onbeforeprint = function () {
//     hiddenBtn.style.display = "none";
//     hiddenHeader.style.display = "none";
//     hiddenNavbar.style.display = "none";
//     hiddenClearfix.style.display = "none";
//     document.body = document.querySelector('.main-container');
//   }
//   window.onafterprint = function () {
//     hiddenBtn.style.display = "block";
//     hiddenHeader.style.display = "block";
//     hiddenNavbar.style.display = "block";
//     hiddenClearfix.style.display = "block";
//     document.body = initBody;
//   }
//   window.print();
// } 
</script>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
								<div class="form-group">
								<!-- CSS 기본 틀 -->
								<h1>작업지시 현황</h1>
								<!-- 탭 메뉴 -->
	<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2 active" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="true">전체</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">대기</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage3-tab" data-bs-toggle="tab" href="#stage3" role="tab" aria-controls="stage3" aria-selected="false">진행중</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage4-tab" data-bs-toggle="tab" href="#stage4" role="tab" aria-controls="stage4" aria-selected="false">완료</a>
	</li>
	</ul>
	<!-- 탭 내용 -->
	<div class="tab-content tab-no-active-fill-tab-content">
	<div class="tab-pane fade active show" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
	
<!-- 검색창 기능 -->
  <form action="/production/workOrderList" method="get">   
    <label>검색</label><br>
	  <select name="listSelector">
	    <option value="production_id">작업지시번호</option>
	    <option value="cont_id">수주번호</option>
	    <option value="production_date">작업지시일시</option>
	    <option value="production_line">생산라인</option>
	  </select>
	  <input type="text" name="search" placeholder="">
	  <input type="submit" class="btn btn-success btn-fw" value="검색">
  </form>
  
	<input type="button" class="btn btn-success btn-fw" value="생산 등록" onclick="openPopup();">
<!-- 	<br> -->
	<button class="btn btn-success btn-fw" style='text-align: right; float: right;'>엑셀파일</button>
	<button id="print-button" class="btn btn-success" onclick="info_print()" style='text-align: right; float: right;'>인쇄하기</button>
	
  <table class="table table-color">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	  <th>작업지시일시</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>
		<a href="./workOrder?production_id=${workOrderList.production_id}"
		onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
		${workOrderList.production_id}
		</a>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${workOrderList.cont_id }"
	  	onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
	  	${workOrderList.cont_id}
	  	</a>
	  </td>	  
	  <td>${workOrderList.emp_name}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.workOrder_status}</td>
	  <td><fmt:formatDate value="${workOrderList.production_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	 </tr>
	</c:forEach>
  </table>
	<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/production/workOrder/workOrderList?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	</div>
	<!-- 탭기능 2번쨰  -->
   <div class="tab-pane fade show" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
   <!-- 검색창 기능 -->
  <form action="/production/workOrderList" method="get">   
    <label>검색</label><br>
	  <select name="listSelector">
	    <option value="production_id">작업지시번호</option>
	    <option value="cont_id">수주번호</option>
	    <option value="production_date">작업지시일시</option>
	    <option value="production_line">생산라인</option>
	  </select>
	  <input type="text" name="search" placeholder="">
	  <input type="submit" class="btn btn-success btn-fw" value="검색">
  </form>
  
	<input type="button" class="btn btn-success btn-fw" value="생산 등록" onclick="openPopup();">
<!-- 	<br> -->
	<button class="btn btn-success btn-fw" style='text-align: right; float: right;'>엑셀파일</button>
	<button class="print-button" onclick="info_print()" style='text-align: right; float: right;'>인쇄하기</button>
	
  <table class="table table-color">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	  <th>작업지시일시</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>
		<a href="./workOrder?production_id=${workOrderList.production_id}"
		onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
		${workOrderList.production_id}
		</a>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${workOrderList.cont_id }"
	  	onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
	  	${workOrderList.cont_id}
	  	</a>
	  </td>	  
	  <td>${workOrderList.emp_name}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.workOrder_status}</td>
	  <td><fmt:formatDate value="${workOrderList.production_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	 </tr>
	</c:forEach>
  </table>
   <!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/production/workOrder/workOrderList?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	</div>
	<!-- 탭기능 3번쨰  -->
   <div class="tab-pane fade show" id="stage3" role="tabpanel" aria-labelledby="stage3-tab">
   <!-- 검색창 기능 -->
  <form action="/production/workOrderList" method="get">   
    <label>검색</label><br>
	  <select name="listSelector">
	    <option value="production_id">작업지시번호</option>
	    <option value="cont_id">수주번호</option>
	    <option value="production_date">작업지시일시</option>
	    <option value="production_line">생산라인</option>
	  </select>
	  <input type="text" name="search" placeholder="">
	  <input type="submit" class="btn btn-success btn-fw" value="검색">
  </form>
  
	<input type="button" class="btn btn-success btn-fw" value="생산 등록" onclick="openPopup();">
<!-- 	<br> -->
	<button class="btn btn-success btn-fw" style='text-align: right; float: right;'>엑셀파일</button>
	<button class="print-button" onclick="info_print()" style='text-align: right; float: right;'>인쇄하기</button>
	
  <table class="table table-color">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	  <th>작업지시일시</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>
		<a href="./workOrder?production_id=${workOrderList.production_id}"
		onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
		${workOrderList.production_id}
		</a>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${workOrderList.cont_id }"
	  	onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
	  	${workOrderList.cont_id}
	  	</a>
	  </td>	  
	  <td>${workOrderList.emp_name}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.workOrder_status}</td>
	  <td><fmt:formatDate value="${workOrderList.production_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	 </tr>
	</c:forEach>
  </table>
   <!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/production/workOrder/workOrderList?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	</div>
	<!-- 탭기능 4번쨰  -->
   <div class="tab-pane fade show" id="stage4" role="tabpanel" aria-labelledby="stage4-tab">
   <!-- 검색창 기능 -->
  <form action="/production/workOrderList" method="get">   
    <label>검색</label><br>
	  <select name="listSelector">
	    <option value="production_id">작업지시번호</option>
	    <option value="cont_id">수주번호</option>
	    <option value="production_date">작업지시일시</option>
	    <option value="production_line">생산라인</option>
	  </select>
	  <input type="text" name="search" placeholder="">
	  <input type="submit" class="btn btn-success btn-fw" value="검색">
  </form>
  
	<input type="button" class="btn btn-success btn-fw" value="생산 등록" onclick="openPopup();">
<!-- 	<br> -->
	<button class="btn btn-success btn-fw" style='text-align: right; float: right;'>엑셀파일</button>
	<button class="print-button" onclick="info_print()" style='text-align: right; float: right;'>인쇄하기</button>
	
  <table class="table table-color">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	  <th>작업지시일시</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>
		<a href="./workOrder?production_id=${workOrderList.production_id}"
		onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
		${workOrderList.production_id}
		</a>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${workOrderList.cont_id }"
	  	onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
	  	${workOrderList.cont_id}
	  	</a>
	  </td>	  
	  <td>${workOrderList.emp_name}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.workOrder_status}</td>
	  <td><fmt:formatDate value="${workOrderList.production_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	 </tr>
	</c:forEach>
  </table>
   <!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/production/workOrder/workOrderList?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/production/workOrder/workOrderList?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	
	 </div>
   </div>
 </div>
									<!-- CSS 기본 틀 -->
									</div>
<!-- 								<button class="btn btn-success btn-fw" type="submit"> -->
<!-- 									등록</button> -->
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