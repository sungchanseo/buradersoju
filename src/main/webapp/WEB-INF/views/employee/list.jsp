<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
.btn-outline-light {
	color: #6C7293;
	border-color: #6C7293;}
.btn-outline-light:hover {
	color: #000;
	background-color: #0ddbb9;
	border-color: #6C7293;}
.auth .auth-form-light select {
    color: #6C7293;
    border-radius: 10px;
    padding: 6px 6px;
    text-align: center;
    display: inline;}
.btn_line1 {
margin-bottom: 1em;;}
input {
	border-radius: 10px;
    padding: 6px 6px;}
    
</style>
<body>
	<!-- 사원등록 새창열기  -->
	<script type="text/javascript">
		function insertPop(){
			var insertPop = window.open('/employee/insert', '사원등록', 'width=1110px,height=425px');
			
			if(insertPop == null){
			 alert("팝업이 차단되었습니다. 차단을 해제하세요.");
			}
			openPop.moveBy(100,100);
		}
		
		function infoPop(empId){
			var insertPop = window.open('/employee/info?emp_id=' + empId, '사원정보', 'width=1110px,height=425px');
			
			if(insertPop == null){
			 alert("팝업이 차단되었습니다. 차단을 해제하세요.");
			}
			openPop.moveBy(100,100);
		}
	</script>
	
	<!-- 사원등록 새창열기  -->
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="main-panel">
				<div class="content-wrapper d-flex align-items-center auth px-0">
					<div class="row w-100 mx-0">
						<div class="col-lg-12 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
								<form action="/employee/list" method="get" style="display:inline;" role="form">
									<div class="form-group">								
									<h1>사원리스트</h1>
									<div class="btn_line1">
										<!-- 검색창기능 -->
										<select name="selector" class="auth auth-form-light select">
											<option value="emp_name">이름</option>
											<option value="emp_department">부서</option>
											<option value="emp_status">재직구분</option>
										</select>
										<input type="text" name="search" placeholder="검색어를 입력해주세요">
										<input type="submit" class="btn btn-info" value="검색">
										<!-- 검색창기능 -->
																	
										<c:if test="${emp_department.equals('인사팀') || emp_department.equals('Master') }">
											<input type="button" class="btn btn-success" style="float: right;" value="사원등록" onclick="insertPop()">
										</c:if>
									</div>
									<table border="1" class="table table-hover table-bordered text-center">
										<tr>
											<th style="width: 60px">사번</th>
											<th>이름</th>
											<th>부서</th>
											<th>직급</th>
											<th>입사일</th>
											<th>내선번호</th>
											<th>재직구분</th>
										</tr>
										<c:forEach var="vo" items="${employeeList }">
											<tr>
												<td>
													<input class="btn btn-outline-light btn-fw" type="button" value="${vo.emp_id }" 
														<c:if test="${emp_department.equals('인사팀') || emp_department.equals('Master') }">
															onclick="infoPop(${vo.emp_id})"
														</c:if>
													>
												</td>
												<td>${vo.emp_name }</td>
												<td>${vo.emp_department }</td>
												<td>${vo.emp_position }</td>
												<td>${vo.join_date }</td>
												<td>${vo.emp_tel }</td>
												<td>${vo.emp_status }</td>
											</tr>
										</c:forEach>
									</table>
									<!-- 이 곳에 내용 작성하시면 됩니다  -->
									</div>
									<!-- 	페이징 처리  -->
									<div class="template-demo">
										<div class="btn-group" role="group" aria-label="Basic example">
											<c:if test="${pvo.startPage > pvo.pageBlock }">
												<a href="/employee/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
											</c:if>
											
											<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
												<a href="/employee/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
											</c:forEach>
											
											<c:if test="${pvo.endPage<pvo.pageCount }">
												<a href="/employee/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
											</c:if>
										</div>
									</div>
									<!-- 	페이징 처리  -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp" %>