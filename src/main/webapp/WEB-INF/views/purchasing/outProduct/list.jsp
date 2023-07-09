<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
											<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">출고 리스트</font></font>
										</h1>
										
										
								<!-- 검색 기능 -->
								<form action="/purchasing/outProduct/list" method="get" style="display: inline;">
									<select name="selector">
										<option value="op_id">출고번호</option>
										<option value="op_date">출고일자</option>
										<option value="product_name">품명</option>
										<option value="op_emp">담당직원</option>
									</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
									<input type="submit"  class="btn btn-info" value="검색">
								</form>
								<br>
								
							<!-- 탭기능 -->
							<div>
								<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
									<li class="nav-item">
										<a class="nav-link ps-2 pe-2 active" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="true">전체</a>
									</li>
									<li class="nav-item">
										<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">미출고</a>
								    </li>
								    <li class="nav-item">
										<a class="nav-link ps-2 pe-2" id="stage3-tab" data-bs-toggle="tab" href="#stage3" role="tab" aria-controls="stage3" aria-selected="false">출고완료</a>
								    </li>
								</ul>
							
							
							<!-- 3개의 테이블을 감싸는 div -->									
							<div class="tab-content tab-no-active-fill-tab-content">
							
								<!-- 1. 전체 탭 테이블 -->
								<div class="tab-pane fade active show" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
								
								<!-- 테이블 -->
								<table border="1" class="table table-hover table-bordered text-center">
									<tr>
									   <th>출고관리번호</th>
									   <th>수주관리번호</th>
									   <th>상세</th>
									   <th>납품처명</th>
									   <th>품명</th>
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
														<c:if test="${empty op.op_id or op.op_id == '0' }">
															<input type="button" class="btn btn-success" value="출고처리"
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
										<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
									</c:if>
									
									<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
										<a href="/purchasing/outProduct/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
									</c:forEach>
									
									<c:if test="${pvo.endPage<pvo.pageCount }">
										<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
									</c:if>
								</div>
							</div>
							<!-- 	페이징 처리  -->
						</div>
						<!-- 1번째 탭기능  -->	
						<!-- 2. 미출고 탭 테이블 -->
				<div class="tab-pane fade show" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
								<!-- 테이블 -->
								<table border="1" class="table table-hover table-bordered text-center">
									<tr>
									   <th>출고관리번호</th>
									   <th>수주관리번호</th>
									   <th>상세</th>
									   <th>납품처명</th>
									   <th>품명</th>
									   <th>주문수량</th>
									   <th>상품재고</th>
									   <th>납기일자</th>
									   <th>진행현황</th>
									   <th>출고일자</th>
									   <th>담당직원</th>
									   <th>출고처리</th>
									</tr>
									
									<c:forEach var="op" items="${outproductList}">
									  <c:if test="${op.op_process.equals('미출고') }">
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
														<c:if test="${empty op.op_id or op.op_id == '0' }">
															<input type="button" class="btn btn-success" value="출고처리"
													       		   onclick="location.href='/purchasing/outProduct/opid?cont_id=${op.cont_id }&product_qty=${op.product_qty }';">
														</c:if>
													</c:when>
													<c:otherwise> </c:otherwise>
												</c:choose>
										    </td>
										  </tr>
										</c:if>
									</c:forEach>
								</table>
					   		</div>
					   <!--2번쨰탭 미출고 끝   -->		
					   <!-- 3번쨰 출고완료 시작   -->	
							<div class="tab-pane fade show" id="stage3" role="tabpanel" aria-labelledby="stage3-tab">
								<!-- 테이블 -->
								<table border="1" class="table table-hover table-bordered text-center">
									<tr>
									   <th>출고관리번호</th>
									   <th>수주관리번호</th>
									   <th>상세</th>
									   <th>납품처명</th>
									   <th>품명</th>
									   <th>주문수량</th>
									   <th>상품재고</th>
									   <th>납기일자</th>
									   <th>진행현황</th>
									   <th>출고일자</th>
									   <th>담당직원</th>
									   <th>출고처리</th>
									</tr>
									
									<c:forEach var="op" items="${outproductList}">
									  <c:if test="${op.op_process.equals('출고완료') }">
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
														<c:if test="${empty op.op_id or op.op_id == '0' }">
															<input type="button" class="btn btn-success" value="출고처리"
													       		   onclick="location.href='/purchasing/outProduct/opid?cont_id=${op.cont_id }&product_qty=${op.product_qty }';">
														</c:if>
													</c:when>
													<c:otherwise> </c:otherwise>
												</c:choose>
										    </td>
									 	</tr>
									  </c:if>	
									</c:forEach>
								  </table>
							   </div>
							  <!-- 3번쨰 출고완료끝  -->
							</div>
				         </div>
				       </div> 
					<!-- 탭기능 전체 div 마무리   -->
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