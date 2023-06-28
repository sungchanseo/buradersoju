<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../includes/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	/* 인쇄하기 가로 기본출력 지정 */
		@page { size: A4 landscape; margin:0; }
	</style>

</head>
<body>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
							
								<div class="form-group">
	<h1>작업지시 현황</h1>
	
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
	<br>
	<button class="btn btn-success btn-fw">엑셀파일</button>
	<button class="print-button" onclick="info_print()">인쇄하기</button>
	
  <table class="table table-color">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>작업지시일시</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
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
	  <td>${workOrderList.production_emp}</td>
	  <td>${workOrderList.production_date}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.production_status}</td>
	 </tr>
	</c:forEach>
  </table>

<script type="text/javascript">

/* 등록 버튼 팝업 */
function openPopup() {
	window.open('./workOrderInsert', 'workOrderPopup', 'width=800, height=500, left=2000');
}


/* 인쇄 버튼 기능 */
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
									</div>
								<button class="btn btn-success btn-fw" type="submit">
									등록</button>
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