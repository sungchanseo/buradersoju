<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<%@ include file="../includes/header.jsp"%>
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
	window.open('./insert', 'workOrderPopup', 'width=700, height=580, left=2000');
}
/* 인쇄 버튼 기능 */
function info_print() {
	window.print();
} 

</script>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
							<form role="form" method="post">
								<div class="form-group">
								<!-- CSS 기본 틀 -->
								<h1>작업지시 현황</h1>
								<br>
								<!-- 탭 메뉴 -->
	<ul class="nav nav-tabs tab-no-active-fill" >
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage1-tab" href="/workOrder/list" >전체</a>
	</li>
	<li class="nav-item">
	<a  href="/workOrder/list2" class="nav-link ps-2 pe-2" id="stage2-tab" >대기</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2 active" id="stage3-tab"  href="/workOrder/list3" >진행중</a>
	</li>
	<li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage4-tab"  href="/workOrder/list4" >완료</a>
	</li>
	</ul>
<!-- 검색창 기능 -->
  <form action="/workOrder/list3" method="get">
	  <select class="Wosearch_select" name="selector">
<!-- 	    <option value="a.workOrder_status">작업상태</option> -->
	    <option value="a.production_id">작업지시번호</option>
	    <option value="a.cont_id">수주번호</option>
	    <option value="a.production_line">생산라인</option>
	    <option value="emp_name">작업지시자</option>
	    <option value="production_date">작업지시일시</option>
	  </select>
	  <input type="text" name="search" class="form-control" style="width:250px; display:inline;" placeholder="검색어를 입력해주세요">
	  <input type="submit" class="btn btn-info" value="검색">
  </form>
  
	<div style="float:right; display:inline;">
	<c:if test="${emp_department.equals('생산') || emp_department.equals('생산팀') || emp_department.equals('Master')}">
	<button type="button" class="btn btn-success" style="margin: 1px;" onclick="openPopup();">작업 등록</button>
<!-- 	<button class="btn btn-light" style='text-align: right; margin: 1px;'>엑셀파일</button> -->
	<button id="print-button" class="btn btn-light" onclick="info_print()" style='text-align: right; margin: 1px;'>인쇄하기</button>
	</c:if>
	</div>
  <table border="1" class="table table-hover table-bordered text-center">
  <thead class="thead-light">
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
	</thead>
	<tbody class="table-group-divider">
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>
	  <span style="color: black;">
		<a href="./info?production_id=${workOrderList.production_id}" style="color: black; text-decoration: none;"
		onclick="window.open(this.href, '_blank', 'width=550, height=350'); return false;">
		${workOrderList.production_id}
		</a>
		</span>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${workOrderList.cont_id }" style="color: black; text-decoration: none;"
	  	onclick="window.open(this.href, '_blank', 'width=700, height=320'); return false;">
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
	  <td><fmt:formatDate value="${workOrderList.production_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	 </tr>
	</c:forEach>
	</tbody>
  </table>
	<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/workOrder/list3?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/workOrder/list3?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/workOrder/list3?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
		
									<!-- CSS 기본 틀 -->
									</div>
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