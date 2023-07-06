<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function(){
	  
});
</script>
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

							
							<!-- 제목 -->
							<div class="card-body">
								<h1 class="card-title">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">입고 리스트</font></font>
								</h1>
							</div>
							
							
							<!-- 검색 기능 -->
							<form action="/purchasing/inMaterial/list" method="get" style="display: inline;">
								<select name="selector">
									<option value="ma_name">자재명</option>
									<option value="in_date">입고일자</option>
									<option value="emp_name">담당직원</option>
								</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
								<input type="submit"  class="btn btn-info" value="검색">
							</form>
							<br>
					

							<!-- 테이블 -->
							<div>
							 	<fmt:formatDate value=""/> 
								<table border="1" class="table table-hover table-bordered text-center">
								<tr>
									<th>입고번호</th>
									<th>발주번호</th>
									<th>상세</th>
									<th>품명</th>		
									<th>입고량</th>
									<th>재고량</th>
							<!-- 		<th>입고후재고량</th> -->
									<th>진행현황</th>
									<th>창고번호</th>
									<th>선반위치</th>
									<th>입고일자</th>
									<th>입고담당직원</th>
									<th>입고처리</th>
								</tr>
							      
							      <c:forEach var="iml" items="${inMaterialList }" >
							         <tr>
										<td>
											<c:choose>
												<c:when test="${iml.in_id == '0' }"> </c:when>
												<c:otherwise>${iml.in_id }</c:otherwise>
											</c:choose>
										</td>
										<td>${iml.order_id }</td>		
										<td>
											<a href="info?order_id=${iml.order_id }"
											   onclick="window.open(this.href, '_blank', 'width=950, height=300, left=510, top=365'); return false;">
													<img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="10px" height="10px" alt="image" />
											</a>
										</td>
										<td>${iml.ma_name }</td>
										<td>${iml.order_qty }</td>
										<td>
											<c:choose>
												<c:when test="${empty iml.in_id || iml.in_id == '0' || iml.in_id == null }">
													<c:if test="${iml.ma_qty <= 100 }">
														<span style="color:red">${iml.ma_qty }</span>
													</c:if>
													<c:if test="${iml.ma_qty > 100 }">
														${iml.ma_qty }
													</c:if>
												</c:when>
												
												<c:when test="${!empty iml.in_id }">
													<c:if test="${iml.add_ma - iml.order_qty <= 100}">
														<span style="color:red">${iml.add_ma - iml.order_qty }</span>
													</c:if>
													<c:if test="${iml.add_ma - iml.order_qty > 100}">
														${iml.add_ma - iml.order_qty }
													</c:if>
												</c:when>
											</c:choose>
										</td>
							<!-- 			<td> -->
							<%-- 				<c:choose>				 --%>
							<%-- 					<c:when test="${iml.add_ma == 0}"> </c:when> --%>
							<%-- 					<c:when test="${!empty iml.add_ma }">${iml.add_ma }</c:when> --%>
							<%-- 				</c:choose> --%>
							<!-- 			</td> -->
										<td>${iml.in_process }</td>			
										<td>${iml.whs_id }</td>
										<td>${iml.shelt_position }</td>
										<td><fmt:formatDate value="${iml.in_date}" pattern="yyyy-MM-dd"/></td>
										<td>
											<c:choose>
												<c:when test="${empty iml.emp_name }"></c:when>
												<c:otherwise>${iml.emp_name }</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
													<c:if test="${empty iml.in_id or iml.in_id == '0' }">
														<input type="button" class="btn btn-success inidDone" value="입고처리"
												       		   onclick="location.href='/purchasing/inMaterial/inid?order_id=${iml.order_id }&ma_id=${iml.ma_id }';">
													</c:if>
												</c:when>
												<c:otherwise> </c:otherwise>
											</c:choose>
										</td>
							         </tr>
							      </c:forEach>
								</table>
							</div>
							

							<!-- 	페이징 처리  -->
							<div class="template-demo">
								<div class="btn-group" role="group" aria-label="Basic example">
									<c:if test="${pvo.startPage > pvo.pageBlock }">
										<a href="/purchasing/inMaterial/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
									</c:if>
									
									<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
										<a href="/purchasing/inMaterial/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
									</c:forEach>
									
									<c:if test="${pvo.endPage<pvo.pageCount }">
										<a href="/purchasing/inMaterial/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
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