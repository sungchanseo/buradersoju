<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<body>
	<!-- 사원등록 새창열기  -->
	<script type="text/javascript">
		function insertPop(){
			var insertPop = window.open('/employee/insert', '사원등록', 'width=900px,height=500px');
			
			if(insertPop == null){
			 alert("팝업이 차단되었습니다. 차단을 해제하세요.");
			}
			openPop.moveBy(100,100);
		}
		
		function infoPop(empId){
			var insertPop = window.open('/employee/info?emp_id=' + empId, '사원정보', 'width=900px,height=500px');
			
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
								<form role="form" method="post">
									<div class="form-group">								
									<h1>사원리스트</h1>		
									<table class="table table-hover">
										<tr>
											<th style="width: 60px">사번</th>
											<th>이름</th>
											<th>부서</th>
											<th>직급</th>
											<th>입사일</th>
											<th>내선번호</th>
										</tr>
										<c:forEach var="vo" items="${employeeList }">
											<tr>
												<td><input class="btn btn-dark btn-rounded btn-fw" type="button" value="${vo.emp_id }" onclick="infoPop(${vo.emp_id})"></td>
												<td>${vo.emp_name }</td>
												<td>${vo.emp_department }</td>
												<td>${vo.emp_position }</td>
												<td>${vo.join_date }</td>
												<td>${vo.emp_tel }</td>
											</tr>
										</c:forEach>
									</table>
									<!-- 이 곳에 내용 작성하시면 됩니다  -->
									</div>
									<c:if test="${emp_department.equals('인사팀') || emp_department.equals('인사') }">
										<input type="button" class="btn btn-success btn-fw" value="사원등록" onclick="insertPop()">
									</c:if>
									
									<!-- 	페이징 처리  -->
									<c:if test="${pvo.startPage > pvo.pageBlock }">
										<a href="/employee/list?pageNum=${pvo.startPage-pvo.pageBlock}">이전</a>
									</c:if>
								
									<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
										<a href="/employee/list?pageNum=${i }">${i }</a>
									</c:forEach>
								
									<c:if test="${pvo.endPage < pvo.pageCount }">
										<a href="/employee/list?pageNum=${pvo.startPage + pvo.pageBlock}">다음</a>
									</c:if>
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