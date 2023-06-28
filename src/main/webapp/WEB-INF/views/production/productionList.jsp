<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	  gap: 5px; /* 버튼 사이의 간격 */
	}
	.button-group button {
	  flex: 1; /* 버튼들을 동일한 너비로 설정 */
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

								<!-- 이 곳에 내용 작성하시면 됩니다 -->
							
								
								<h1>생산 현황</h1>
								
								<!-- 검색창기능 -->
								<form action="/production/productionList" method="get">
									<select name="selector">
										<option value="production_id">작업지시번호</option>
										<option value="production_line">생산라인</option>
										<option value="production_emp">생산담당자</option>
										<option value="production_date">작업완료일시</option>
									</select>
									<input type="text" name="search" placeholder="검색어를 입력해주세요">
									<input type="submit" class="btn-info" value="검색">
								</form>
								<!-- 검색창기능 -->
										
								<button type="button" onclick="openPopup();" class="btn btn-success">생산 등록</button>

								<div class="button-group">
								  <button id="excel" 
								  		  class="btn btn-Light" style="padding-left: 1px; padding-right: 1px;">
								  엑셀파일
								  </button>
								  <button id="print-button" onclick="info_print()"
								  		  class="btn btn-Light" style="padding-left: 1px; padding-right: 1px;">
								  인쇄하기
								  </button>
								</div>
										
								<table class="table table-color">
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
									<c:forEach var="productionList" items="${productionList }">
									 <tr>  
									  <td>
										<a href="/workOrder/workOrder?production_id=${productionList.production_id}"
										onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
										${productionList.production_id}
										</a>
									  </td>
									  <td>${productionList.production_line}</td>
									  <td>${productionList.product_id}</td>
									  <td>${productionList.product_name}</td>
									  <td>${productionList.plan_qty}</td>
									  <td>${productionList.production_qty}</td>
									  <td>${productionList.production_qty}</td>
									  <td>
									   	<%-- 불량률 계산 --%>
							            <c:set var="defectRate" 
							            value="${(productionList.plan_qty * 100) / productionList.production_qty}" />
							            ${defectRate}%
							          </td>
									  <td>${productionList.emp_name}</td>
									  <td>${productionList.production_status}</td>
									  <td>${productionList.production_date}</td>
									 </tr>									 
									</c:forEach>
									
								  </tbody>
								</table>
							
								<!-- 	페이징 처리  -->
								<c:if test="${pvo.startPage > pvo.pageBlock }">
									<a href="/production/productionList?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">이전</a>
								</c:if>
							
								<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
									<a href="/production/productionList?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}">${i }</a>
								</c:forEach>
							
								<c:if test="${pvo.endPage<pvo.pageCount }">
									<a href="/production/productionList?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">다음</a>
								</c:if>
								<!-- 	페이징 처리  -->
							
							
							
							<script type="text/javascript">

							/* 등록 버튼 팝업 */
							function openPopup() {
								window.open('./productionInsert', 'productionPopup', 'width=800, height=500, left=2000');
							}

							/* 인쇄 버튼 기능 */
							function info_print() {
								window.print();
							} 
							</script>
							
							
							
								<!-- 이 곳에 내용 작성하시면 됩니다 -->

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