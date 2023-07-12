<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert 링크 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

window.onload = function() {
	// 오늘 날짜 정보
	today = new Date();
	console.log("today.toISOString() >>>" + today.toISOString());
	today = today.toISOString().slice(0, 10);
	console.log("today >>>> " + today);
	bir = document.getElementById("getToday");
	bir.value = today;
	
	// 일주일 전 날짜 정보
	thisDate = new Date();
	day = thisDate.getDay();
	calcDate = thisDate.getDate() - 7;
	beforeDate = new Date(thisDate.setDate(calcDate)).toISOString().substring(0, 10);
	console.log('beforeDate >>>>>>>>>> ' + beforeDate);
	bir2 = document.getElementById("beforeDay");
	bir2.value = beforeDate;
}


// JQuery
$(document).ready(function(){
	
	// 검색 조건 저장
	startDate = "${startDate}";
	endDate = "${endDate}";
	op_id = "${op_id}";
	product_name = "${product_name}";
	op_empName = "${op_empName}";
	op_process = $('input[name=op_process]:checked').val();
	console.log(op_process);
	
	$('#sd').val(startDate);
	$('#ed').val(endDate);
	$('#op_id').val(op_id);
	$('#product_name').val(product_name);
	$('#op_empName').val(op_empName);

});

</script>
</head>
<body>



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


								<!-- 제목 -->
								<div class="card-body">
									<h1 class="card-title">
										<font style="vertical-align: inherit;">
											<a href="/purchasing/outProduct/list" style="text-decoration: none; color: #000;">
												출고 리스트
											</a>
										</font>
									</h1>
								</div>
										
										
								<!-- 검색 기능 -->
								<div style="text-align: center; background-color: #f2f2f2;">
									<br>
								<form action="/purchasing/outProduct/list" method="get" style="display: inline;">
									<input type="radio" id="all" name="op_process" value="" checked> 전체 &nbsp;	
									<input type="radio" id="yet" name="op_process" value="미출고"> 미출고 &nbsp;	
									<input type="radio" id="done" name="op_process" value="출고완료"> 출고완료	&nbsp;
												
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp; 출고번호 
									<input type="text" id="op_id" name="op_id" value="" style="width:7%;">
									&nbsp;&nbsp;&nbsp; 출고일자 
									<input type="date" name="startDate" id="sd" value="" min="2023-01-01">
									~ 
									<input type="date" name="endDate" id="ed" value="" min="2023-01-01">
									&nbsp;&nbsp;&nbsp; 상품명 
									<input type="text" id="product_name" name="product_name" value="" style="width:7%;">
									&nbsp;&nbsp;&nbsp; 담당직원 
									<input type="text" id="op_empName" name="op_empName" value="" style="width:7%;">
									
									&nbsp;&nbsp; <input type="submit" class="btn btn-info" value="검색">
								</form>
								<br><br>
								</div>
								<br>
								
											
								<!-- 테이블 -->
								<table border="1" class="table table-hover table-bordered text-center">
									<tr>
									   <th>출고관리번호</th>
									   <th>수주관리번호</th>
									   <th>상세</th>
									   <th>납품처명</th>
									   <th>상품명</th>
									   <th>주문수량</th>
									   <th>상품재고</th>
									   <th>납기일자</th>
									   <th>진행현황</th>
									   <th>출고일자</th>
									   <th>담당직원</th>
									   <th>출고처리</th>
									</tr>
									
									<c:forEach var="op" items="${outproductList}">
										<tr>
										    <td>
										    	<c:choose>
													<c:when test="${empty op.op_id || op.op_id == '0'}"> </c:when>
													<c:otherwise>${op.op_id }</c:otherwise>
												</c:choose>
										    </td>
										    <td>${op.cont_id }</td>
										    <td>
										    	<c:choose>
										    		<c:when test="${op.op_process.equals('출고완료') }">
										    			<a href="info?cont_id=${op.cont_id }&product_id=${op.product_id}"
										    			   onclick="window.open(this.href, '_blank', 'width=900, height=320, left=510, top=365'); return false;">
										    			   <img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="10px" height="10px" alt="image" />
										    			</a>
										    		</c:when>
										    		<c:when test="${op.op_process.equals('미출고') }"> 
										    			<a href="info?cont_id=${op.cont_id }&product_id=${op.product_id}"
										    			   onclick="window.open(this.href, '_blank', 'width=900, height=400, left=510, top=365'); return false;">
										    			   <img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="10px" height="10px" alt="image" />
										    			</a>					
											    	</c:when>
										    	</c:choose>
										    </td>
										    <td>${op.cust_name }</td>
										    <td>${op.product_name }</td>
										    <td>${op.cont_qty }</td>
										    <td>
										    	<c:choose>
										    		<c:when test="${op.op_process.equals('출고완료') }">
										    			${op.tmp_qty }
										    		</c:when>
										    		<c:otherwise>
										    			${op.product_qty }
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										    <td>${op.due_date }</td>
										    <td>${op.op_process}</td>
										    <td>${op.op_date}</td>
										    <td>
										    	<c:choose>
													<c:when test="${empty op.emp_name }"> </c:when>
													<c:otherwise>${op.emp_name }</c:otherwise>
												</c:choose>
										    </td>
										    <td>
										    	<c:choose>
													<c:when test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
														<c:if test="${op.op_process eq '미출고' }">
															<input type="button" id="opid" class="btn btn-success" value="출고처리"
													       		   onclick="location.href='/purchasing/outProduct/opid?cont_id=${op.cont_id }&product_qty=${op.product_qty }';">
														</c:if>
													</c:when>
													<c:otherwise> </c:otherwise>
												</c:choose>
										    </td>
										</tr>
									</c:forEach>
								</table>
								
								
							<!-- 	페이징 처리  -->
							<div class="template-demo">
								<div class="btn-group" role="group" aria-label="Basic example">
									<c:if test="${pvo.startPage > pvo.pageBlock }">
										<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage-pvo.pageBlock}&op_id=${pvo.op_id}&product_name=${pvo.product_name}&startDate=${pvo.startDate}&endDate=${pvo.endDate}&op_empName=${pvo.op_empName}&op_process=${pvo.op_process}" class="btn btn-outline-secondary">이전</a>
									</c:if>
									
									<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
										<a href="/purchasing/outProduct/list?pageNum=${i }&op_id=${pvo.op_id}&product_name=${pvo.product_name}&startDate=${pvo.startDate}&endDate=${pvo.endDate}&op_empName=${pvo.op_empName}&op_process=${pvo.op_process}" class="btn btn-outline-secondary">${i }</a>
									</c:forEach>
									
									<c:if test="${pvo.endPage<pvo.pageCount }">
										<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage+pvo.pageBlock}&op_id=${pvo.op_id}&product_name=${pvo.product_name}&startDate=${pvo.startDate}&endDate=${pvo.endDate}&op_empName=${pvo.op_empName}&op_process=${pvo.op_process}" class="btn btn-outline-secondary">다음</a>
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

<%@ include file="../../includes/footer.jsp" %>

</body>
</html>