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
</head>
<body>
<script type="text/javascript">
	// 거래처등록 새창열기
	function insertPop(){
	  var insertPop = window.open('/customer/insert', '거래처등록', 'width=1000px,height=400px');
	  
	  if(insertPop == null){
		  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
	  }
	  openPop.moveBy(100,100);
	}
	// 거래처등록 새창열기  

	// 거래처 상세보기 새창열기 
	function infoPop(cust_id){
		var url = "/customer/info?cust_id="+cust_id;
		var infoPop = window.open(url, '거래처등록', 'width=1000px,height=400px');
	  
		if(insertPop == null){
		  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
	  }
	}
// 거래처 상세보기 새창열기 

	//우편번호 자동입력 api 메소드
	function addr() {
		new daum.Postcode({
			    oncomplete : function(data) {
				document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
				document.getElementById("address").value = data.address; // 주소 넣기
			}
		}).open();
	};
	//우편번호 자동입력 api 메소드
</script>

	<h1>거래처 리스트</h1>
	<!-- 검색창기능 -->
	<form action="/customer/list" method="get" style="display:inline;">
		<select name="selector">
			<option value="cust_name">상호</option>
			<option value="cust_id">거래처코드</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" class="btn-danger" value="검색">
	</form>
	<!-- 검색창기능 -->
	<input type="button" value="거래처등록" onclick="insertPop();">
	<input type="button" value="거래처삭제" onclick="location.href='/customer/remove';">
	<hr>
		<table border="1">
			<tr>
				<th></th>
				<th>순번</th>
				<th>거래처코드</th>
				<th>상호</th>
				<th>거래처구분</th>
				<th>대표자명</th>
				<th>대표번호</th>
				<th>주소</th>
				<th>업태</th>
				<th>종목</th>
				<th>담당자이메일</th>
			</tr>
			<c:forEach var="vo" items="${customerList }">
				<tr>
					<td><input type="checkbox">
					<td><a href="#" onclick="infoPop(${vo.cust_id});">${vo.cust_id }</a></td>
					<td><a href="#" onclick="infoPop(${vo.cust_id});">${vo.reg_num }</a></td>
					<td><a href="#" onclick="infoPop(${vo.cust_id});">${vo.cust_name }</a></td>
					<td>${vo.cust_class }</td>
					<td>${vo.owner_name }</td>
					<td>${vo.main_phone }</td>
					<td>${vo.cust_address }</td>
					<td>${vo.cust_business }</td>
					<td>${vo.cust_event }</td>
					<td>${vo.emp_email }</td>
				</tr>
			</c:forEach>
		</table>
	<!-- 	페이징 처리  -->
	<c:if test="${pvo.startPage > pvo.pageBlock }">
		<a href="/customer/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">이전</a>
	</c:if>

	<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
		<a href="/customer/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}">${i }</a>
	</c:forEach>

	<c:if test="${pvo.endPage<pvo.pageCount }">
		<a href="/customer/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}">다음</a>
	</c:if>
	<!-- 	페이징 처리  -->

</body>
<%@ include file="../includes/footer.jsp" %>