<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />

<head>

<%@ include file="../includes/header.jsp" %>
	
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
	
	.element {
	  overflow-x: hidden;
	  overflow-y: auto;
	}
	
	/* 작업지시번호 css 적용 */
	a {
	  text-decoration: none; /* 밑줄 제거 */
	  color: inherit; /* 기본 글씨색으로 설정 */
	}
	a:hover {
	  color: #0ddbb9; /* 호버 시 글씨색 변경 */
	}
	
	/* 스크롤 시 테이블 헤더 고정 */
	#ttt th {
    position: sticky;
    top: 0px;
    background-color: white !important;
}

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

								
								<h1>생산 현황</h1>
								
								
								<div> <!-- 탭 영역 시작 -->
									<!-- 탭 메뉴 -->
									<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
										<li class="nav-item">
											<a class="nav-link ps-2 pe-2 active" id="total-tab" data-bs-toggle="tab" href="#total" role="tab" aria-controls="total" aria-selected="true">전체</a>
										</li>
										<li class="nav-item">
											<a class="nav-link ps-2 pe-2" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="false">혼합</a>
										</li>
										<li class="nav-item">
											<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">주입</a>
										</li>
										<li class="nav-item">
											<a class="nav-link ps-2 pe-2" id="stage3-tab" data-bs-toggle="tab" href="#stage3" role="tab" aria-controls="stage3" aria-selected="false">포장</a>
										</li>
									</ul>
									
									<!-- 탭 내용 -->
									<div class="tab-content tab-no-active-fill-tab-content">
									
										<!-- 기본탭(전체) -->
										<div class="tab-pane fade active show" id="total" role="tabpanel" aria-labelledby="total-tab">
											<!-- 본문 상단 -->
											<div class="d-flex justify-content-between">
												<!-- 검색 기능 -->
												<form id="searchForm" action="/production/list" method="get" style="display: inline;">
													<select name="selector">
														<option value="production_id">작업지시번호</option>
														<option value="production_line">생산라인</option>
														<option value="production_emp">생산담당자</option>
													</select> 
													<input id="searchInput" type="text" class="form-control" style="width:250px; display:inline;" name="search" placeholder="검색어를 입력해주세요">
													<input id="searchButton" type="submit"  class="btn btn-info" value="검색">
												</form>												
												<!-- 검색 기능 -->
											 
											  <!-- 등록 버튼 -->
											  <div style="float:right; display:inline;">
												  <c:if test="${emp_department.equals('생산') || emp_department.equals('생산팀') || emp_department.equals('Master')}">
												  <button type="button" onclick="openPopup('insertStage1');" class="btn btn-success">혼합 등록</button>
												  <button type="button" onclick="openPopup('insertStage2');" class="btn btn-success">주입 등록</button>
												  <button type="button" onclick="openPopup('insertStage3');" class="btn btn-success">포장 등록</button>
												  </c:if>
<!-- 										  <button id="excel" class="btn btn-Light" 엑셀파일</button> -->
										  	  <button id="print-button" onclick="info_print()" class="btn btn-Light">인쇄하기</button>											  
											  </div>											  
											</div>
											<!-- 본문 -->
											  <div style="overflow:auto; overflow-x:hidden; height:380px;">
											  <table class="table table-color" id="ttt">
											  <tbody>
											    <tr>
											      <th>작업지시번호</th>
											      <th>생산라인</th>
											      <th>상품코드</th>
											      <th>상품명</th>
											      <th>작업지시수량</th>
											      <th>생산수량</th>                                           
											      <th>불량수량</th>
											      <th>불량률</th>
											      <th>생산담당자</th>
											      <th>생산단계</th>
											      <th>작업완료일시</th>
											    </tr>
											    <c:forEach var="productionList" items="${productionList}">
											        <tr>
											          <td>
											            <a href="/workOrder/info?production_id=${productionList.production_id}"
											            onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
											            ${productionList.production_id}
											            </a>
											          </td>
											          <td>${productionList.production_line}</td>
											          <td>${productionList.product_id}</td>
											          <td>${productionList.product_name}</td>
											          <td>${productionList.plan_qty}</td>
											          <td>${productionList.production_qty}</td>
											          <td>
											          <c:set var="production_defQty" value="${productionList.stage1_defQty + productionList.stage2_defQty + productionList.stage3_defQty}" />
											          ${production_defQty}
											          </td>
											          <td>
											           <c:set var="defectRate" value="${(production_defQty * 100) / productionList.plan_qty}" />
											           <c:choose>
											            <c:when test="${defectRate > 2}">
											             <span style="color: red;">
														  <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
														 </span>
											            </c:when>
											            <c:when test="${defectRate > 0}">
														 <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
											            </c:when>
											            <c:otherwise>
											             <!-- 값이 없을 경우 비워둠 -->
											            </c:otherwise>
											           </c:choose>
											          </td>
											          <td>${productionList.emp_name}</td>
											          <td>${productionList.production_status}</td>
											          <td>
												         <!-- 출력할 작업완료일시 컬럼 선택 -->
												          <c:choose>
												            <c:when test="${not empty productionList.stage3_date}">
<%-- 												              ${productionList.stage3_date} --%>
												          	  <fmt:formatDate value="${productionList.stage3_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
												            </c:when>
												            <c:when test="${not empty productionList.stage2_date}">
<%-- 												              ${productionList.stage2_date} --%>
												              <fmt:formatDate value="${productionList.stage2_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
												            </c:when>
												            <c:when test="${not empty productionList.stage1_date}">
<%-- 												              ${productionList.stage1_date} --%>
															  <fmt:formatDate value="${productionList.stage1_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
												            </c:when>
												            <c:otherwise>
												              <!-- 작업완료일시가 없을 경우 비워둠 -->
												            </c:otherwise>
												          </c:choose>
											          </td>
											        </tr>								 
											    </c:forEach>
											  </tbody>
											</table>
											</div>
										<!--  페이징 처리  -->
<!-- 										<div class="template-demo"> -->
<!-- 											<div class="btn-group" role="group" aria-label="Basic example"> -->
<%-- 												<c:if test="${pvo.startPage > pvo.pageBlock }"> --%>
<%-- 													<a href="/production/list?tab=total&pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a> --%>
<%-- 												</c:if> --%>
												
<%-- 												<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1"> --%>
<%-- 													<a href="/production/list?tab=total&pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a> --%>
<%-- 												</c:forEach> --%>
												
<%-- 												<c:if test="${pvo.endPage<pvo.pageCount }"> --%>
<%-- 													<a href="/production/list?tab=total&pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a> --%>
<%-- 												</c:if> --%>
<!-- 											</div> -->
<!-- 										</div>										 -->
										<!--  페이징 처리  -->
										</div> <!-- 기본탭(전체) -->
										
										<!-- 탭1(혼합) -->
										<div class="tab-pane fade" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
										  <!-- 본문 상단 -->
										  <div class="d-lg-flex justify-content-between">
												<!-- 검색 기능 -->
												<form action="/production/list" method="get" style="display: inline;">
													<select name="selector">
														<option value="production_id">작업지시번호</option>
														<option value="production_line">생산라인</option>
														<option value="production_emp">생산담당자</option>
													</select> 
													<input type="text" class="form-control" style="width:250px; display:inline;" name="search" placeholder="검색어를 입력해주세요">
													<input type="submit"  class="btn btn-info" value="검색">
												</form>												
												<!-- 검색 기능 -->	
  											  <!-- 등록 버튼 -->
											  <div style="float:right; display:inline;">
												  <c:if test="${emp_department.equals('생산') || emp_department.equals('생산팀') || emp_department.equals('Master')}">
												  <button type="button" onclick="openPopup('modifyStage1');" class="btn btn-info">수정</button>
												  <button type="button" onclick="openPopup('insertStage1');" class="btn btn-success">혼합 등록</button>
												  </c:if>
<!-- 										  <button id="excel" class="btn btn-Light">엑셀파일</button> -->
											  <button id="print-button" onclick="info_print()" class="btn btn-Light">인쇄하기</button>												  
											  </div>																					  
										  </div>
										  <!-- 본문 -->
											<div style="overflow:auto; overflow-x:hidden; height:380px;">										  
										    <table class="table table-color">
											  <tbody>
											    <tr>
											      <th>작업지시번호</th>
											      <th>생산라인</th>
											      <th>상품코드</th>
											      <th>상품명</th>
											      <th>작업지시수량</th>                                           
											      <th>불량수량</th>
											      <th>불량률</th>
											      <th>생산담당자</th>
											      <th>생산단계</th>
											      <th>작업완료일시</th>
											    </tr>
											    <c:forEach var="productionList" items="${productionList}">
											      <c:if test="${productionList.production_status == '혼합'}">
											        <tr>  
											          <td>
											            <a href="/workOrder/info?production_id=${productionList.production_id}"
											            onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
											            ${productionList.production_id}
											            </a>
											          </td>
											          <td>${productionList.production_line}</td>
											          <td>${productionList.product_id}</td>
											          <td>${productionList.product_name}</td>
											          <td>${productionList.plan_qty}</td>
											          <td>${productionList.stage1_defQty}</td>
											          <td>
											           <c:set var="defectRate" value="${(productionList.stage1_defQty * 100) / productionList.plan_qty}" />
     												   <c:choose>
											            <c:when test="${defectRate > 2}">
											             <span style="color: red;">
														  <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
														 </span>
											            </c:when>     												   
											            <c:when test="${defectRate >= 0}">
														 <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
											            </c:when>
											            <c:otherwise>
											             <!-- 값이 없을 경우 비워둠 -->
											            </c:otherwise>
											           </c:choose>
											          </td>
											          <td>${productionList.emp_name}</td>
											          <td>${productionList.production_status}</td>
											          <td><fmt:formatDate value="${productionList.stage1_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											        </tr>	
											      </c:if>								 
											    </c:forEach>
											  </tbody>
											</table>
											</div>										
										</div> <!-- 탭1(혼합) -->
										
										<!-- 탭2(주입) -->
										<div class="tab-pane fade" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
											<!-- 본문 상단 -->
											<div class="d-flex justify-content-between">
												<!-- 검색 기능 -->
												<form action="/production/list" method="get" style="display: inline;">
													<select name="selector">
														<option value="production_id">작업지시번호</option>
														<option value="production_line">생산라인</option>
														<option value="production_emp">생산담당자</option>
													</select> 
													<input type="text" class="form-control" style="width:250px; display:inline;" name="search" placeholder="검색어를 입력해주세요">
													<input type="submit"  class="btn btn-info" value="검색">
												</form>												
												<!-- 검색 기능 -->
  											  <!-- 등록 버튼 -->
											  <div style="float:right; display:inline;">
												  <c:if test="${emp_department.equals('생산') || emp_department.equals('생산팀') || emp_department.equals('Master')}">
												  <button type="button" onclick="openPopup('modifyStage2');" class="btn btn-info">수정</button>
												  <button type="button" onclick="openPopup('insertStage2');" class="btn btn-success">주입 등록</button>
												  </c:if>
<!-- 										  <button id="excel" class="btn btn-Light">엑셀파일</button> -->
											  <button id="print-button" onclick="info_print()" class="btn btn-Light">인쇄하기</button>	
											  </div>											  											
											</div>
											<!-- 본문 -->
											<div style="overflow:auto; overflow-x:hidden; height:380px;">											
											<table class="table table-color">
											  <tbody>
											    <tr>
											      <th>작업지시번호</th>
											      <th>생산라인</th>
											      <th>상품코드</th>
											      <th>상품명</th>
											      <th>작업지시수량</th>                                           
											      <th>불량수량</th>
											      <th>불량률</th>
											      <th>생산담당자</th>
											      <th>생산단계</th>
											      <th>작업완료일시</th>
											    </tr>
											    <c:forEach var="productionList" items="${productionList}">
											      <c:if test="${productionList.production_status == '주입'}">
											        <tr>  
											          <td>
											            <a href="/workOrder/info?production_id=${productionList.production_id}"
											            onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
											            ${productionList.production_id}
											            </a>
											          </td>
											          <td>${productionList.production_line}</td>
											          <td>${productionList.product_id}</td>
											          <td>${productionList.product_name}</td>
											          <td>${productionList.plan_qty}</td>
											          <td>${productionList.stage2_defQty}</td>
											          <td>
											           <c:set var="defectRate" value="${(productionList.stage2_defQty * 100) / productionList.plan_qty}" />
      												   <c:choose>
											            <c:when test="${defectRate > 2}">
											             <span style="color: red;">
														  <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
														 </span>
											            </c:when> 											            
											            <c:when test="${defectRate >= 0}">
											             <%-- 불량률 계산 --%>
														 <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
											            </c:when>
											            <c:otherwise>
											             <!-- 값이 없을 경우 비워둠 -->
											            </c:otherwise>
											           </c:choose>
											          </td>
											          <td>${productionList.emp_name}</td>
											          <td>${productionList.production_status}</td>
											          <td><fmt:formatDate value="${productionList.stage2_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											        </tr>	
											      </c:if>								 
											    </c:forEach>
											  </tbody>
											</table>
											</div>											
										</div> <!-- 탭2(주입) -->
										
										<!-- 탭3(포장) -->
										<div class="tab-pane fade" id="stage3" role="tabpanel" aria-labelledby="stage3-tab">
											<!-- 본문 상단 -->
											<div class="d-flex justify-content-between">
												<!-- 검색 기능 -->
												<form action="/production/list" method="get" style="display: inline;">
													<select name="selector">
														<option value="production_id">작업지시번호</option>
														<option value="production_line">생산라인</option>
														<option value="production_emp">생산담당자</option>
													</select> 
													<input type="text" class="form-control" style="width:250px; display:inline;" name="search" placeholder="검색어를 입력해주세요">
													<input type="submit"  class="btn btn-info" value="검색" onsubmit="search()">
												</form>												
												<!-- 검색 기능 -->
  											  <!-- 등록 버튼 -->
											  <div style="float:right; display:inline;">
												  <c:if test="${emp_department.equals('생산') || emp_department.equals('생산팀') || emp_department.equals('Master')}">
												  <button type="button" onclick="openPopup('modifyStage3');" class="btn btn-info">수정</button>
												  <button type="button" onclick="openPopup('insertStage3');" class="btn btn-success">포장 등록</button>
												  </c:if>
<!-- 										  <button id="excel" class="btn btn-Light">엑셀파일</button> -->
											  <button id="print-button" onclick="info_print()" class="btn btn-Light">인쇄하기</button>												  
											  </div>											  
											</div>
											<!-- 본문 -->
											<div style="overflow:auto; overflow-x:hidden; height:380px;">
											<table class="table table-color">
											  <tbody>
											    <tr>
											      <th>작업지시번호</th>
											      <th>생산라인</th>
											      <th>상품코드</th>
											      <th>상품명</th>
											      <th>작업지시수량</th>                                           
											      <th>불량수량</th>
											      <th>불량률</th>
											      <th>생산담당자</th>
											      <th>생산단계</th>
											      <th>작업완료일시</th>
											    </tr>
											    <c:forEach var="productionList" items="${productionList}">
											      <c:if test="${productionList.production_status == '포장'}">
											        <tr>  
											          <td>
											            <a href="/workOrder/info?production_id=${productionList.production_id}"
											            onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
											            ${productionList.production_id}
											            </a>
											          </td>
											          <td>${productionList.production_line}</td>
											          <td>${productionList.product_id}</td>
											          <td>${productionList.product_name}</td>
											          <td>${productionList.plan_qty}</td>
											          <td>${productionList.stage3_defQty}</td>
											          <td>
											           <c:set var="defectRate" value="${(productionList.stage3_defQty * 100) / productionList.plan_qty}" />
      												   <c:choose>
											            <c:when test="${defectRate > 2}">
											             <span style="color: red;">
														  <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
														 </span>
											            </c:when>       												   
											            <c:when test="${defectRate >= 0}">
											             <%-- 불량률 계산 --%>
														 <fmt:formatNumber value="${defectRate}" pattern="###0.###" />%
											            </c:when>
											            <c:otherwise>
											             <!-- 값이 없을 경우 비워둠 -->
											            </c:otherwise>
											           </c:choose>
											          </td>
											          <td>${productionList.emp_name}</td>
											          <td>${productionList.production_status}</td>
											          <td><fmt:formatDate value="${productionList.stage3_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											        </tr>	
											      </c:if>								 
											    </c:forEach>
											  </tbody>
											</table>
											</div>											
										</div> <!-- 탭3(포장) -->
									</div>  <!-- 탭 내용 -->	
								</div> <!-- 탭 영역 끝 -->								
							
							
							<script type="text/javascript">
							
							 // 검색 버튼 클릭 이벤트 처리
						     document.getElementById("searchButton").addEventListener("click", function() {
						    	 console.log("폼 제출");
						        var form = document.getElementById("searchForm");
						        var input = document.getElementById("searchInput");
						        
						        // 검색어가 비어있지 않은 경우에만 폼 전송
						        if (input.value.trim() === "") {
						            return false; // 폼 전송 중단
						        }
						    });

							/* 등록 버튼 팝업 */
							function openPopup(pageName) {
								window.open('./' + pageName, 'productionPopup', 'width=800, height=500, left=2000');
							}

							/* 인쇄 버튼 기능 */
							function info_print() {
								window.print();
							}
							
							
							</script>
							

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>