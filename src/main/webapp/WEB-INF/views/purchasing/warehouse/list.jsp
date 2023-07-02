<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

function click_add(){
	var url ="insert";
	var name ="insert";
	var option = "width = 600, height= 600, left =100, top=50,location=no";
	window.open(url,name,option);
}

</script>
</head>
<body>
<br>


<div class="card-body">
	<h1 class="card-title">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">창고 리스트</font></font>
	</h1>
	
	
	<!-- 검색 기능 -->
	<form action="/purchasing/inMaterial/list" method="get" style="display: inline;">
		<select name="selector">
			<option value="ma_name">자재명</option>
			<option value="in_date">입고일자</option>
			<option value="in_emp">담당직원</option>
		</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	
	
	<!-- 구매팀일때만 버튼 활성화 -->
	<c:if test="${emp_department.equals('구매팀')}">
		<div style=float:right;>
			<button class="btn btn-success add-button" type="button" onclick="click_add();">창고등록</button>
		</div>
	</c:if>
	
	
	<!-- 테이블 -->
	<table border="1" class="table table-hover table-bordered text-center">
		<tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		</tr>
		
		<c:forEach var="wh" items="${warehouseList}">
			<tr>
			   <td></td>
		       <td>${wh.whs_id}</td>
		       <td>${wh.whs_type}</td>
		       <td>${wh.whs_tel}</td>
		       <td>
		       	 <c:choose>
		       		<c:when test="${wh.whs_status == 1}">사용중</c:when>
		       		<c:when test="${wh.whs_status == 2}">미사용</c:when>
		       	 </c:choose>
		       </td>
		       <td>${wh.whs_emp}</td>
<%-- 		       <td><a href="/purchasing/warehouse/modify?whs_id=${wh.whs_id}">수정</a></td> --%>
<%-- 		       <td><a href="/purchasing/warehouse/remove?whs_id=${wh.whs_id}">삭제</a></td> --%>
			</tr>
		</c:forEach>
	</table>
</div>





<%@ include file="../../includes/footer.jsp" %>
</body>
</html>