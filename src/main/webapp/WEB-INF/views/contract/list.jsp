<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> <!-- 제이쿼리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->

	<style type="text/css">
		/* 인쇄하기 가로 기본출력 지정 */
		@page { size: A4 landscape; margin:0; }
	</style>

</head>
<body>
<div class="card-body">
		<h1 class="card-title">
			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수주 리스트</font></font>
		</h1>

		<!-- 검색창기능 -->
		<form action="/customer/list" method="get" style="display: inline;">
			<select name="selector">
				<option value="cust_name">상품명</option>
				<option value="cust_id">수주처</option>
			</select> <input type="text" name="search" placeholder="검색어를 입력해주세요">
			<input type="submit" class="btn btn-info" value="검색">
		</form>
		<!-- 검색창기능 -->

		<!-- 영업팀이 아닐때 버튼 감추기 -->
		<c:if test="${emp_department.equals('영업') || emp_department.equals('영업팀')}">
			<button type="button" class="btn btn-success" onclick="openPop();">수주등록</button>
		</c:if>
			<button type="button" class="btn btn-light">엑셀다운</button>
			<button type="button" class="btn btn-light" id="print" onclick="printPage();">출력하기</button>
		<!-- 영업팀이 아닐때 버튼 감추기 -->

		<!-- 수주목록 테이블 -->
		<div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수주번호</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품코드</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품명</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수주처</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수주일</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수주량</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">납기일</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작업지시번호</font></font></th>
                          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자</font></font></th>
                        </tr>
                      </thead>
                      <c:forEach var="vo" items="${contractList }">
	                      <tbody>
	                        <tr>
 								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cont_id}');">${vo.cont_id }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cont_id}');">${vo.product_id }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cont_id}');">${vo.product_name }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_name }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cont_date }</font></font></td>								
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cont_qty }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.due_date }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.production_id }</font></font></td>
								<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cont_emp }</font></font></td>
	                        </tr>
	                      </tbody>
                      	</c:forEach>
                    </table>
                  </div>
                </div>
		<!-- 수주목록 테이블 -->
		
	<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/contract/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/contract/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/contract/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	

</body>
	<!-- 수주등록 새창열기  -->
	<script>
		
// 		수주상세정보 보기
		function infoPop(contId){
// 			var contId = document.getElementById("cont_id").value;
			console.log("들어온값 = "+contId);
			var url = '/contract/info?cont_id='+contId;
			var infoPop = window.open(url, '수주상세보기', 'width=1000px,height=400px');
		  
		  if(infoPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
		}//수주상세정보 보기
		
		
		//수주등록 새창열기
		function openPop(){
		  var insertPop = window.open('/contract/insert', '수주등록', 'width=1000px,height=400px');
		  
		  if(insertPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
		  openPop.moveBy(100,100);
		}
		//수주등록 새창열기
		
		
	
		
		
	</script>
<%@ include file="../includes/footer.jsp" %>